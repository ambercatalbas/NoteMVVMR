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
    private let saveButton = LoginButton(title: "Save")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CHANGE PASSWORD"
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
        passwordTextField.placeholder = "Password"
        
    }
    private func makeNewPasswordTextField() {
        view.addSubview(newPasswordTextField)
        newPasswordTextField.topToBottom(of: passwordTextField).constant = 15
        newPasswordTextField.leftToSuperview().constant = 25
        newPasswordTextField.rightToSuperview().constant = -25
        newPasswordTextField.height(47)
        newPasswordTextField.placeholder = "New Password"
    }
    private func makeRetypeNewPasswordTextField() {
        view.addSubview(retypeNewPasswordTextField)
        retypeNewPasswordTextField.topToBottom(of: newPasswordTextField).constant = 15
        retypeNewPasswordTextField.leftToSuperview().constant = 25
        retypeNewPasswordTextField.rightToSuperview().constant = -25
        retypeNewPasswordTextField.height(47)
        retypeNewPasswordTextField.placeholder = "Retype New Password"
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
        viewModel.changePassword(password: passwordTextField.text ?? "",
                                 newPassword: newPasswordTextField.text ?? "",
                                 retypeNewPassword: retypeNewPasswordTextField.text ?? "")
    }
    @objc
    private func showHomeScreen() {
        viewModel.showHomeScreen()
    }
    
}
