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
    private let textFieldStackView = UIStackViewBuilder()
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
        makeTitleLabel()
        makeSubTitleLabel()
        makeTextFieldStackView()
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
    
    private func makeTitleLabel() {
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
    
    private func makeTextFieldStackView() {
        contentView.addSubview(textFieldStackView)
        textFieldStackView.topToBottom(of: subTitleLabel).constant = 42
        textFieldStackView.leftToSuperview().constant = 25
        textFieldStackView.rightToSuperview().constant = -25
        textFieldStackView.centerXToSuperview()

    }
    
    private func makeForgotPasswordButton() {
        contentView.addSubview(forgotPasswordLabelButton)
        forgotPasswordLabelButton.topToBottom(of: textFieldStackView).constant = 13
        forgotPasswordLabelButton.right(to: textFieldStackView)
    }
    
    private func makeLoginButton() {
        contentView.addSubview(loginButton)
        loginButton.topToBottom(of: forgotPasswordLabelButton).constant = 27
        loginButton.bottomToSuperview().constant = -393
        loginButton.height(60)
        loginButton.leftToSuperview().constant = 25
        loginButton.rightToSuperview().constant = -25
        loginButton.centerXToSuperview()
    }
    
    private func makeRegisterLabelButton() {
        view.addSubview(registerLabelButton)
        registerLabelButton.bottomToSuperview(usingSafeArea: true)
        registerLabelButton.centerXToSuperview()
    }
    
}

// MARK: - Configure
extension LoginViewController {
    
    private func configureContents() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        emailTextField.height(47)
        emailTextField.returnKeyType = .done
        passwordTextField.height(47)
        passwordTextField.returnKeyType = .done
        registerLabelButton.backgroundColor = .clear
        forgotPasswordLabelButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerLabelButton.addTarget(self, action: #selector(registerLabelButtonTapped), for: .touchUpInside)

  
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
        return false
    }
}
