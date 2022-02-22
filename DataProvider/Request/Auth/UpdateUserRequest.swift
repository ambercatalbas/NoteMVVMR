//
//  UpdateUserRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

public struct UpdateUserRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = GetUserResponse
    
    public var path: String = "users/me"
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(userName: String, email: String) {
        parameters["full_name"] = userName
        parameters["email"] = email
    }
    
}
