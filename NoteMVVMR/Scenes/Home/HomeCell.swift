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
    .spacing(0)
    .axis(.vertical)
    .alignment(.fill)
    .distribution(.fill)
    .build()
  private let titleLabel = UILabelBuilder()
    .font(.font(.nunitoBold, size: .xLarge))
    .textAlignment(.left)
    .textColor(.appCinder)
    .adjustsFontSizeToFitWidth(true)
    .build()
  private let descriptionLabel = UILabelBuilder()
    .font(.font(.nunitoSemiBold, size: .xLarge))
    .textAlignment(.left)
    .numberOfLines(2)
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
    addSubViews()
  }
  
  public func set(viewModel: HomeCellProtocol) {
    self.viewModel = viewModel
    titleLabel.text = viewModel.titleText
    descriptionLabel.text = viewModel.descriptionText
  }
  
}
extension HomeCell {
  
  private func addSubViews() {
    contentView.backgroundColor = .appWhite
    addContainerView()
  }
  
  private func addContainerView() {
    contentView.addSubview(containerView)
    containerView.edgesToSuperview()
    
    containerView.addSubview(textStackView)
    textStackView.topToSuperview()
    textStackView.bottomToSuperview()
    textStackView.leadingToSuperview().constant = 20
    textStackView.trailingToSuperview().constant = -20
    textStackView.addArrangedSubview(titleLabel)
    textStackView.addArrangedSubview(descriptionLabel)
  }
}
