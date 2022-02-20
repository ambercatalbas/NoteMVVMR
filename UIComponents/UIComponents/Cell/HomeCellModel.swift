//
//  HomeCellModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import Foundation

public protocol HomeCellDataSource: AnyObject {
    var titleText: String { get set }
    var descriptionText: String { get set }
    var noteID: Int { get set }
    
}

public protocol HomeCellEventSource: AnyObject {
    
}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {
    
}

public final class HomeCellModel: HomeCellProtocol {
    
    public var titleText: String
    public var descriptionText: String
    public var noteID: Int
    
    public init(title: String, description: String, noteID: Int) {
        self.titleText = title
        self.descriptionText = description
        self.noteID = noteID
        
    }
}
