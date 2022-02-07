//
//  AlertUtility.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 1.02.2022.
//

import UIKit

final class AlertUtility {
  
  static let shared = AlertUtility()
  
  func present(title: String,
               message: String,
               buttonTitle: String = "OK",
               handler: ((UIAlertAction) -> Void)? = nil,
               delegate: UIViewController) {
    
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: handler))
    delegate.present(alertController, animated: true, completion: nil)
  }
  
  func multiButton(title: String,
                   message: String,
                   buttonTitle: String = "OK",
                   buttonTitle1: String = "CANCEL",
                   handler: ((UIAlertAction) -> Void)? = nil,
                   handler1: ((UIAlertAction) -> Void)? = nil,
                   delegate: UIViewController) {
    
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: handler))
    alertController.addAction(UIAlertAction(title: buttonTitle1, style: .default, handler: handler1))
    delegate.present(alertController, animated: true, completion: nil)
  }
}
