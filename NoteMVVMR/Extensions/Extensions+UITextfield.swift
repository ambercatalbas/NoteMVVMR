//
//  Extensions+UITextfield.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 1.02.2022.
//

import Foundation
import UIKit

extension UITextField {
  
  enum Direction {
    case left
    case right
  }
  // add image to textfield
  func withImage(direction: Direction,
                 image: UIImage,
                 colorSeparator: UIColor,
                 colorBorder: UIColor,
                 backgroundColor: UIColor) {
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.5)
    view.layer.borderColor = colorBorder.cgColor
    view.backgroundColor = backgroundColor
    mainView.addSubview(view)
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)
    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if (Direction.left == direction) { // image left
      seperatorView.frame = CGRect(x: 45, y: 0, width: 1, height: 45)
      self.leftViewMode = .always
      self.leftView = mainView
    } else { // image right
      seperatorView.frame = CGRect(x: 0, y: 0, width: 1, height: 45)
      self.rightViewMode = .always
      self.rightView = mainView
    }
    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.5)
    self.layer.cornerRadius = 5
  }
}
// MARK: - ---use ---
//
// if let myImage = UIImage(named: "my_image"){
//    textfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.orange, colorBorder: UIColor.black)
// }
