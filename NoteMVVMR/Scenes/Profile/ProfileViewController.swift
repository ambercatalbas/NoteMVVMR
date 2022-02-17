//
//  ProfileViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import UIKit
import MobilliumBuilders
import UIComponents

final class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    private let userNameTextField = UserNameTextField()
    
    private let saveButton = UIButtonBuilder()
        .title("Save")
        .build()
    private let factoryButton = ButtonFactory.createPrimaryBorderedButton(style: .medium)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "PROFİLE"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .hamburgerIcon, style: .done, target: self, action: #selector(saveButtonTapped))
        makeButton()
    }
    
private func makeButton() {
    view.addSubview(saveButton)
    saveButton.bottomToSuperview().constant = -100
    saveButton.height(42)
    saveButton.centerXToSuperview()
    saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    
    view.addSubview(userNameTextField)
    userNameTextField.topToSuperview().constant = 100
    userNameTextField.height(47)
    userNameTextField.width(325)
    userNameTextField.centerXToSuperview()
    }
    @objc
    private func saveButtonTapped() {
        viewModel.pushHome()
    }
}
