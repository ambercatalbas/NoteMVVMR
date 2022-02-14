//
//  AppRouter.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import Foundation
import UIKit
import MobilliumUserDefaults
import KeychainSwift

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = LoginRoute & HomeRoute
    
    static let shared = AppRouter()
    
    func startApp() {
     let keychain = KeychainSwift()
     let token = keychain.get(Keychain.token)
     if token != nil {
      pushHome()
     } else {
      pushLogin()
     }
    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil

    }
    
}
