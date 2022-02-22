//
//  DetailViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

import UIKit
import MobilliumBuilders
import KeychainSwift
import SwiftUI
import Accelerate

public enum DetailVCShowType {
case add
case update
case showNote
 }

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let titleTextField = UITextFieldBuilder()
        .font(.font(.josefinSansSemibold, size: .custom(size: 22)))
        .textColor(.appCinder)
        .placeholder("Note title..")
        .textAlignment(.left)
        .build()
    private let descriptionTextView = UITextViewBuilder()
        .font(.font(.josefinSansRegular, size: .custom(size: 16)))
        .textColor(.appRaven)
        .textAlignment(.left)
        .build()
    private let saveButton = LoginButton(title: "Save Note")
    let keychain = KeychainSwift()
    var noteID: Int = 0
    var titleText: String = "Note title"
    var descriptionText: String = "Descrition..."
    var navigationTitle: String = "Details"
    var type: DetailVCShowType = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        addSubViews()
        descriptionTextView.text = descriptionText
        navigationItem.title = navigationTitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .backArrow, style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
}
// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        descriptionTextView.delegate = self
        switch type {
        case .showNote:
            makeTitleTextField()
            makeDescriptionTextView()
            descriptionTextView.isEditable = false
            titleTextField.isEnabled = false
        case .add:
            makeTitleTextField()
            makeDescriptionTextView()
            addSaveButton()
            saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
            descriptionTextView.textColor = .lightGray
        case .update:
            makeTitleTextField()
            makeDescriptionTextView()
            addSaveButton()
            saveButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        }
    }
    
    private func makeTitleTextField() {
        view.addSubview(titleTextField)
        titleTextField.topToSuperview().constant = 120
        titleTextField.leadingToSuperview().constant = 20
        titleTextField.trailingToSuperview().constant = -20
        titleTextField.height(23)
        
    }
    private func makeDescriptionTextView() {
        view.addSubview(descriptionTextView)
        descriptionTextView.topToBottom(of: titleTextField).constant = 19
        descriptionTextView.leadingToSuperview().constant = 20
        descriptionTextView.trailingToSuperview().constant = -20
        descriptionTextView.bottomToSuperview()
    }
    
    private func addSaveButton() {
        view.addSubview(saveButton)
        saveButton.leadingToSuperview().constant = 117
        saveButton.trailingToSuperview().constant = -117
        saveButton.bottomToSuperview().constant = -34
        saveButton.height(40)
    
    }
    
}
extension DetailViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if  textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .appRaven
        } else {
            descriptionText = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "descriptionText"
                textView.textColor = UIColor.lightGray
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            descriptionText = textView.text
        }
    }
}

// MARK: - Configure
extension DetailViewController {
    public func set(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        self.titleTextField.text = titleText
        self.descriptionText = descriptionText
        self.noteID = noteId
        self.type = type
    }
    private func configureContents() {
        view.backgroundColor = .white
        
    }
}

// MARK: - Actions
extension DetailViewController {
    @objc
    func backButtonTapped() {
        navigationController?.navigationBar.isHidden = true
        viewModel.showHomeScreen()
    }
    @objc
    func saveButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        viewModel.createNote(title: title, description: description)
    }
    @objc
    func updateButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        viewModel.updateNote(title: title, description: description, noteID: noteID)
    }
}


