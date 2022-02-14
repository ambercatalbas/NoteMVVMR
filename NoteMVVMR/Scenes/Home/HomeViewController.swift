//
//  HomeViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import UIKit
import KeychainSwift

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    let keychain = KeychainSwift()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.fetchNotesListing()
        subscribeViewModelEvents()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchRecipes = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

// MARK: - UILayout
extension HomeViewController {
    private func addSubViews() {
        addTableView()
    }
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
}
// MARK: - Configure
extension HomeViewController {
    private func configureContents() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.defaultReuseIdentifier)
        tableView.refreshControl = refreshControl
    }
}
// MARK: - Actions
extension HomeViewController {
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.fetchNotesListing() : tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(indexPath: indexPath)
    }
}
