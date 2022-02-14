//
//  DetailViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

import UIKit
import MobilliumBuilders
import KeychainSwift

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let textStackView = UIStackViewBuilder()
        .spacing(0)
        .axis(.vertical)
        .alignment(.fill)
        .distribution(.fill)
        .build()
    private let titleText = UITextFieldBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .text("note")
        .textAlignment(.left)
        .textColor(.appCinder)
        .build()
    private let descriptionText = UITextViewBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .text("noteDescription")
        .textAlignment(.left)
        .build()
    private let saveButton = UIButtonBuilder()
        .title("SAVE")
        .cornerRadius(12)
        .backgroundColor(.systemTeal)
        .build()
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
}
// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        addContainerView()
        addSaveButton()
    }
    
    private func addContainerView() {
        view.addSubview(textStackView)
        textStackView.addArrangedSubview(titleText)
        textStackView.addArrangedSubview(descriptionText)
        textStackView.topToSuperview().constant = 80
        textStackView.leadingToSuperview().constant = 20
        textStackView.trailingToSuperview().constant = -20
        
    }
    private func addSaveButton() {
        view.addSubview(saveButton)
        saveButton.topToBottom(of: textStackView).constant = 20
        saveButton.leadingToSuperview().constant = 50
        saveButton.trailingToSuperview().constant = -50
        saveButton.bottomToSuperview().constant = -60
        saveButton.height(50)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
}
// MARK: - Configure
extension DetailViewController {
    private func configureContents() {
        view.backgroundColor = .white
        
    }
}

// MARK: - Actions
extension DetailViewController {
    @objc
    func saveButtonTapped() {
        let title = titleText.text ?? ""
        let description = descriptionText.text ?? ""
        
        viewModel.createNote(title: title, description: description)
        //    viewModel.createNoteAF(title: title, description: description, token: token)
    }
}
