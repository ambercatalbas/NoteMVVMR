//
//  PasswordResetRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 18.02.2022.
//

public struct PasswordResetRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public var path: String = "auth/forgot-password"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
    
}
