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
    
    private let titleLabel = TitleLabel(text: "Forgot Password?")
    private let subTitleLabel = SubTitleLabel(text: "Confirm your email and we’ll send the instructions.")
    private let emailTextField = EmailTextField()
    private let resetPasswordButton = LoginButton(title: "Reset Password")
    private let backButton = UIButtonBuilder()
        .tintColor(.appCinder)
        .image(.backArrow)
        .build()
    var isBackScrenLogin = true
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
    }
    
    private func drawDesign() {
        maketitleLabel()
        makeSubTitleLabel()
        makeEmailTextField()
        makeRessetPasswordButton()
        makeBackButton()
    }
}

extension PasswordResetViewController {
    private func makeBackButton() {
        view.addSubview(backButton)
        backButton.topToSuperview().constant = 56
        backButton.leftToSuperview().constant = 20
        if isBackScrenLogin {
            backButton.addTarget(self, action: #selector(showLoginScreen), for: .touchUpInside)
        } else {
            backButton.addTarget(self, action: #selector(showRegisterScreen), for: .touchUpInside)
        }
    }
    
    private func maketitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 103
        titleLabel.leftToSuperview().constant = 25
        titleLabel.rightToSuperview().constant = -25
        titleLabel.centerXToSuperview()
    }
    private func makeSubTitleLabel() {
        view.addSubview(subTitleLabel)
        subTitleLabel.topToBottom(of: titleLabel).constant = 10
        subTitleLabel.centerXToSuperview()
        subTitleLabel.leftToSuperview().constant = 25
        subTitleLabel.rightToSuperview().constant = -25
    }
    private func makeEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.topToBottom(of: subTitleLabel).constant = 31
        emailTextField.height(47)
        emailTextField.leftToSuperview().constant = 25
        emailTextField.rightToSuperview().constant = -25
        emailTextField.centerXToSuperview()
    }    
    private func makeRessetPasswordButton() {
        view.addSubview(resetPasswordButton)
        resetPasswordButton.height(60)
        resetPasswordButton.topToBottom(of: emailTextField).constant = 35
        resetPasswordButton.leftToSuperview().constant = 25
        resetPasswordButton.rightToSuperview().constant = -25
        resetPasswordButton.centerXToSuperview()
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
    }

}

extension PasswordResetViewController {
    @objc
    private func resetPasswordButtonTapped() {
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
