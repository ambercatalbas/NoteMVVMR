//
//  PasswordResetMessageViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

import UIKit

final class PasswordResetMessageViewController: BaseViewController<PasswordResetMessageViewModel> {
    
    private let titleLabel = TitleLabel(text: Strings.PasswordResetMessageViewController.title)
    private let subTitleLabel = SubTitleLabel(text: Strings.PasswordResetMessageViewController
                                                .greenSubTitleAfter + Strings.PasswordResetMessageViewController.greenSubTitleLast)
    private let loginButton = LoginButton(title: Strings.PasswordResetMessageViewController.loginButtonTitle)
    var email: String = "email@mail.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        subTitleLabel.textColor = .appGreen
        subTitleLabel.text = Strings.PasswordResetMessageViewController.greenSubTitleAfter + "\(email)" + Strings.PasswordResetMessageViewController.greenSubTitleLast
    }
    
    private func addSubViews() {
        makeTitleLabel()
        makeSubTitleLabel()
        makeLoginButton()
    }
}

// MARK: - UILayout
extension PasswordResetMessageViewController {
    
    private func makeTitleLabel() {
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
        subTitleLabel.leftToSuperview().constant = 50
        subTitleLabel.rightToSuperview().constant = -50
    }
    
    private func makeLoginButton() {
        view.addSubview(loginButton)
        loginButton.height(60)
        loginButton.topToBottom(of: subTitleLabel).constant = 35
        loginButton.leftToSuperview().constant = 25
        loginButton.rightToSuperview().constant = -25
        loginButton.centerXToSuperview()
    }
    
}

// MARK: - Configure
extension PasswordResetMessageViewController {
    
    private func configureContents() {
        loginButton.addTarget(self, action: #selector(showLoginScreen), for: .touchUpInside)

    }
}

// MARK: - Actions
extension PasswordResetMessageViewController {
    
    @objc
    private func showLoginScreen() {
        viewModel.showLoginScreen()
    }
}
