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
import UIComponents

final class LoginViewController: BaseViewController<LoginViewModel> {
    private let scrollView = UIScrollViewBuilder()
        .alwaysBounceVertical(true)
        .build()
    private let contentView = UIViewBuilder()
        .build()
    private let titleLabel = TitleLabel(text: Strings.LoginViewController.title)
    private let subTitleLabel = SubTitleLabel(text: Strings.LoginViewController.subTitle)
    private let textFieldtackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(14)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let emailTextField = EmailTextField()
    private let passwordTextField = PasswordTextField()
    private let forgotPasswordLabelButton = LabelButton(title: Strings.LoginViewController.forgotPassword)
    private let loginButton = LoginButton(title: Strings.LoginViewController.loginButton)
    private let registerLabelButton = RegisterButton(blackText: Strings.LoginViewController.bottomBlackText,
                                                     blueberryText: Strings.LoginViewController.bottomBluberryText)
    
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
        configureContents()
    }
}

// MARK: - UILayout
extension LoginViewController {
    
    private func drawDesign() {
        makeScrollView()
        makeContentView()
        maketitleLabel()
        makeSubTitleLabel()
        makeTextFieldtackView()
        makeForgotPasswordButton()
        makeLoginButton()
        makeRegisterLabelButton()
    }
    
    private func makeScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
    }
    
    private func makeContentView() {
        scrollView.addSubview(contentView)
        contentView.widthToSuperview()
        contentView.edgesToSuperview()
    }
    
    private func maketitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 103
        titleLabel.centerXToSuperview()
        titleLabel.height(27)
        titleLabel.leftToSuperview().constant = 25
        titleLabel.rightToSuperview().constant = -25
    }
    
    private func makeSubTitleLabel() {
        contentView.addSubview(subTitleLabel)
        subTitleLabel.topToBottom(of: titleLabel).constant = 10
        subTitleLabel.centerXToSuperview()
        subTitleLabel.height(36)
        subTitleLabel.leftToSuperview().constant = 25
        subTitleLabel.rightToSuperview().constant = -25
    }
    
    private func makeTextFieldtackView() {
        contentView.addSubview(textFieldtackView)
        textFieldtackView.topToBottom(of: subTitleLabel).constant = 42
        textFieldtackView.leftToSuperview().constant = 25
        textFieldtackView.rightToSuperview().constant = -25
        textFieldtackView.centerXToSuperview()
        textFieldtackView.addArrangedSubview(emailTextField)
        textFieldtackView.addArrangedSubview(passwordTextField)
        emailTextField.height(47)
        emailTextField.returnKeyType = .done
        passwordTextField.height(47)
        passwordTextField.returnKeyType = .done
    }
    
    private func makeForgotPasswordButton() {
        contentView.addSubview(forgotPasswordLabelButton)
        forgotPasswordLabelButton.topToBottom(of: textFieldtackView).constant = 13
        forgotPasswordLabelButton.right(to: textFieldtackView)
        forgotPasswordLabelButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func makeLoginButton() {
        contentView.addSubview(loginButton)
        loginButton.topToBottom(of: forgotPasswordLabelButton).constant = 27
        loginButton.bottomToSuperview().constant = -393
        loginButton.height(60)
        loginButton.leftToSuperview().constant = 25
        loginButton.rightToSuperview().constant = -25
        loginButton.centerXToSuperview()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func makeRegisterLabelButton() {
        view.addSubview(registerLabelButton)
        registerLabelButton.bottomToSuperview(usingSafeArea: true)
        registerLabelButton.centerXToSuperview()
        registerLabelButton.backgroundColor = .clear
        registerLabelButton.addTarget(self, action: #selector(registerLabelButtonTapped), for: .touchUpInside)
    }
    
}

// MARK: - Configure
extension LoginViewController {
    
    private func configureContents() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    private func loginButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              emailTextField.text?.isEmpty == false,
              passwordTextField.text?.isEmpty == false else {
                  ToastPresenter.showWarningToast(text: Strings.Error.emptyFields, entryBackground: .appRed)
                  return }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
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

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return false
    }
}
