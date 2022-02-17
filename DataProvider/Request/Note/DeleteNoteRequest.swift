//
//  DeleteNoteRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 14.02.2022.
//

public struct DeleteNoteRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public var path: String
    public var method: RequestMethod = .delete
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(noteID: Int) {
        path = "notes/\(noteID)"
    }
    
}
