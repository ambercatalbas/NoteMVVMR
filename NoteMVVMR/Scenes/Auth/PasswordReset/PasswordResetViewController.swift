//
//  PasswordResetViewController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

final class PasswordResetViewController: BaseViewController<PasswordResetViewModel> {
    
    private let titleLabel = UILabelBuilder()
        .textColor(.appCinder)
        .font(.font(.nunitoBold, size: .xxLarge))
        .text("Reset Password ViewController")
        .build()
    private let emailTextField = UITextFieldBuilder()
        .backgroundColor(.appHeather)
        .borderStyle(.roundedRect)
        .placeholder("name@mail.com")
        .build()
    private let resetPasswordButton = UIButtonBuilder()
        .titleColor(.appRaven)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .title("Reset")
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
        view.addSubview(emailTextField)
        view.addSubview(resetPasswordButton)
        maketitleLabel()
        makeEmailTextField()
        makeRessetPasswordButton()
    }
}

extension PasswordResetViewController {
    
    private func maketitleLabel() {
        titleLabel.edges(to: view, excluding: .bottom, insets: TinyEdgeInsets(top: 44, left: 20, bottom: 100, right: 20))
    }
    
    private func makeEmailTextField() {
        emailTextField.withImage(direction: .left,
                                 image: .emailIcon,
                                 colorSeparator: UIColor.black,
                                 colorBorder: UIColor.clear,
                                 backgroundColor: .appHeather)
        emailTextField.keyboardType = .emailAddress
        emailTextField.height(50)
        emailTextField.topToBottom(of: titleLabel).constant = 50
        emailTextField.leadingToSuperview().constant = 20
        emailTextField.trailingToSuperview().constant = -20
    }
    
    private func makeRessetPasswordButton() {
        resetPasswordButton.height(50)
        resetPasswordButton.topToBottom(of: emailTextField).constant = 50
        resetPasswordButton.leadingToSuperview().constant = 50
        resetPasswordButton.trailingToSuperview().constant = -50
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
    }
    
}

extension PasswordResetViewController {
    @objc
    private func resetPasswordButtonTapped() {
        print(#function)
    }
    
}
