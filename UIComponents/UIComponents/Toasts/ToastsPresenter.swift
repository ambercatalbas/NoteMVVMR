//
//  ToastsPresenter.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 22.02.2022.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String, entryBackground: UIColor) {
        var attributes = EKAttributes.topNote
        attributes.entryBackground = .color(color: EKColor(entryBackground))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        attributes.statusBar = .hidden

        let customView = ToastWarningView(text: text)

        SwiftEntryKit.display(entry: customView, using: attributes)
    }
}
