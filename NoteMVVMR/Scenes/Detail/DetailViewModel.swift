//
//  DetailViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

import Foundation
import Alamofire

protocol DetailViewDataSource {}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {
    func createNote(title: String, description: String)
}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
    func createNote(title: String, description: String) {
        dataProvider.request(for: CreateNoteRequest(title: title, description: description)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.router.close()
            case .failure(let error):
                self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
            }
        }
    }
    
}
