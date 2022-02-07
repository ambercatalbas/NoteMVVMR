//
//  HomeCell.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public class HomeCell: UITableViewCell, ReusableView {
  public static var defaultReuseIdentifier = "homeCell"
  
    
    weak var viewModel: HomeCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
