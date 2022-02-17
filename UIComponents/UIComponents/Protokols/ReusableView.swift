//
//  ReusableView.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 10.02.2022.
//

public protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}
