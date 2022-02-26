//
//  LoginViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 1.02.2022.
//

import Foundation
import Alamofire
import KeychainSwift

protocol LoginViewDataSource {
}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func showRegisterOnWindow()
    func sendLoginRequest(email: String, password: String)
    func showPasswordResetScene(isBackScrenLogin: Bool)
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    let keychain = KeychainSwift()
    
    func showRegisterOnWindow() {
        router.modalRegister()
    }
    
    func showPasswordResetScene(isBackScrenLogin: Bool) {
        router.modalPasswordReset(isBackScrenLogin: isBackScrenLogin)
    }
    
    func sendLoginRequest(email: String, password: String) {
        
        dataProvider.request(for: LoginRequest(email: email, password: password)) { [weak self] result in
          
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.keychain.set(response.data?.accessToken ?? "", forKey: Keychain.token)
                self.router.pushHome()
            case .failure(let error):
                ToastPresenter.showWarningToast(text: Strings.Error.invalidMatch, entryBackground: .appRed)
            }
        }
        
    }
    
}
