//
//  CreateNoteRequest.swift
//  DataProvider
//
//  Created by AMBER ÇATALBAŞ on 9.02.2022.
//
import Alamofire

public struct CreateNoteRequest: APIDecodableResponseRequest {

  public typealias ResponseType = CreateNoteResponse
  
  public var path: String = "notes"
  public var method: RequestMethod = .post
  public var parameters: RequestParameters = [:]
  public var headers: RequestHeaders = [:]
  
  public init(title: String, description: String) {
    parameters["title"] = title
    parameters["note"] = description
    
  }
  
}
