//
//  TitleLabel.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//
import UIKit

public class TitleLabel: UILabel {
    
    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat
    
    public init(withInsets top: CGFloat = 0, _ bottom: CGFloat = 0, _ left: CGFloat = 0, _ right: CGFloat = 0, text: String) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: CGRect.zero)
        self.textColor = .appCinder
        self.textAlignment = .center
        self.font = .font(.josefinSansRegular, size: .large)
        self.numberOfLines = 0
        self.text = text
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enabled fatal_error unavailable_function
    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    public override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += topInset + bottomInset
        contentSize.width += leftInset + rightInset
        return contentSize
    }
    
}
