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
    private let titleTextField = UITextFieldBuilder()
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
    private let updateButton = UIButtonBuilder()
        .title("UPDATE")
        .cornerRadius(12)
        .backgroundColor(.systemTeal)
        .build()
    let keychain = KeychainSwift()
    var noteID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
}
// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        addContainerView()
        addUpdateButton()
        addSaveButton()
   
    }
    
    private func addContainerView() {
        view.addSubview(textStackView)
        textStackView.addArrangedSubview(titleTextField)
        textStackView.addArrangedSubview(descriptionText)
        textStackView.topToSuperview().constant = 80
        textStackView.leadingToSuperview().constant = 20
        textStackView.trailingToSuperview().constant = -20
        
    }
    private func addUpdateButton() {
        view.addSubview(updateButton)
        updateButton.topToBottom(of: textStackView).constant = 10
        updateButton.leadingToSuperview().constant = 50
        updateButton.trailingToSuperview().constant = -50
        updateButton.height(50)
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    private func addSaveButton() {
        view.addSubview(saveButton)
        saveButton.topToBottom(of: updateButton).constant = 10
        saveButton.leadingToSuperview().constant = 50
        saveButton.trailingToSuperview().constant = -50
        saveButton.bottomToSuperview().constant = -34
        saveButton.height(40)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

}
// MARK: - Configure
extension DetailViewController {
    public func set(titleText: String, descriptionText: String, noteId: Int) {
        self.titleTextField.text = titleText
        self.descriptionText.text = descriptionText
        self.noteID = noteId
    }
    private func configureContents() {
        view.backgroundColor = .white
        
    }
}

// MARK: - Actions
extension DetailViewController {
    @objc
    func saveButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionText.text ?? ""
        viewModel.createNote(title: title, description: description)
    }
    @objc
    func updateButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionText.text ?? ""
        viewModel.updateNote(title: title, description: description, noteID: noteID)
    }
}
