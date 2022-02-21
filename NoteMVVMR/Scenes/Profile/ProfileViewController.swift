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
    private let saveButton = LoginButton(title: "Save")
    private let changePasswordButton = LabelButton(title: "Change Password",
                                                   titleColor: .appBlueBerry,
                                                   font: .font(.josefinSansSemibold, size: .custom(size: 14)))
    private let signOutButton = LabelButton(title: "Sign Out",
                                            titleColor: .appRed,
                                            font: .font(.josefinSansSemibold, size: .custom(size: 14)))
    private let navigationBar = UINavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "PROFİLE"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .hamburgerIcon,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(hamburgerButtonButtonTapped))
        
        drawDesign()
        getUser()
        subscribeViewModelEvents()
        
        
    }
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchUser = { [weak self] in
            guard let self = self else { return }
            self.userNameTextField.text = self.viewModel.getUser().fullName
            self.emailTextField.text = self.viewModel.getUser().email
            
        }
    }
    private func getUser() {
        self.viewModel.getUserRequest() 
    }
    private func drawDesign() {
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
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
    }
    private func makeChangePasswordButton() {
        view.addSubview(changePasswordButton)
        changePasswordButton.topToBottom(of: saveButton).constant = 15
        changePasswordButton.centerXToSuperview()
        changePasswordButton.addTarget(self, action: #selector(changePasswordButtonTapped), for: .touchUpInside)
    }
    private func makeSignOutButton() {
        view.addSubview(signOutButton)
        signOutButton.topToBottom(of: changePasswordButton).constant = 15
        signOutButton.centerXToSuperview()
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }
    @objc
    private func saveButtonTapped() {
        viewModel.updateUser(userName: userNameTextField.text ?? "", email: emailTextField.text ?? "")
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
}
