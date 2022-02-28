//
//  ChangePasswordViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 18.02.2022.
//

import Foundation

protocol ChangePasswordViewDataSource {}

protocol ChangePasswordViewEventSource {}

protocol ChangePasswordViewProtocol: ChangePasswordViewDataSource, ChangePasswordViewEventSource {
    
    func changePassword(password: String, newPassword: String, retypeNewPassword: String)
    func showHomeScreen()
}

final class ChangePasswordViewModel: BaseViewModel<ChangePasswordRouter>, ChangePasswordViewProtocol {
    
    func changePassword(password: String, newPassword: String, retypeNewPassword: String) {
        dataProvider.request(for: ChangePasswordRequest(password: password, newPassword: newPassword, newPasswordConfirmation: retypeNewPassword)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                ToastPresenter.showWarningToast(text: Strings.Success.succesChangePassword, entryBackground: .appGreen)
            case .failure(let error):
                ToastPresenter.showWarningToast(text: Strings.Error.checkInformations, entryBackground: .appRed)
            }
        }
    }
    
    func showHomeScreen() {
        router.close()
    }
    
}
