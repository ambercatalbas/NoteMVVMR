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
    
    private let titleLabel = TitleLabel(withInsets: 0, 0, 0, 0, text: "Forgot Password?")
    private let subTitleLabel = SubTitleLabel(withInsets: 0, 0, 0, 0, text: "Confirm your email and we’ll send the instructions.")
    private let emailTextField = EmailTextField()
    private let resetPasswordButton = LoginButton(title: "Reset Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
    }
    
    private func drawDesign() {
        maketitleLabel()
        makeSubTitleLabel()
        makeEmailTextField()
        makeRessetPasswordButton()
    }
}

extension PasswordResetViewController {
    
    private func maketitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToSuperview().constant = 103
        titleLabel.centerXToSuperview()
    }
    private func makeSubTitleLabel() {
        view.addSubview(subTitleLabel)
        subTitleLabel.topToBottom(of: titleLabel).constant = 10
        subTitleLabel.width(192)
        subTitleLabel.centerXToSuperview()
    }
    private func makeEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.topToBottom(of: subTitleLabel).constant = 31
        emailTextField.height(47)
        emailTextField.width(325)
        emailTextField.centerXToSuperview()
    }    
    private func makeRessetPasswordButton() {
        view.addSubview(resetPasswordButton)
        resetPasswordButton.height(60)
        resetPasswordButton.topToBottom(of: emailTextField).constant = 35
        resetPasswordButton.width(325)
        resetPasswordButton.centerXToSuperview()
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
    }
    
}

extension PasswordResetViewController {
    @objc
    private func resetPasswordButtonTapped() {
        viewModel.sendResetRequest(email: emailTextField.text ?? "")
    }
    
}
