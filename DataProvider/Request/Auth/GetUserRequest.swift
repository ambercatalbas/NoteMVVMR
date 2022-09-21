//
//  GetUserRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

public struct GetUserRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = GetUserResponse
    
    public var path: String = "users/me"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
