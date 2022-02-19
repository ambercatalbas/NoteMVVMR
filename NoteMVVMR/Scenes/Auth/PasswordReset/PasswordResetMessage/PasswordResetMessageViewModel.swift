//
//  PasswordResetMessageViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

import Foundation

protocol PasswordResetMessageViewDataSource {}

protocol PasswordResetMessageViewEventSource {}

protocol PasswordResetMessageViewProtocol: PasswordResetMessageViewDataSource, PasswordResetMessageViewEventSource {
    func showLoginScreen()
}

final class PasswordResetMessageViewModel: BaseViewModel<PasswordResetMessageRouter>, PasswordResetMessageViewProtocol {
  
    func showLoginScreen() {
        router.modalLogin()
    }
    
    
}
