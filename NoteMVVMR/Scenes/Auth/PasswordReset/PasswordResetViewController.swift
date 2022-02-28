//
//  PasswordResetViewController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import UIComponents

final class PasswordResetViewController: BaseViewController<PasswordResetViewModel> {
    private let scrollView = UIScrollViewBuilder()
        .alwaysBounceVertical(true)
        .build()
    private let contentView = UIViewBuilder()
        .build()
    private let titleLabel = TitleLabel(text: Strings.PasswordResetViewController.title)
    private let subTitleLabel = SubTitleLabel(text: Strings.PasswordResetViewController.subTitle)
    private let emailTextField = EmailTextField()
    private let resetPasswordButton = LoginButton(title: Strings.PasswordResetViewController.resetPasswordButtonTitle)
    private let backButton = UIButtonBuilder()
        .tintColor(.appCinder)
        .image(.backArrow)
        .build()
    var isBackScrenLogin = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
        configureContents()
    }
    
}

// MARK: - UILayout
extension PasswordResetViewController {
    
    private func drawDesign() {
        makeScrollView()
        makeContentView()
        makeTitleLabel()
        makeSubTitleLabel()
        makeEmailTextField()
        makeRessetPasswordButton()
        makeBackButton()
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
    
    private func makeBackButton() {
        view.addSubview(backButton)
        backButton.topToSuperview().constant = 56
        backButton.leftToSuperview().constant = 20

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
    
    private func makeEmailTextField() {
        contentView.addSubview(emailTextField)
        emailTextField.topToBottom(of: subTitleLabel).constant = 42
        emailTextField.leftToSuperview().constant = 25
        emailTextField.rightToSuperview().constant = -25
        emailTextField.centerXToSuperview()
        emailTextField.height(47)
    }
    
    private func makeRessetPasswordButton() {
        contentView.addSubview(resetPasswordButton)
        resetPasswordButton.height(60)
        resetPasswordButton.topToBottom(of: emailTextField).constant = 35
        resetPasswordButton.bottomToSuperview().constant = -460
        resetPasswordButton.leftToSuperview().constant = 25
        resetPasswordButton.rightToSuperview().constant = -25
        resetPasswordButton.centerXToSuperview()
    }

}

// MARK: - Configure
extension PasswordResetViewController {
    
    private func configureContents() {
        emailTextField.delegate = self
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
        if isBackScrenLogin {
            backButton.addTarget(self, action: #selector(showLoginScreen), for: .touchUpInside)
        } else {
            backButton.addTarget(self, action: #selector(showRegisterScreen), for: .touchUpInside)
        }
    }
    
}

// MARK: - Actions
extension PasswordResetViewController {

    @objc
    private func resetPasswordButtonTapped() {
        guard let email = emailTextField.text,
              emailTextField.text?.isEmpty == false else {
            ToastPresenter.showWarningToast(text: Strings.Error.emptyFields, entryBackground: .appRed)
            return }
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        viewModel.sendResetRequest(email: emailTextField.text ?? "")
    }
    
    @objc
    private func showLoginScreen() {
        viewModel.showLoginScreen()
    }
    
    @objc
    private func showRegisterScreen() {
        viewModel.showRegisterScreen()
    }
    
}

// MARK: - UITextFieldDelegate
extension PasswordResetViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
