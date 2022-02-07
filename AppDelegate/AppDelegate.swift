//
//  AppDelegate.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 31.01.2022.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 
  static let shared = UIApplication.shared.delegate as! AppDelegate
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureIQKeyboardManager()
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        AppRouter.shared.startApp()
        self.window?.makeKeyAndVisible()
        return true
    }
}

