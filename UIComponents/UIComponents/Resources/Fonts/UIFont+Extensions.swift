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
        case nunitoSemiBold
        case nunitoBold
        case nunitoExtraBold
        case josefinSans
        case josefinSansItalic
        case josefinSansRegular
    }
    
    enum FontSize {
        /// 11
        case xSmall
        
        /// 12
        case small
        
        /// 13
        case medium
        
        /// 14
        case large
        
        /// 15
        case xLarge
        
        /// 16
        case xxLarge
        
        /// custom
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .xSmall:           return 11
            case .small:            return 12
            case .medium:           return 13
            case .large:            return 14
            case .xLarge:           return 15
            case .xxLarge:          return 16
            case .custom(let size): return size
            }
        }
    }
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        let font: UIFont
        switch weight {
        case .nunitoSemiBold:
            font = FontFamily.Nunito.semiBold.font(size: size.rawValue)
        case .nunitoBold:
            font = FontFamily.Nunito.bold.font(size: size.rawValue)
        case .nunitoExtraBold:
            font = FontFamily.Nunito.extraBold.font(size: size.rawValue)
        case .josefinSans:
            font = FontFamily.JosefinSans.normal.font(size: size.rawValue)
        case .josefinSansItalic:
            font = FontFamily.JosefinSans.italic.font(size: size.rawValue)
        case .josefinSansRegular:
            font = FontFamily.JosefinSans.regular.font(size: size.rawValue)

        }
        return font
    }
    
}
