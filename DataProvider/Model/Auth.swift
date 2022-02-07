//
//  Auth.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 5.02.2022.
//

//public struct Auth: Codable {
//    public let accessToken: String?
//    public let tokenType: String?
//
//    enum CodingKeys: String, CodingKey {
//        case accessToken = "access_token"
//        case tokenType = "token_type"
//    }
//}

// MARK: - Auth
public struct Auth: Codable {
  public let code: String?
  public let data: DataClass?
  public let message: String?
}

// MARK: - DataClass
public struct DataClass: Codable {
  public let accessToken, tokenType: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
