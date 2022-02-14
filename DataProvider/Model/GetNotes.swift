//
//  GetNotes.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 9.02.2022.
//

// MARK: - GetNotes
public struct GetNotes: Codable {
 public let code: String?
 public let data: Notes
 public let message: String?
}

// MARK: - Notes
public struct Notes: Codable {
 public let currentPage: Int?
 public let data: [Note]
}

