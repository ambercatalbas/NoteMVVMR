//
//  GetMyNotesRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 10.02.2022.
//

public struct GetMyNotesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = GetMyNotes
    
    public var path: String = "users/me/notes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int) {
     parameters["page"] = page
    }
    
}
