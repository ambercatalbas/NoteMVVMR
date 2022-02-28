//
//  SearchView.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 28.02.2022.
//

import UIKit

public class SearchView: UIView {
    let searchBar = UISearchBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(searchBar)
        searchBar.returnKeyType = .done
        searchBar.searchTextField.text = "dtxcfyvu"
        searchBar.edgesToSuperview()
        searchBar.width(200)
        searchBar.height(47)
    }
    
}
