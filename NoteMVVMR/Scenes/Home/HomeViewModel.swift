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
    func didSelectRow(titleText: String, descriptionText: String, noteId: Int)
    func editRow(titleText: String, descriptionText: String, noteId: Int)
    func deleteNote(noteID: Int)
    func fetchNotesListing()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var didSuccessFetchRecipes: VoidClosure?
    var cellItems: [HomeCellProtocol] = [HomeCellModel(title: "", description: "", noteID: 0)]
    private var items: [Note] = []
    
    func editRow(titleText: String, descriptionText: String, noteId: Int) {
        router.pushEdit(titleText: titleText, descriptionText: descriptionText, noteId: noteId)
        self.didSuccessFetchRecipes?()
    }
    func didSelectRow(titleText: String, descriptionText: String, noteId: Int) {
        router.pushDetail(titleText: titleText, descriptionText: descriptionText, noteId: noteId)
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
                print("failure")
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
                print("errorrrrrrr")
            }
        }
    }
}
