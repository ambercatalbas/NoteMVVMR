//
//  HomeViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import Foundation
import SwiftUI
import UIComponents

protocol HomeViewDataSource {
    
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol
    
    var page: Int { get set }
}

protocol HomeViewEventSource {
    var didSuccessFetchRecipes: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    
    func didSelectRow(note: Note, type: DetailVCShowType)
    func editRow(note: Note, type: DetailVCShowType)
    func deleteNote(noteID: Int)
    func addNote(note: Note, type: DetailVCShowType)
    func showProfileScreen()
    func fetchNotesListing()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var page: Int = 1
    var isPagingEnabled = false
    var isRequestEnabled = false
    
    func showProfileScreen() {
        router.pushProfile()
    }
    
    func addNote(note: Note, type: DetailVCShowType) {
        router.pushDetail(note: note, type: type)
    }
    
    var didSuccessFetchRecipes: VoidClosure?
    var cellItems: [HomeCellProtocol] = [HomeCellModel(title: "", description: "", noteID: 0)]
    private var items: [Note] = []
    
    func editRow(note: Note, type: DetailVCShowType) {
        router.pushDetail(note: note, type: type)
        self.didSuccessFetchRecipes?()
    }
    
    func didSelectRow(note: Note, type: DetailVCShowType) {
        router.pushDetail(note: note, type: type)
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
        
    }
    
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }
    
}

// MARK: - Network
extension HomeViewModel {
    
    func fetchNotesListing() {
        self.page = 1
        self.isRequestEnabled = false
        dataProvider.request(for: GetMyNotesRequest(page: page)) { [weak self] (result) in
            guard let self = self else { return }
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                self.cellItems.removeAll(keepingCapacity: false)
                let cellItems = response.data.data.map({ HomeCellModel(note: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.data.currentPage < response.data.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                self.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
    
    func fetchMoreNotesListing() {
        
        self.isRequestEnabled = false
        dataProvider.request(for: GetMyNotesRequest(page: page)) { [weak self] (result) in
            guard let self = self else { return }
            self.isRequestEnabled = true
            switch result {
            case .success(let response):
                if self.page == 1 {
                    self.cellItems.removeAll(keepingCapacity: false)
                }
                let cellItems = response.data.data.map({ HomeCellModel(note: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.page += 1
                self.isPagingEnabled = response.data.currentPage < response.data.lastPage
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                self.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
    
    func deleteNote(noteID: Int) {
        dataProvider.request(for: DeleteNoteRequest(noteID: noteID)) { [weak self] (result) in
            guard let self = self else { return }
            self.isRequestEnabled = true
            switch result {
            case .success:
                self.page = 1
                self.fetchNotesListing()
            case .failure(let error):
                self.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
}
