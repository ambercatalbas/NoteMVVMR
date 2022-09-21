//
//  Validation.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 31.01.2022.
//

import Foundation
import UIKit

class Validation {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        let emailRegExa = "[A-Z0-9a-z._%+-]+[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPreda = NSPredicate(format: "SELF MATCHES %@", emailRegExa)
        guard emailPred.evaluate(with: email) else {
            if emailPreda.evaluate(with: email) {
                ToastPresenter.showWarningToast(text: Strings.Error.incorrectEmailFormata, entryBackground: .appRed)
                return false
            } else {
                ToastPresenter.showWarningToast(text: Strings.Error.incorrectEmailFormat, entryBackground: .appRed)
                return false
            }
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
            ToastPresenter.showWarningToast(text: Strings.Error.passwordCharacter, entryBackground: .appRed)
            return false
        }
        return true
    }
    
}
