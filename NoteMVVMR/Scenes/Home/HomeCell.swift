//
//  HomeCell.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public class HomeCell: UITableViewCell, ReusableView {
  public static var defaultReuseIdentifier = "homeCell"
  
    weak var viewModel: HomeCellProtocol?
    
  private let containerView = UIView()
  private let textStackView = UIStackViewBuilder()
      .spacing(10)
      .axis(.vertical)
      .build()
  private let titleLabel = UILabelBuilder()
      .font(.font(.nunitoBold, size: .xxLarge))
      .textAlignment(.center)
      .textColor(.appCinder)
      .adjustsFontSizeToFitWidth(true)
      .build()
  private let descriptionLabel = UILabelBuilder()
      .font(.font(.nunitoSemiBold, size: .xLarge))
      .textAlignment(.center)
      .numberOfLines(0)
      .textColor(.appRaven)
      .build()
  
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
