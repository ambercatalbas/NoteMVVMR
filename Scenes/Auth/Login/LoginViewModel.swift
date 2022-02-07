//
//  LoginViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 1.02.2022.
//

import Foundation
import Alamofire

protocol LoginViewDataSource {
  
}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
  func showRegisterOnWindow()
  func sendLoginRequest(email: String, password: String)
  func pushPasswordResetScene()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
  func showRegisterOnWindow() {
    router.pushRegister()
    
  }
  
  func pushPasswordResetScene() {
    router.pushPasswordReset()
  }
  
  func sendLoginRequest(email: String, password: String) {

    let credential = URLCredential(user: email, password: password, persistence: .forSession)

    AF.request("https://httpbin.org/basic-auth/\(email)/\(password)")
      .authenticate(with: credential)
        .responseJSON { response in
            debugPrint(response)
        }
    
  }
   
}
