//
//  RegisterRequest.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RegisterResponse

    public var path: String = "auth/register"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, email: String, password: String) {
        parameters["username"] = username
        parameters["email"] = email
        parameters["password"] = password
    }
    
}

