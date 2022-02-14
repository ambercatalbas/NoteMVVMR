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
    func fetchNotesListing()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var didSuccessFetchRecipes: VoidClosure?
    
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
    
    var cellItems: [HomeCellProtocol] = [HomeCellModel(title: "", description: "")]
    private var items: [Note] = []
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
                self.didSuccessFetchRecipes?()
            case .failure(let error):
                print("failure")
            }
        }
    }
}
