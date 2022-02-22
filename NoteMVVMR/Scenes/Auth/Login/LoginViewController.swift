//
//  LoginViewController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 1.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import KeychainSwift
import SwiftUI

final class LoginViewController: BaseViewController<LoginViewModel> {
    private let titleLabel = TitleLabel(text: "Login")
    private let subTitleLabel = SubTitleLabel(text: "Login or sign up to continue using our app.")
    private let textFieldtackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(14)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let emailTextField = EmailTextField()
    private let passwordTextField = PasswordTextField()
    private let forgotPasswordLabelButton = LabelButton(title: "Forgot Password?")
    private let loginButton = LoginButton(title: "Login")
    private let registerLabelButton = RegisterButton(blackText: "New user?", blueberryText: "Sign up now")
    
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
    }
    
    private func drawDesign() {
        maketitleLabel()
        makeSubTitleLabel()
        makeTextFieldtackView()
        makeForgotPasswordButton()
        makeLoginButton()
        makeRegisterLabelButton()
    }
}
extension LoginViewController {
    private func maketitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 103
        titleLabel.centerXToSuperview()
    }
    private func makeSubTitleLabel() {
        view.addSubview(subTitleLabel)
        subTitleLabel.topToBottom(of: titleLabel).constant = 10
        subTitleLabel.centerXToSuperview()
        
    }
    private func makeTextFieldtackView() {
        view.addSubview(textFieldtackView)
        textFieldtackView.topToBottom(of: subTitleLabel).constant = 42
        textFieldtackView.leftToSuperview().constant = 25
        textFieldtackView.rightToSuperview().constant = -25
        textFieldtackView.centerXToSuperview()
        textFieldtackView.addArrangedSubview(emailTextField)
        textFieldtackView.addArrangedSubview(passwordTextField)
        emailTextField.height(47)
        passwordTextField.height(47)
    }
    private func makeForgotPasswordButton() {
        view.addSubview(forgotPasswordLabelButton)
        forgotPasswordLabelButton.topToBottom(of: textFieldtackView).constant = 13
        forgotPasswordLabelButton.right(to: textFieldtackView)
        forgotPasswordLabelButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }

    private func makeLoginButton() {
        view.addSubview(loginButton)
        loginButton.topToBottom(of: forgotPasswordLabelButton).constant = 27
        loginButton.height(60)
        loginButton.leftToSuperview().constant = 25
        loginButton.rightToSuperview().constant = -25
        loginButton.centerXToSuperview()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    private func makeRegisterLabelButton() {
        view.addSubview(registerLabelButton)
        registerLabelButton.bottomToSuperview().constant = -34
        registerLabelButton.centerXToSuperview()
        registerLabelButton.addTarget(self, action: #selector(registerLabelButtonTapped), for: .touchUpInside)
    }
    
}
extension LoginViewController {
    @objc
    private func loginButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendLoginRequest(email: email, password: password)
    }
    @objc
    private func registerLabelButtonTapped() {
        viewModel.showRegisterOnWindow()
    }
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.showPasswordResetScene(isBackScrenLogin: true)
    }
}
