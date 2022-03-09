//
//  GetMyNotes.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 25.02.2022.
//

import Foundation

// MARK: - GetMyNotes
public struct GetMyNotes: Codable {
    public let code: String
    public let data: Data
    public let message: String?
}

// MARK: - Data
public struct Data: Codable {
    public let currentPage: Int
    public let data: [Note]
    public let from: Int
    public let lastPage: Int
    public let perPage: Int
    public let to: Int
    public let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case from
        case lastPage = "last_page"
        case perPage = "per_page"
        case to
        case total
    }
}
