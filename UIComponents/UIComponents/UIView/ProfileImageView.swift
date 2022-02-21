//
//  ProfileImageView.swift
//  UIComponents
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

import UIKit

public class ProfileImageView: UIView {
    let imageView = UIImageViewBuilder()
        .borderColor(.init(red: 139, green: 140, blue: 255, alpha: 1))
        .borderWidth(1)
        .contentMode(.scaleAspectFill)
        .masksToBounds(true)
        .clipsToBounds(true)
        .backgroundColor(.red)
        .image(.profilPhoto)
        .cornerRadius(15)
        .build()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(imageView)
        imageView.size(.init(width: 30, height: 30))
        imageView.centerYToSuperview()
        imageView.centerXToSuperview()
    }
    
}
