//
//  PasswordTextField.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import UIKit

public class PasswordTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    public init(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12), isSecureTextEntry: Bool = true) {
        self.insets = insets
        super.init(frame: .zero)
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.appTextFieldBorderColor.cgColor
        placeholder = Strings.Placeholder.password
        keyboardType = .default
        returnKeyType = .done
        self.isSecureTextEntry = isSecureTextEntry
        font = .font(.josefinSansRegular, size: .custom(size: 13))
    }
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enabled fatal_error unavailable_function
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

}
