//
//  Auth.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 5.02.2022.
//

// MARK: - Auth
struct Auth: Codable {
    let code: String?
    let data: DataClass?
    let message: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken, tokenType: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
