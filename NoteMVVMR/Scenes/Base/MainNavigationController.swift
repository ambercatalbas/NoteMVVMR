//
//  MainNavigationController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

class MainNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureContents()
    }
    
    private func configureContents() {
        let titleTextAttributes = AttributedStringDictionaryBuilder()
            .font(.font(.josefinSansSemibold, size: .medium))
            .foregroundColor(.appWhite)
            .build()
        navigationBar.barTintColor = .appRed
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .appWhite
        navigationBar.titleTextAttributes = titleTextAttributes
        UIBarButtonItem.appearance().setTitleTextAttributes(AttributedStringDictionaryBuilder()
                                                                .font(.font(.josefinSansSemibold, size: .large))
                                                                .foregroundColor(.appWhite)
                                                                .build(),
                                                            for: .normal)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .navigationBarGreen
            appearance.titleTextAttributes = titleTextAttributes
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -13), for: .default)
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
