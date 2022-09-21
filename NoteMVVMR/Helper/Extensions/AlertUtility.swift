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
                 handler: ((UIAlertAction) -> Void)?,
                 delegate: UIViewController) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: handler))
        delegate.present(alertController, animated: true, completion: nil)
    }
    
    func multiButton(title: String,
                     message: String,
                     firstButtonTitle: String = "OK",
                     secondButtonTitle1: String = "CANCEL",
                     firstButtonHandler: ((UIAlertAction) -> Void)? = nil,
                     secondButtonHandler: ((UIAlertAction) -> Void)? = nil,
                     delegate: UIViewController) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: firstButtonTitle, style: .default, handler: firstButtonHandler))
        alertController.addAction(UIAlertAction(title: secondButtonTitle1, style: .default, handler: secondButtonHandler))
        delegate.present(alertController, animated: true, completion: nil)
    }
}
