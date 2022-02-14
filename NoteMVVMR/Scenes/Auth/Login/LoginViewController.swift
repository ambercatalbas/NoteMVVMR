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

final class LoginViewController: BaseViewController<LoginViewModel> {
    private let titleLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xxLarge))
        .text("LoginViewController")
        .build()
    private let textFieldtackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(15)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let emailTextField = UITextFieldBuilder()
        .backgroundColor(.appHeather)
        .borderStyle(.roundedRect)
        .placeholder("name@mail.com")
        .text("ambercatalbas@gmail.com")
        .build()
    private let passwordTextField = UITextFieldBuilder()
        .backgroundColor(.appHeather)
        .borderStyle(.roundedRect)
        .placeholder("Password...")
        .text("123456")
        .build()
    private let buttonStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let loginButton = UIButtonBuilder()
        .titleColor(.appCinder)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .title("Login")
        .backgroundColor(.appPurple)
        .cornerRadius(12)
        .build()
    private let registerButton = UIButtonBuilder()
        .titleColor(.appRaven)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .title("Register")
        .backgroundColor(.appBeige)
        .cornerRadius(12)
        .build()
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .large))
        .titleColor(.appRaven)
        .title("Forgot Password")
        .backgroundColor(.cyan)
        .cornerRadius(12)
        .build()
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgrounlightGreen
        drawDesign()
    }
    private func drawDesign() {
        view.addSubview(titleLabel)
        view.addSubview(textFieldtackView)
        view.addSubview(buttonStackView)
        maketitleLabel()
        makeTextFieldtackView()
        makeEmailTextField()
        makePasswordTextfield()
        makeButtonStackView()
        makeLoginButton()
        makeRegisterButton()
        makeForgotPasswordButton()
    }
}
extension LoginViewController {
    private func maketitleLabel() {
        titleLabel.edges(to: view, excluding: .bottom, insets: TinyEdgeInsets(top: 44, left: 20, bottom: 100, right: 20))
    }
    private func makeTextFieldtackView() {
        textFieldtackView.topToBottom(of: titleLabel).constant = 30
        textFieldtackView.rightToSuperview().constant = -5
        textFieldtackView.leftToSuperview().constant = 5
        textFieldtackView.addArrangedSubview(emailTextField)
        textFieldtackView.addArrangedSubview(passwordTextField)
    }
    private func makeEmailTextField() {
        emailTextField.withImage(direction: .left,
                                 image: .emailIcon,
                                 colorSeparator: UIColor.black,
                                 colorBorder: UIColor.clear,
                                 backgroundColor: .appHeather)
        emailTextField.height(50)
    }
    private func makePasswordTextfield() {
        passwordTextField.withImage(direction: .left,
                                    image: .passwordIcon,
                                    colorSeparator: UIColor.black,
                                    colorBorder: UIColor.clear,
                                    backgroundColor: .appHeather)
        passwordTextField.height(50)
    }
    private func makeButtonStackView() {
        buttonStackView.topToBottom(of: textFieldtackView).constant = 30
        buttonStackView.rightToSuperview().constant = -30
        buttonStackView.leftToSuperview().constant = 30
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(registerButton)
        buttonStackView.addArrangedSubview(forgotPasswordButton)
    }
    private func makeLoginButton() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    private func makeRegisterButton() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    private func makeForgotPasswordButton() {
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
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
    private func registerButtonTapped() {
        viewModel.showRegisterOnWindow()
    }
    
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.pushPasswordResetScene()
    }
}
