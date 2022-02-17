//
//  UIFont+Extensions.swift
//  UIComponents
//
//  Created by Mehmet Salih Aslan on 26.02.2021.
//  Copyright © 2021 Mobillium. All rights reserved.
//

import UIKit

public extension UIFont {
    
    enum FontWeight {
        case josefinSansMedium
        case josefinSansRegular
        case josefinSansItalic
        case josefinSansSemibold
        
    }
    
    enum FontSize {
        
        /// 13
        case small
        
        /// 15
        case medium
        
        /// 26
        case large
        
        /// custom
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .small:            return 13
            case .medium:           return 15
            case .large:            return 26
            case .custom(let size): return size
            }
        }
    }
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        let font: UIFont
        switch weight {
        case .josefinSansMedium:
            font = FontFamily.JosefinSans.medium.font(size: size.rawValue)
        case .josefinSansRegular:
            font = FontFamily.JosefinSans.regular.font(size: size.rawValue)
        case .josefinSansItalic:
            font = FontFamily.JosefinSans.italic.font(size: size.rawValue)
        case .josefinSansSemibold:
            font = FontFamily.JosefinSans.semiBold.font(size: size.rawValue)
        }
        return font
    }
    
}
