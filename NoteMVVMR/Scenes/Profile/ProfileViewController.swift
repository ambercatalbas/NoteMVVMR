//
//  ProfileViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import UIKit
import MobilliumBuilders
import UIComponents

final class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    private let userNameTextField = UserNameTextField()
    private let emailTextField = EmailTextField()
    private let saveButton = LoginButton(title: Strings.ProfileViewController.saveButtonTitle)
    private let changePasswordButton = LabelButton(title: Strings.ProfileViewController.changePasswordButtonTitle,
                                                   titleColor: .appBlueBerry,
                                                   font: .font(.josefinSansSemibold, size: .custom(size: 14)))
    private let signOutButton = LabelButton(title: Strings.ProfileViewController.signOutButtonTitle,
                                            titleColor: .appRed,
                                            font: .font(.josefinSansSemibold, size: .custom(size: 14)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        configureContents()
        subscribeViewModelEvents()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchUser = { [weak self] in
            guard let self = self else { return }
            self.userNameTextField.text = self.viewModel.getUser().fullName
            self.emailTextField.text = self.viewModel.getUser().email
        }
        
    }
    
}

// MARK: - UILayout
extension ProfileViewController {
    
    private func addSubViews() {
        makeUserNameTextField()
        makeEmailTextField()
        makeSaveButton()
        makeChangePasswordButton()
        makeSignOutButton()
    }
    
    private func makeUserNameTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.topToSuperview().constant = 125
        userNameTextField.height(47)
        userNameTextField.leftToSuperview().constant = 25
        userNameTextField.rightToSuperview().constant = -25
        userNameTextField.centerXToSuperview()
    }
    
    private func makeEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.topToBottom(of: userNameTextField).constant = 15
        emailTextField.height(47)
        emailTextField.leftToSuperview().constant = 25
        emailTextField.rightToSuperview().constant = -25
        emailTextField.centerXToSuperview()
    }
    
    private func makeSaveButton() {
        view.addSubview(saveButton)
        saveButton.topToBottom(of: emailTextField).constant = 15
        saveButton.height(60)
        saveButton.leftToSuperview().constant = 25
        saveButton.rightToSuperview().constant = -25
        saveButton.centerXToSuperview()
    }
    
    private func makeChangePasswordButton() {
        view.addSubview(changePasswordButton)
        changePasswordButton.topToBottom(of: saveButton).constant = 15
        changePasswordButton.centerXToSuperview()
    }
    
    private func makeSignOutButton() {
        view.addSubview(signOutButton)
        signOutButton.topToBottom(of: changePasswordButton).constant = 15
        signOutButton.centerXToSuperview()
    }
    
}

// MARK: - Configure and SetLocalize
extension ProfileViewController {
    
    private func configureContents() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        changePasswordButton.addTarget(self, action: #selector(changePasswordButtonTapped), for: .touchUpInside)
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "PROFİLE"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .hamburgerIcon,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(hamburgerButtonButtonTapped))
        getUser()
    }
    
}

// MARK: - Actions
extension ProfileViewController {
    
    @objc
    private func saveButtonTapped() {
        view.endEditing(true)
        guard let userName = userNameTextField.text,
              let email = emailTextField.text,
              userNameTextField.text?.isEmpty == false,
              emailTextField.text?.isEmpty == false else {
                  showFailureWarningToast(message: Strings.Error.emptyFields)
                  return }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        viewModel.updateUser(userName: userName, email: email)
    }
    
    @objc
    private func changePasswordButtonTapped() {
        viewModel.pushChangePasswordScene()
    }
    
    @objc
    private func signOutButtonTapped() {
        viewModel.signOut()
    }
    
    @objc
    private func hamburgerButtonButtonTapped() {
        viewModel.showHomeScreen()
    }
    
    private func getUser() {
        self.viewModel.getUserRequest()
    }
}

// MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
