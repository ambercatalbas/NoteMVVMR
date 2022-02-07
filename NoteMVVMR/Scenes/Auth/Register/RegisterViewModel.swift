//
//  RegisterViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import Foundation
import UIKit
import Alamofire
import DataProvider
import KeychainSwift


protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
  func showLoginScreen()
  func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
  let keychain = KeychainSwift()
  func showLoginScreen() {
    router.close()
  }

    
}
// MARK: - Network
extension RegisterViewModel {
  
  func sendRegisterRequest(username: String, email: String, password: String) {
//    request data
//    let parameters = ["full_name": username, "email": email, "password": password]
//
//    AF.request("https://notelistmvvmm.herokuapp.com/api/auth/register", method: .post, parameters: parameters).responseDecodable(of: RegisterResponse.self) { response in
//      let response = response.value
//      let token = response?.data?.accessToken
//      print(token)

  
//  }

    dataProvider.request(for: RegisterRequest(fullName: username, email: email, password: password)) { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case .success(let response):
        print(response.data?.accessToken)
        self.keychain.set(response.data?.accessToken ?? "", forKey: Keychain.token)
        self.router.close()
      case .failure(let error):
          self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
      }
  }
    
    
  }

}
