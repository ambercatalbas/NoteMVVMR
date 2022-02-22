//
//  PasswordResetMessageViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

import UIKit

final class PasswordResetMessageViewController: BaseViewController<PasswordResetMessageViewModel> {
    private let titleLabel = TitleLabel(text: "Forgot Password?")
    private let subTitleLabel = SubTitleLabel(text: "Confirm your email and we’ll send the instructions.")
    private let loginButton = LoginButton(title: "Login")
    var email: String = "email@mail.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDesign()
        subTitleLabel.textColor = .appGreen
        subTitleLabel.text = "An email has been sent to \(email) with further instructions."
    }
    
    private func drawDesign() {
        maketitleLabel()
        makeSubTitleLabel()
        makeLoginButton()
    }
}

extension PasswordResetMessageViewController {
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
   private func makeLoginButton() {
        view.addSubview(loginButton)
        loginButton.height(60)
        loginButton.topToBottom(of: subTitleLabel).constant = 35
        loginButton.leftToSuperview().constant = 25
        loginButton.rightToSuperview().constant = -25
        loginButton.centerXToSuperview()
        loginButton.addTarget(self, action: #selector(showLoginScreen), for: .touchUpInside)
    }
    
}

extension PasswordResetMessageViewController {

    @objc
    private func showLoginScreen() {
        viewModel.showLoginScreen()
    }
}
