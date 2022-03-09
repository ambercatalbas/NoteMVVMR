//
//  HomeScreenTopView.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 21.02.2022.
//

import UIKit

public class HomeScreenTopView: UIView {
    
    private let hamburgerIconButton = UIButtonBuilder()
        .backgroundColor(.white)
        .tintColor(.appCinder)
        .image(.hamburgerIcon)
        .build()
    public let searchTextField = UITextFieldBuilder()
        .cornerRadius(4)
        .borderColor(UIColor.appTextFieldBorderColor.cgColor)
        .placeholder(Strings.Placeholder.search)
        .font(.font(.josefinSansRegular, size: .custom(size: 13)))
        .build()
    private let profileButton = UIButtonBuilder()
        .masksToBounds(true)
        .clipsToBounds(true)
        .cornerRadius(16)
        .borderWidth(2)
        .borderColor(UIColor.appBlueBerry.cgColor)
        .backgroundImage(.imgWalkthrough4)
        .imageEdgeInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        .build()
    private let cancelButton = UIButtonBuilder()
        .title(Strings.General.cancel)
        .tintColor(.appBlueBerry)
        .titleFont(.font(.josefinSansSemibold, size: .custom(size: 12)))
        .build()
    private let profilImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .masksToBounds(true)
        .clipsToBounds(true)
        .backgroundColor(.red)
        .cornerRadius(15)
        .image(.profilPhoto)
        .borderWidth(2)
        .build()
    private let lineView = UIViewBuilder()
        .backgroundColor(.appLineViewColor)
        .build()
    public var profileButtonTapped: VoidClosure?
    public var cancelButtonTapped: VoidClosure?
    public var hamburgerButtonTapped: VoidClosure?
    public var searchTextFieldTapped: StringClosure?
    weak var viewModel: HomeScreenTopViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        backgroundColor = .clear
        makeHamburgerIconButton()
        makeSearchTextField()
        makeProfileButton()
        makeLineView()
        makeCancelButton()
        hamburgerIconButton.addTarget(self, action: #selector(hamburgerButtonTapped(_:)), for: .touchUpInside)
        searchTextField.withImage(direction: .left, image: .searchIcon,
                                  colorSeparator: UIColor.white, colorBorder: .appRaven, backgroundColor: .white)
        searchTextField.returnKeyType = .done
        searchTextField.addTarget(self, action: #selector(textSearchChange(_:)), for: .editingChanged)
        profileButton.addTarget(self, action: #selector(profileButtonTapped(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)

    }
    
    private func makeHamburgerIconButton() {
        addSubview(hamburgerIconButton)
        hamburgerIconButton.height(16)
        hamburgerIconButton.width(18)
        hamburgerIconButton.leftToSuperview().constant = 10
        hamburgerIconButton.centerYToSuperview()
    }
    
    private func makeSearchTextField() {
        addSubview(searchTextField)
        searchTextField.topToSuperview()
        searchTextField.leadingToSuperview().constant = 75
        searchTextField.trailingToSuperview().constant = -75
        searchTextField.height(40)
        searchTextField.bottomToSuperview().constant = -5
        searchTextField.centerYToSuperview()

    }
    
    private func makeProfileButton() {
        addSubview(profileButton)
        profileButton.trailingToSuperview().constant = -10
        profileButton.centerYToSuperview()
        profileButton.width(32)
        profileButton.height(32)
    }
    
    private func makeCancelButton() {
        addSubview(cancelButton)
        cancelButton.trailingToSuperview().constant = -18
        cancelButton.centerYToSuperview()
        cancelButton.width(40)
        cancelButton.height(9)
        cancelButton.isHidden = true
    }
    
    private func makeLineView() {
        addSubview(lineView)
        lineView.height(1)
        lineView.leadingToSuperview()
        lineView.trailingToSuperview()
        lineView.bottomToSuperview()
    }
    
    private func updateCancelButton() {
        profileButton.isHidden = true
        cancelButton.isHidden = false
    }
    
}

// MARK: - Actions
extension HomeScreenTopView {
    
    public func set(viewModel: HomeScreenTopViewProtocol) {
        self.viewModel = viewModel
        profileButton.setImage(viewModel.profileImage, for: .normal)
        searchTextField.placeholder = viewModel.placeholderText
    }
    
    @objc
    private func hamburgerButtonTapped(_ sender: Any?) {
        hamburgerButtonTapped?()
    }
    
    @objc
    private func profileButtonTapped(_ sender: Any?) {
        profileButtonTapped?()
    }
    
    @objc
    private func cancelButtonTapped(_ sender: Any?) {
        cancelButton.isHidden = true
        profileButton.isHidden = false
        searchTextField.text?.removeAll()
        searchTextFieldTapped?("")
    }
    
    @objc
    private func textSearchChange(_ sender: UITextField) {
        searchTextFieldTapped?(sender.text ?? "")
        updateCancelButton()
    }
}
