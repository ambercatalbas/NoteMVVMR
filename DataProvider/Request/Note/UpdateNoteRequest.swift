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
    
    public init(title: String, description: String, noteID: Int) {
        parameters["title"] = title
        parameters["note"] = description
        path = "notes/\(noteID)"
    }
    
}
