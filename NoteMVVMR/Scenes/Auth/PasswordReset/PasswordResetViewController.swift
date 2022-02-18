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
    private let loginButton = LoginButton(title: "Login")
  
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
        loginButton.isHidden = true
    }
    
    private func drawDesign() {
        maketitleLabel()
        makeSubTitleLabel()
        makeEmailTextField()
        makeRessetPasswordButton()
        makeLoginButton()
    }
}

extension PasswordResetViewController {
    
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
    private func makeLoginButton() {
        view.addSubview(loginButton)
        loginButton.height(60)
        loginButton.topToBottom(of: subTitleLabel).constant = 35
        loginButton.leftToSuperview().constant = 25
        loginButton.rightToSuperview().constant = -25
        loginButton.centerXToSuperview()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
}

extension PasswordResetViewController {
    @objc
    private func resetPasswordButtonTapped() {
//        viewModel.sendResetRequest(email: emailTextField.text ?? "")
        resetPasswordButton.isHidden = true
        emailTextField.isHidden = true
        loginButton.isHidden = false
        titleLabel.text = "Password Reset Confirmation"
        subTitleLabel.text = "An email has been sent to alican.kangotan@mobillium.com with further instructions."
        subTitleLabel.textColor = .appGreen
    }
    @objc
    private func loginButtonTapped() {
        viewModel.showLogin()
    }
    
}
