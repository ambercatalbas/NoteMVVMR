//
//  ChangePasswordRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

import Alamofire

public struct ChangePasswordRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public var path: String = "users/me/password"
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(password: String, newPassword: String, newPasswordConfirmation: String) {
        parameters["password"] = password
        parameters["new_password"] = newPassword
        parameters["new_password_confirmation"] = newPasswordConfirmation
    }
}
