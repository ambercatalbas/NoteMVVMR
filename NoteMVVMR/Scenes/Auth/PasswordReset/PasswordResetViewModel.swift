//
//  PasswordResetViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import Foundation

protocol PasswordResetViewDataSource {}

protocol PasswordResetViewEventSource {}

protocol PasswordResetViewProtocol: PasswordResetViewDataSource, PasswordResetViewEventSource {
    func showLogin()
    func sendResetRequest(email: String)
}

final class PasswordResetViewModel: BaseViewModel<PasswordResetRouter>, PasswordResetViewProtocol {

    func showLogin() {
        router.modalLogin()
    }
   
}
// MARK: - Network
extension PasswordResetViewModel {
    func sendResetRequest(email: String) {
        dataProvider.request(for: PasswordResetRequest(email: email)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print("sccs \(response.message)")
            case .failure(let error):
                print("error reset password")
            }
        }
        router.modalLogin()
    }
    
}
