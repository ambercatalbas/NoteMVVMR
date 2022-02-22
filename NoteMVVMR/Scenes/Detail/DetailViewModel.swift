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
    func updateNote(title: String, description: String, noteID: Int)
    func showHomeScreen()
}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
    func showHomeScreen() {
        router.close()
    }

    func createNote(title: String, description: String) {
        dataProvider.request(for: CreateNoteRequest(title: title, description: description)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                NotificationCenter.default.post(name: .reloadDataNotification, object: nil)
                self.router.close()
            case .failure(let error):
                self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
            }
        }
    }
    func updateNote(title: String, description: String, noteID: Int) {
     dataProvider.request(for: UpdateNoteRequest(title: title, description: description, noteID: noteID)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                NotificationCenter.default.post(name: .reloadDataNotification, object: nil)
                self.router.close()
            case .failure(let error):
                print("errorupdate")
            }
        }
    }
}
