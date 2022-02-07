//
//  Auth.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import Foundation

// MARK: - Auth
public struct RegisterResponse: Codable {
  public let code: String?
  public let data: DataClass?
  public let message: String?
}

// MARK: - DataClass
public struct DataClass: Codable {
  
  public let accessToken: String?
  public let tokenType: String?
  
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

public struct Auth: Decodable {
    public let token: String
}

