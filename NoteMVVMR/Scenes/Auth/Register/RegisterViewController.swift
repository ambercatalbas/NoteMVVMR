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
    private let textFieldtackView = UIStackViewBuilder()
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
    private let loginLabelButton = RegisterButton(blackText: Strings.RegisterViewController.bottomBlackText, blueberryText: Strings.RegisterViewController.bottomBluberryText)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
        addObserver()
        configureContents()
    }
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo as? Dictionary <String, AnyObject> {
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
            let keyboardRect = frame?.cgRectValue
            if let keyboardHeight = keyboardRect?.height {
                self.registerButton.bottomToSuperview().constant = -keyboardHeight-10
                UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.registerButton.bottomToSuperview().constant = -60.0
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
    }
    

}

// MARK: - UILayout
extension RegisterViewController {
    private func drawDesign() {
        makeScrollView()
        makeContentView()
        maketitleLabel()
        makeSubTitleLabel()
        makeTextFieldtackView()
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
    
    private func maketitleLabel() {
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
    
    private func makeTextFieldtackView() {
        contentView.addSubview(textFieldtackView)
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
        contentView.addSubview(forgotPasswordLabelButton)
        forgotPasswordLabelButton.topToBottom(of: textFieldtackView).constant = 13
        forgotPasswordLabelButton.right(to: textFieldtackView)
        forgotPasswordLabelButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    private func makeRegisterButton() {
        contentView.addSubview(registerButton)
        registerButton.topToBottom(of: forgotPasswordLabelButton).constant = 27
        registerButton.bottomToSuperview().constant = -60
        registerButton.height(60)
        registerButton.leftToSuperview().constant = 25
        registerButton.rightToSuperview().constant = -25
        registerButton.centerXToSuperview()
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func makeRegisterLabelButton() {
        view.addSubview(loginLabelButton)
        loginLabelButton.bottomToSuperview(usingSafeArea: true)
        loginLabelButton.centerXToSuperview()
        loginLabelButton.backgroundColor = .clear
        loginLabelButton.addTarget(self, action: #selector(registerLabelButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Configure
extension RegisterViewController {
    
    private func configureContents() {
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
                  ToastPresenter.showWarningToast(text: Strings.Error.emptyFields, entryBackground: .appRed)
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
        self.view.endEditing(true)
        return false
    }
}
