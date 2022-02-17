//
//  ForgotPassworButton.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import Foundation

public class ForgotPasswordButton: UIButton {
    
    public required init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .font(.josefinSansRegular, size: .small)
        setTitleColor(.appCinder, for: .normal)
        backgroundColor = .white
        titleLabel?.textAlignment = .right
    }
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enabled fatal_error unavailable_function
}
