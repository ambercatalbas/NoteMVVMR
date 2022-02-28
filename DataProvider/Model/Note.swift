//
//  Note.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 9.02.2022.
//

// MARK: - Note
public struct Note: Codable {
    public var title: String = ""
    public var note: String = ""
    public var id: Int = 0

    
    public init(title: String, description: String, noteID: Int) {
        self.title = title
        self.note = description
        self.id = noteID
        
    }
}

