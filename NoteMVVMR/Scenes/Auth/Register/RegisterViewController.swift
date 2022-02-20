//
//  RegisterViewController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//
import MobilliumBuilders
import TinyConstraints
import UIKit
import UIComponents

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    private let titleLabel = TitleLabel(text: "Sign Up")
    private let subTitleLabel = SubTitleLabel(text: "Login or sign up to continue using our app.")
    private let textFieldtackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(14)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let usernameTextField = UserNameTextField()
    private let emailTextField = EmailTextField()
    private let passwordTextField = PasswordTextField()
    private let forgotPasswordLabelButton = LabelButton(title: "Forgot Password?")
    private let registerButton = LoginButton(title: "Sign Up")
    private let registerLabelButton = RegisterButton(blackText: "Already have an account?", blueberryText: "Sign in now")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
    }
    
    private func drawDesign() {
        maketitleLabel()
        makeSubTitleLabel()
        makeTextFieldtackView()
        makeForgotPasswordLabelButton()
        makeRegisterButton()
        makeRegisterLabelButton()
    }
    
}
extension RegisterViewController {
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
        textFieldtackView.addArrangedSubview(usernameTextField)
        textFieldtackView.addArrangedSubview(emailTextField)
        textFieldtackView.addArrangedSubview(passwordTextField)
        usernameTextField.height(47)
        emailTextField.height(47)
        passwordTextField.height(47)
        
    }
    private func makeForgotPasswordLabelButton() {
        view.addSubview(forgotPasswordLabelButton)
        forgotPasswordLabelButton.topToBottom(of: textFieldtackView).constant = 13
        forgotPasswordLabelButton.right(to: textFieldtackView)
        forgotPasswordLabelButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func makeRegisterButton() {
        view.addSubview(registerButton)
        registerButton.topToBottom(of: forgotPasswordLabelButton).constant = 27
        registerButton.height(60)
        registerButton.leftToSuperview().constant = 25
        registerButton.rightToSuperview().constant = -25
        registerButton.centerXToSuperview()
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    private func makeRegisterLabelButton() {
        view.addSubview(registerLabelButton)
        registerLabelButton.bottomToSuperview().constant = -34
        registerLabelButton.centerXToSuperview()
        registerLabelButton.addTarget(self, action: #selector(registerLabelButtonTapped), for: .touchUpInside)
    }
}
// MARK: - Actions
extension RegisterViewController {
    
    @objc
    private func registerButtonTapped() {
        view.endEditing(true)
        guard let userName = usernameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
                  print("error")
                  //            showWarningToast(message: L10n.Error.emptyFields)
                  return
              }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        viewModel.sendRegisterRequest(username: userName, email: email, password: password)
    }
    @objc
    private func forgotPasswordButtonTapped() {
        viewModel.showForgotPasswordScreen(isBackScrenLogin: false)
    }
    @objc
    private func registerLabelButtonTapped() {
        viewModel.showLoginScreen()
    }
}
