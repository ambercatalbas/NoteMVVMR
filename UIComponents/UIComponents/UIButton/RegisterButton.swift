//
//  RegisterButton.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import Foundation

public class RegisterButton: UIButton {
    
    let blackText: String
    let bluberyText: String
    
    public required init(blackText: String, blueberryText: String) {
        self.blackText = blackText
        self.bluberyText = blueberryText
        super.init(frame: .zero)
        titleLabel?.font = .font(.josefinSansRegular, size: .medium)
        setTitleColor(.appBlueBerry, for: .normal)
        backgroundColor = .white
        titleLabel?.textAlignment = .left
        setColorTitle()
    }
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enabled fatal_error unavailable_function
    func setColorTitle() {
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: blackText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.appRaven]))
        text.append(NSAttributedString(string: " ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]))
        text.append(NSAttributedString(string: bluberyText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.appBlueBerry]))
        self.titleLabel?.attributedText = text
        self.setAttributedTitle(text, for: .normal)
    }
}
