//
//  ToastWarning.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 22.02.2022.
//

import UIKit

class ToastWarningView: UIView {
    
    private let label = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: .custom(size: 13)))
        .textColor(.appWhite)
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    
    init(text: String) {
        label.text = text
        label.sizeToFit()
        super.init(frame: .zero)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(label)
        label.height(44)
        label.topToSuperview()
        label.bottomToSuperview()
        label.leadingToSuperview().constant = 55
        label.trailingToSuperview().constant = -55
        label.baselineAdjustment = .alignCenters
        
    }
    
}

