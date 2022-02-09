//
//  HomeViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import Foundation

protocol HomeViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol
    func didSelectRow(indexPath: IndexPath)
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
  func didSelectRow(indexPath: IndexPath) {
    router.pushDetail()
  }
  
    
    func numberOfItemsAt(section: Int) -> Int {
     return cellItems.count

    }
    
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [HomeCellProtocol] = [HomeCellModel(titleText: "Not", descriptionText: "ne notu not mu not ne gezer la bazdarda"), HomeCellModel(titleText: "Not", descriptionText: "ne notu not mu not ne gezer la bazdarda"), HomeCellModel(titleText: "Not", descriptionText: "ne notu not mu not ne gezer la bazdarda"), HomeCellModel(titleText: "Not", descriptionText: "ne notu not mu not ne gezer la bazdarda"), HomeCellModel(titleText: "Not", descriptionText: "ne notu not mu not ne gezer la bazdarda ne notu not mu not ne gezer la bazdarda")]
}
