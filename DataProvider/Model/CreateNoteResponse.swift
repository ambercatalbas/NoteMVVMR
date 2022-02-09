//
//  CreateNoteResponse.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 9.02.2022.
//

// MARK: - CreateNoteResponse
public struct CreateNoteResponse: Codable {
    let code: String?
    let data: Note?
    let message: String?
}

