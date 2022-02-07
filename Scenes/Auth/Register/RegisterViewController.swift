//
//  RegisterViewController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//
import MobilliumBuilders
import TinyConstraints
import UIKit

final class RegisterViewController: BaseViewController<RegisterViewModel> {
  
  private let titleLabel = UILabelBuilder()
    .textColor(.appCinder)
    .font(.font(.nunitoBold, size: .xxLarge))
    .text("RegisterViewController")
    .build()
  
  private let TextFieldtackView = UIStackViewBuilder()
    .axis(.vertical)
    .spacing(15)
    .alignment(.fill)
    .distribution(.fillEqually)
    .build()
  
  private let usernameTextField = UITextFieldBuilder()
    .backgroundColor(.appHeather)
    .borderStyle(.roundedRect)
    .placeholder("Username")
    .build()
  private let emailTextField = UITextFieldBuilder()
    .backgroundColor(.appHeather)
    .borderStyle(.roundedRect)
    .placeholder("name@mail.com")
    .build()
  private let passwordTextField = UITextFieldBuilder()
    .backgroundColor(.appHeather)
    .borderStyle(.roundedRect)
    .placeholder("Password...")
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
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .appBackgrounlightGreen
    drawDesign()
    
  }
  private func drawDesign() {
    view.addSubview(titleLabel)
    view.addSubview(TextFieldtackView)
    view.addSubview(buttonStackView)
    maketitleLabel()
    makeTextFieldtackView()
    makeUsernameTextField()
    makeEmailTextField()
    makePasswordTextfield()
    makeButtonStackView()
    makeLoginButton()
    makeRegisterButton()
  }
}
extension RegisterViewController {
  
  private func maketitleLabel() {
    titleLabel.edges(to: view, excluding: .bottom, insets: TinyEdgeInsets(top: 44, left: 20, bottom: 100, right: 20))
  }
  
  private func makeTextFieldtackView() {
    TextFieldtackView.topToBottom(of: titleLabel).constant = 30
    TextFieldtackView.rightToSuperview().constant = -5
    TextFieldtackView.leftToSuperview().constant = 5
    TextFieldtackView.addArrangedSubview(usernameTextField)
    TextFieldtackView.addArrangedSubview(emailTextField)
    TextFieldtackView.addArrangedSubview(passwordTextField)
    
  }
  
  private func makeUsernameTextField() {
    usernameTextField.withImage(direction: .Left, image: .icUser, colorSeparator: UIColor.black, colorBorder: UIColor.clear, backgroundColor: .appHeather)
    usernameTextField.height(50)
  }
  private func makeEmailTextField() {
    emailTextField.withImage(direction: .Left, image: .emailIcon, colorSeparator: UIColor.black, colorBorder: UIColor.clear, backgroundColor: .appHeather)
    emailTextField.keyboardType = .emailAddress
    emailTextField.height(50)
  }
  private func makePasswordTextfield() {
    passwordTextField.withImage(direction: .Left, image: .passwordIcon, colorSeparator: UIColor.black, colorBorder: UIColor.clear, backgroundColor: .appHeather)
    passwordTextField.height(50)
  }
  private func makeButtonStackView() {
    buttonStackView.topToBottom(of: TextFieldtackView).constant = 30
    buttonStackView.rightToSuperview().constant = -30
    buttonStackView.leftToSuperview().constant = 30
    buttonStackView.addArrangedSubview(loginButton)
    buttonStackView.addArrangedSubview(registerButton)
  }
  private func makeLoginButton() {
    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
  }
  private func makeRegisterButton() {
    registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
  }
  
}
// MARK: - Actions
extension RegisterViewController {
    
    @objc
    private func loginButtonTapped() {
        viewModel.showLoginScreen()
    }
    
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
}

