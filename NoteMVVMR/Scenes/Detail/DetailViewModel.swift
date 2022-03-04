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
    func updateNote(note: Note)
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
            case .success(_):
                NotificationCenter.default.post(name: .reloadDataNotification, object: nil)
                self.router.close()
            case .failure(let error):
                self.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
    
    func updateNote(note: Note) {
        
        dataProvider.request(for: UpdateNoteRequest(note: note)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                NotificationCenter.default.post(name: .reloadDataNotification, object: nil)
                self.router.close()
            case .failure(let error):
                self.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
}
