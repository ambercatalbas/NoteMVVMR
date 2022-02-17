//
//  LoginButton.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import Foundation

public class LoginButton: UIButton {
    
   public required init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .font(.josefinSansSemibold, size: .medium)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 4
        backgroundColor = .appBlueBerry
    }
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enabled fatal_error unavailable_function
}
