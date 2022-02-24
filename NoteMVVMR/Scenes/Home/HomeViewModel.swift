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
    
}

protocol HomeViewEventSource {
    var didSuccessFetchRecipes: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func didSelectRow(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
    func editRow(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
    func deleteNote(noteID: Int)
    func addNote(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
    func showProfileScreen()
    func fetchNotesListing()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    func showProfileScreen() {
        router.pushProfile()
    }
    
    func addNote(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        router.pushAdd(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
    }
    
    var didSuccessFetchRecipes: VoidClosure?
    var cellItems: [HomeCellProtocol] = [HomeCellModel(title: "", description: "", noteID: 0)]
    private var items: [Note] = []
    
    func editRow(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        router.pushEdit(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
        self.didSuccessFetchRecipes?()
    }
    func didSelectRow(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        router.pushDetail(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
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
        dataProvider.request(for: GetMyNotesRequest()) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.cellItems.removeAll(keepingCapacity: false)
                let cellItems = response.data.data.map({ HomeCellModel(note: $0) })
                self.cellItems.append(contentsOf: cellItems)
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                ToastPresenter.showWarningToast(text: "\(error.localizedDescription)", entryBackground: .appRed)
            }
        }
    }
    func deleteNote(noteID: Int) {
        dataProvider.request(for: DeleteNoteRequest(noteID: noteID)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.fetchNotesListing()
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                ToastPresenter.showWarningToast(text: "\(error.localizedDescription)", entryBackground: .appRed)
                
            }
        }
    }
}
