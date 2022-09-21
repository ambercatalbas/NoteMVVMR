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
        
        addSubViews()
        configureContents()
        setLocalize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

// MARK: - UILayout
extension ChangePasswordViewController {
    
    private func addSubViews() {
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
        
    }
    
    private func makeNewPasswordTextField() {
        view.addSubview(newPasswordTextField)
        newPasswordTextField.topToBottom(of: passwordTextField).constant = 15
        newPasswordTextField.leftToSuperview().constant = 25
        newPasswordTextField.rightToSuperview().constant = -25
        newPasswordTextField.height(47)
    }
    
    private func makeRetypeNewPasswordTextField() {
        view.addSubview(retypeNewPasswordTextField)
        retypeNewPasswordTextField.topToBottom(of: newPasswordTextField).constant = 15
        retypeNewPasswordTextField.leftToSuperview().constant = 25
        retypeNewPasswordTextField.rightToSuperview().constant = -25
        retypeNewPasswordTextField.height(47)
    }
    
    private func makeSaveButton() {
        view.addSubview(saveButton)
        saveButton.topToBottom(of: retypeNewPasswordTextField).constant = 33
        saveButton.leftToSuperview().constant = 25
        saveButton.rightToSuperview().constant = -25
        saveButton.height(60)
        
    }
}

// MARK: - Configure and SetLocalize
extension ChangePasswordViewController {
    
    private func configureContents() {
        title = Strings.ChangePasswordController.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .hamburgerIcon,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(showHomeScreen))
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        passwordTextField.placeholder = Strings.ChangePasswordController.passwordPlaceholder
        newPasswordTextField.placeholder = Strings.ChangePasswordController.newPasswordPlaceholder
        retypeNewPasswordTextField.placeholder = Strings.ChangePasswordController.retypeNewPasswordPlaceholder
        
    }
    
}

// MARK: - Actions
extension ChangePasswordViewController {
    
    @objc
    private func saveButtonTapped() {
        view.endEditing(true)
        guard let password = passwordTextField.text,
              let newPassword = newPasswordTextField.text,
              let retypeNewPassword = retypeNewPasswordTextField.text,
              passwordTextField.text?.isEmpty == false,
              newPasswordTextField.text?.isEmpty == false,
              retypeNewPasswordTextField.text?.isEmpty == false else {
                  self.showFailureWarningToast(message: Strings.Error.emptyFields)
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

// MARK: - UITextFieldDelegate
extension ChangePasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
