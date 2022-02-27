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
    private let scrollView = UIScrollViewBuilder()
        .alwaysBounceVertical(true)
        .build()
    private let contentView = UIViewBuilder()
        .build()
    private let titleTextField = UITextFieldBuilder()
        .font(.font(.josefinSansSemibold, size: .custom(size: 22)))
        .textColor(.appCinder)
        .placeholder(Strings.DetailViewController.noteTitlePlaceholder)
        .textAlignment(.left)
        .build()
    private let descriptionTextView = UITextViewBuilder()
        .font(.font(.josefinSansRegular, size: .custom(size: 16)))
        .textColor(.appRaven)
        .textAlignment(.left)
        .build()
    private let saveButton = LoginButton(title: Strings.DetailViewController.saveButtonTitle)
    let keychain = KeychainSwift()
    var noteID: Int = 0
    var titleText: String = Strings.DetailViewController.noteTitlePlaceholder
    var descriptionText: String = Strings.DetailViewController.descriptionTitlePlaceholder
    var navigationTitle: String = Strings.DetailViewController.detailsTitle
    var type: DetailVCShowType = .add
    
    private var saveButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
    }
    
    @objc
    func keyboardNotification(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let endFrameY = endFrame?.origin.y ?? 0
        let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        
        if endFrameY >= UIScreen.main.bounds.size.height {
            self.saveButtonBottomConstraint.constant = -34
        } else {
            self.saveButtonBottomConstraint.constant = -20 - (endFrame?.height ?? CGFloat(0))
        }
        UIView.animate(withDuration: duration,
                       delay: TimeInterval(0),
                       options: animationCurve,
                       animations: { self.view.layoutIfNeeded() },
                       completion: nil)
    }
}

// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        descriptionTextView.delegate = self
        switch type {
        case .showNote:
            makeScrollView()
            makeContentView()
            makeTitleTextField()
            makeDescriptionTextView()
            descriptionTextView.isEditable = false
            titleTextField.isEnabled = false
            navigationTitle = Strings.DetailViewController.detailsTitle
            
        case .add:
            makeScrollView()
            makeContentView()
            makeTitleTextField()
            makeDescriptionTextView()
            addSaveButton()
            saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
            descriptionTextView.textColor = .lightGray
            navigationTitle = Strings.DetailViewController.addTitle
        case .update:
            makeScrollView()
            makeContentView()
            makeTitleTextField()
            makeDescriptionTextView()
            addSaveButton()
            saveButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
            navigationTitle = Strings.DetailViewController.editTitle
        }
    }
    private func makeScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
    }
    
    private func makeContentView() {
        scrollView.addSubview(contentView)
        contentView.widthToSuperview()
        contentView.edgesToSuperview()
    }
    
    private func makeTitleTextField() {
        contentView.addSubview(titleTextField)
        titleTextField.topToSuperview().constant = 20
        titleTextField.leadingToSuperview().constant = 20
        titleTextField.trailingToSuperview().constant = -20
        titleTextField.height(23)
        titleTextField.returnKeyType = .done
    }
    
    private func makeDescriptionTextView() {
        contentView.addSubview(descriptionTextView)
        descriptionTextView.topToBottom(of: titleTextField).constant = 19
        descriptionTextView.leadingToSuperview().constant = 20
        descriptionTextView.trailingToSuperview().constant = -20
        descriptionTextView.bottomToSuperview().constant = 0
        descriptionTextView.height(UIScreen.main.bounds.height)
        descriptionTextView.returnKeyType = .done
        
    }
    
    private func addSaveButton() {
        view.addSubview(saveButton)
        saveButton.leadingToSuperview().constant = 117
        saveButton.trailingToSuperview().constant = -117
        saveButton.height(40)
        saveButtonBottomConstraint = saveButton.bottomToSuperview(usingSafeArea: false)
        saveButtonBottomConstraint.constant = -34
        saveButtonBottomConstraint.isActive = true
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
        titleTextField.delegate = self
        descriptionTextView.delegate = self
        descriptionTextView.text = descriptionText
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = navigationTitle
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .backArrow, style: .plain, target: self, action: #selector(backButtonTapped))
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
        navigationController?.navigationBar.isHidden = true
    }
    @objc
    func updateButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        viewModel.updateNote(title: title, description: description, noteID: noteID)
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - UITextViewDelegate
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
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

// MARK: - UITextFieldDelegate
extension DetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return false
    }
}
