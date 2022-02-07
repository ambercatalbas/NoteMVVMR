//
//  RegisterViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import Foundation
import UIKit
import Alamofire


protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
  func showLoginScreen()
  func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
  
  func showLoginScreen() {
    router.close()
  }

    
}
// MARK: - Network
extension RegisterViewModel {
  
  func sendRegisterRequest(username: String, email: String, password: String) {
//    request data
    let parameters = ["full_name": username, "email": email, "password": password]
   
    AF.request("https://notelistmvvmm.herokuapp.com/api/auth/register", method: .post, parameters: parameters).responseDecodable(of: RegisterResponse.self) { response in
      let response = response.value
      let token = response?.data?.accessToken
      print(token)
//      save token userdefaults or keychain
    }

  }

}
