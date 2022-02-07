//
//  APIDecodableResponseRequest.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

public protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - url
public extension APIDecodableResponseRequest {
    var url: String {
        return "https://notelistmvvmm.herokuapp.com/api/" + path
    }
}

// MARK: - RequestParameters
public extension APIDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
