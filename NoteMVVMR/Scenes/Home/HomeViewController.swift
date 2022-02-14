//
//  HomeViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import UIKit
import KeychainSwift
import DataProvider

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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: .reloadDataNotification, object: nil)
    }
    @objc
    private func reloadData() {
        viewModel.fetchNotesListing()
        view.backgroundColor = .red
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
        let title = self.viewModel.cellItems[indexPath.row].titleText
        let description = self.viewModel.cellItems[indexPath.row].descriptionText
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        viewModel.didSelectRow(titleText: title, descriptionText: description, noteId: noteID)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //*********** DELETE (.destructive = red color) ***********
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            let noteID = self.viewModel.cellItems[indexPath.row].noteID
            self.viewModel.deleteNote(noteID: noteID)
            tableView.reloadData()
            completionHandler(true)
        }
        
        
        // *********** EDIT ***********
        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            (action, sourceView, completionHandler) in
            // 1. Segue to Edit view MUST PASS INDEX PATH as Sender to the prepareSegue function
            let title = self.viewModel.cellItems[indexPath.row].titleText
            let description = self.viewModel.cellItems[indexPath.row].descriptionText
            let noteID = self.viewModel.cellItems[indexPath.row].noteID
            self.viewModel.editRow(titleText: title, descriptionText: description, noteId: noteID)
            completionHandler(true)
            
        }
        
        editAction.backgroundColor = UIColor(red: 255/255.0, green: 128.0/255.0, blue: 0.0, alpha: 1.0)
        // end action Edit
        
        // SWIPE TO LEFT CONFIGURATION
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        // Delete should not delete automatically
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
    }
    
    fileprivate func swipeDeleteAction(note: Note, indexPath: IndexPath) {
        
    }
    
}
