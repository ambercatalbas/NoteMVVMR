//
//  AppDelegate+IQKeyboardManager.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 31.01.2022.
//

import IQKeyboardManagerSwift

extension AppDelegate {
    
    func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(CommentListViewController.self)
//        IQKeyboardManager.shared.disabledToolbarClasses.append(CommentListViewController.self)
//        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(CommentEditViewController.self)
//        IQKeyboardManager.shared.disabledToolbarClasses.append(CommentEditViewController.self)
    }
}
