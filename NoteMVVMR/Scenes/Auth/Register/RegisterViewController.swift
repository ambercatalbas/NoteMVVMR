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
    
    private let scrollView = UIScrollViewBuilder()
        .alwaysBounceVertical(true)
        .build()
    private let contentView = UIViewBuilder()
        .build()
    private let titleLabel = TitleLabel(text: Strings.RegisterViewController.title)
    
    private let subTitleLabel = SubTitleLabel(text: Strings.RegisterViewController.subTitle)
    private let textFieldStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(14)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let usernameTextField = UserNameTextField()
    private let emailTextField = EmailTextField()
    private let passwordTextField = PasswordTextField()
    private let forgotPasswordLabelButton = LabelButton(title: Strings.RegisterViewController.forgotPassword)
    private let registerButton = LoginButton(title: Strings.RegisterViewController.signUpButtonTitle)
    private let loginLabelButton = RegisterButton(blackText: Strings.RegisterViewController.bottomBlackText,
                                                  blueberryText: Strings.RegisterViewController.bottomBluberryText)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        configureContents()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

// MARK: - UILayout
extension RegisterViewController {
    
    private func addSubViews() {
        makeScrollView()
        makeContentView()
        makeTitleLabel()
        makeSubTitleLabel()
        makeTextFieldStackView()
        makeForgotPasswordLabelButton()
        makeRegisterButton()
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
        titleLabel.leftToSuperview().constant = 25
        titleLabel.rightToSuperview().constant = -25
    }
    
    private func makeSubTitleLabel() {
        contentView.addSubview(subTitleLabel)
        subTitleLabel.topToBottom(of: titleLabel).constant = 10
        subTitleLabel.centerXToSuperview()
        subTitleLabel.leftToSuperview().constant = 25
        subTitleLabel.rightToSuperview().constant = -25
    }
    
    private func makeTextFieldStackView() {
        contentView.addSubview(textFieldStackView)
        textFieldStackView.topToBottom(of: subTitleLabel).constant = 42
        textFieldStackView.leftToSuperview().constant = 25
        textFieldStackView.rightToSuperview().constant = -25
        textFieldStackView.centerXToSuperview()
        textFieldStackView.addArrangedSubview(usernameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        usernameTextField.height(47)
        emailTextField.height(47)
        passwordTextField.height(47)
        
    }
    
    private func makeForgotPasswordLabelButton() {
        contentView.addSubview(forgotPasswordLabelButton)
        forgotPasswordLabelButton.topToBottom(of: textFieldStackView).constant = 13
        forgotPasswordLabelButton.right(to: textFieldStackView)
    }
    
    private func makeRegisterButton() {
        contentView.addSubview(registerButton)
        registerButton.topToBottom(of: forgotPasswordLabelButton).constant = 27
        registerButton.bottomToSuperview().constant = -60
        registerButton.height(60)
        registerButton.leftToSuperview().constant = 25
        registerButton.rightToSuperview().constant = -25
        registerButton.centerXToSuperview()
    }
    
    private func makeRegisterLabelButton() {
        view.addSubview(loginLabelButton)
        loginLabelButton.bottomToSuperview(usingSafeArea: true)
        loginLabelButton.centerXToSuperview()
    }
}

// MARK: - Configure
extension RegisterViewController {
    
    private func configureContents() {
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginLabelButton.backgroundColor = .clear
        loginLabelButton.addTarget(self, action: #selector(registerLabelButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        forgotPasswordLabelButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
}

// MARK: - Actions
extension RegisterViewController {

    @objc
    private func registerButtonTapped() {
        view.endEditing(true)
        guard let userName = usernameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              usernameTextField.text?.isEmpty == false,
              emailTextField.text?.isEmpty == false,
              passwordTextField.text?.isEmpty == false else {
                  self.showFailureWarningToast(message: Strings.Error.emptyFields)
                  return }
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

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
