//
//  HomeCell.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import UIKit
import TinyConstraints

public class HomeCell: UITableViewCell, ReusableView {
    public static var defaultReuseIdentifier = "homeCell"
    
    weak var viewModel: HomeCellProtocol?
    
    private let containerView = UIView()
    private let textStackView = UIStackViewBuilder()
        .spacing(12)
        .axis(.vertical)
        .alignment(.fill)
        .distribution(.fillEqually)
        .build()
    private let titleLabel = VerticalAlignLabel()
    private let descriptionLabel = VerticalAlignLabel()
    
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
    
}

extension HomeCell {
    public func set(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
    }
}
extension HomeCell {
    
    private func addSubViews() {
        contentView.backgroundColor = .appWhite
        makeContainerView()
        makeTextStackView()
        makeTitleLabel()
        makeDescriptionLaabel()
        
    }
    private func makeContainerView() {
        contentView.addSubview(containerView)
        containerView.edgesToSuperview()
    }
    private func makeTextStackView() {
        containerView.addSubview(textStackView)
        textStackView.topToSuperview()
        textStackView.bottomToSuperview()
        textStackView.leadingToSuperview().constant = 20
        textStackView.trailingToSuperview().constant = -20
    }
    private func makeTitleLabel() {
        textStackView.addArrangedSubview(titleLabel)
        titleLabel.verticalAlignment = .bottom
        titleLabel.font = .font(.josefinSansSemibold, size: .custom(size: 13))
        titleLabel.textAlignment = .left
        titleLabel.textColor = .appCinder
    }
    private func makeDescriptionLaabel() {
        textStackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.verticalAlignment = .top
        descriptionLabel.font = .font(.josefinSansRegular, size: .custom(size: 13))
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = .appRaven
    }
}
