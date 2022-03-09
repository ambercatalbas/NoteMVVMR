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
        
        self.navigationController?.navigationBar.shadowImage = .add
        navigationBar.tintColor = .appCinder
        let titleTextAttributes = AttributedStringDictionaryBuilder()
            .font(.font(.josefinSansBold, size: .custom(size: 12)))
            .foregroundColor(.appCinder)
            .build()
        navigationBar.titleTextAttributes = titleTextAttributes
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
