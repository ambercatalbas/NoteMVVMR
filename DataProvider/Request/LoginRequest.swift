//
//  LoginRequest.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import Foundation

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RegisterResponse

    public var path: String = "auth/login"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, password: String) {
        parameters["username"] = username
        parameters["password"] = password
    }
    
}
