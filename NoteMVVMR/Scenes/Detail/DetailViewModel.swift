//
//  DetailViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

import Foundation
import Alamofire

protocol DetailViewDataSource {}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {
  func createNote(title: String, description: String)
}

final class DetailViewModel: BaseViewModel<DetailRouter>, DetailViewProtocol {
  func createNote(title: String, description: String) {
    dataProvider.request(for: CreateNoteRequest(title: title, description: description)) { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case .success(let response):
        self.router.close()
        print("sccs üçlü:\(title)-- \(description)-- ")
      case .failure(let error):
          self.showWarningToast?("\(error.localizedDescription) \(L10n.Error.checkInformations)")
        print("failure -üçlü:\(title)-- \(description)--")
      }
  }
  }
  
  func createNoteAF(title: String, description: String, token: String) {
  let headers: HTTPHeaders = [
      "Authorization": "\(token)"
  ]
    let parameters = ["title": title, "note": description]
 
    AF.request("https://notelistmvvmm.herokuapp.com/api/notes", method: .post, parameters: parameters, headers: headers).responseDecodable(of: CreateNoteResponse.self) { response in
      debugPrint(response)
  }
    
}
}
