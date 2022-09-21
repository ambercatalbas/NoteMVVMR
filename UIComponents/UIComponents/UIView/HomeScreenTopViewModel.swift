//
//  HomeScreenTopViewModel.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 21.02.2022.
//

import Foundation

public protocol HomeScreenTopViewDataSource: AnyObject {
        
    var placeholderText: String { get set }
    var profileImage: UIImage { get set }

}

public protocol HomeScreenTopViewEventSource: AnyObject {
}

public protocol HomeScreenTopViewProtocol: HomeScreenTopViewDataSource, HomeScreenTopViewEventSource {
}

public final class HomeScreenTopViewModel: HomeScreenTopViewProtocol {
        
    public var placeholderText: String
    
    public var profileImage: UIImage

    public init(placeholderText: String, profileImage: UIImage) {
        self.placeholderText = placeholderText
        self.profileImage = profileImage
        
    }
}

