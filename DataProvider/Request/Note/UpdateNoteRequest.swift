//
//  UpdateNoteRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 14.02.2022.
//

public struct UpdateNoteRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = CreateNoteResponse
    
    public var path: String
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(note: Note) {
        parameters["title"] = note.title
        parameters["note"] = note.note
        path = "notes/\(note.id)"
    }
    
}
