//
//  HomeCellModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import Foundation

public protocol HomeCellDataSource: AnyObject {
  var titleText: String { get }
  var descriptionText: String { get }
}

public protocol HomeCellEventSource: AnyObject {
    
}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {
    
}

public final class HomeCellModel: HomeCellProtocol {
 
  public var titleText: String
  public var descriptionText: String
  
  public init(titleText: String, descriptionText: String) {
      self.titleText = titleText
      self.descriptionText = descriptionText
  }
}
