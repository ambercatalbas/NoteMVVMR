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
    func didSelectRow(indexPath: IndexPath)
    func editRow()
    func deleteNote(noteID: Int)
    func fetchNotesListing()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var didSuccessFetchRecipes: VoidClosure?
    var cellItems: [HomeCellProtocol] = [HomeCellModel(title: "", description: "", noteID: 0)]
    private var items: [Note] = []
    
    func editRow() {
        router.pushDetail()
    }
    func didSelectRow(indexPath: IndexPath) {
        router.pushDetail()
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
                let cellItems = response.data.data.map({ HomeCellModel(note: $0) })
                self.cellItems.append(contentsOf: cellItems)
//                self.didSuccessFetchRecipes?()
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
                print("delete noteeee\(noteID)")
            case .failure(let error):
                print("errorrrrrrr")
            }
        }
    }
}
