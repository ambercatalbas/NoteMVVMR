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
        
        guard emailPred.evaluate(with: email) else {
          print("error İSVALİDEMAİL")
//            ToastPresenter.showWarningToast(text: "Lütfen geçerli bir email adresi giriniz.")
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
          print("error İSVALİDPASSWORD")
//            ToastPresenter.showWarningToast(text: "Şifreniz en az 6 karaterden oluşmalıdır.")
            return false
        }
        return true
    }
    
}
