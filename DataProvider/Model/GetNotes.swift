//
//  GetNotes.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 9.02.2022.
//

// MARK: - GetNotesResponse
struct GetNotesResponse: Codable {
    let code: String?
    let data: Data?
    let message: String?
}

// MARK: - DataClass
struct Notes: Codable {
    let currentPage: Int?
    let notes: [Note]?
}

