//
//  ChangePasswordViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 18.02.2022.
//

import UIKit

final class ChangePasswordViewController: BaseViewController<ChangePasswordViewModel> {
    private let passwordTextField = PasswordTextField()
    private let newPasswordTextField = PasswordTextField()
    private let retypeNewPasswordTextField = PasswordTextField()
    private let saveButton = LoginButton(title: Strings.ChangePasswordController.saveButtonTitle)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Strings.ChangePasswordController.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .hamburgerIcon,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(showHomeScreen))
        drawDesign()
    }
    private func drawDesign() {
        makePasswordTextField()
        makeNewPasswordTextField()
        makeRetypeNewPasswordTextField()
        makeSaveButton()
    }
    private func makePasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.topToSuperview().constant = 122
        passwordTextField.leftToSuperview().constant = 25
        passwordTextField.rightToSuperview().constant = -25
        passwordTextField.height(47)
        passwordTextField.placeholder = Strings.ChangePasswordController.passwordPlaceholder
        
    }
    private func makeNewPasswordTextField() {
        view.addSubview(newPasswordTextField)
        newPasswordTextField.topToBottom(of: passwordTextField).constant = 15
        newPasswordTextField.leftToSuperview().constant = 25
        newPasswordTextField.rightToSuperview().constant = -25
        newPasswordTextField.height(47)
        newPasswordTextField.placeholder = Strings.ChangePasswordController.newPasswordPlaceholder
    }
    private func makeRetypeNewPasswordTextField() {
        view.addSubview(retypeNewPasswordTextField)
        retypeNewPasswordTextField.topToBottom(of: newPasswordTextField).constant = 15
        retypeNewPasswordTextField.leftToSuperview().constant = 25
        retypeNewPasswordTextField.rightToSuperview().constant = -25
        retypeNewPasswordTextField.height(47)
        retypeNewPasswordTextField.placeholder = Strings.ChangePasswordController.retypeNewPasswordPlaceholder
    }
    private func makeSaveButton() {
        view.addSubview(saveButton)
        saveButton.topToBottom(of: retypeNewPasswordTextField).constant = 33
        saveButton.leftToSuperview().constant = 25
        saveButton.rightToSuperview().constant = -25
        saveButton.height(60)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)

    }
    @objc
    private func saveButtonTapped() {
        view.endEditing(true)
        guard let password = passwordTextField.text,
              let newPassword = newPasswordTextField.text,
              let retypeNewPassword = retypeNewPasswordTextField.text,
              passwordTextField.text?.isEmpty == false,
              newPasswordTextField.text?.isEmpty == false,
              retypeNewPasswordTextField.text?.isEmpty == false else {
                  ToastPresenter.showWarningToast(text: Strings.Error.emptyFields, entryBackground: .appRed)
                  return }
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        guard validation.isValidPassword(newPassword) else { return }
        guard validation.isValidPassword(retypeNewPassword) else { return }

        viewModel.changePassword(password: password,
                                 newPassword: newPassword,
                                 retypeNewPassword: retypeNewPassword)
    }
    @objc
    private func showHomeScreen() {
        viewModel.showHomeScreen()
    }
    
}
