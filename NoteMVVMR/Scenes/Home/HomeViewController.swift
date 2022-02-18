//
//  HomeViewController.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

import UIKit
import KeychainSwift
import DataProvider
import UIComponents
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private let addButton = UIButtonBuilder()
        .title("   ADD NOTE")
        .tintColor(.white)
        .image(.addIcon)
        .cornerRadius(4)
        .build()
    private let searchController = UISearchController(searchResultsController: nil)
    private let profileImage = UIImageViewBuilder()
        .cornerRadius(20)
        .build()
    let keychain = KeychainSwift()
    private let refreshControl = UIRefreshControl()
    var filteredItems: [HomeCellProtocol] = []
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.fetchNotesListing()
        subscribeViewModelEvents()
        addSearchController()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .hamburgerIcon, style: .done, target: self, action: #selector(reloadData))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .addIcon,
                                                            style: .done, target: self, action: #selector(profileButtonTapped))
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
    private func addSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Notes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
        makeTableView()
        makeAddNoteButton()
    }
    private func makeTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
    }
    private func makeAddNoteButton() {
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.backgroundColor = .appBlueBerry
        addButton.bottomToSuperview().constant = -34
        addButton.centerXToSuperview()
        addButton.height(42)
        addButton.width(140)
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
    private func addButtonTapped() {
        viewModel.addNote(titleText: "", descriptionText: "Description...", noteId: 0, type: .add)
    }
    @objc
    private func profileButtonTapped() {
        viewModel.showProfileScreen()
    }
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.fetchNotesListing() : tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredItems.count
        }
        return viewModel.numberOfItemsAt(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem: HomeCellProtocol
        if isFiltering {
            cellItem = filteredItems[indexPath.row]
        } else {
            cellItem = viewModel.cellItemAt(indexPath: indexPath)
        }
        cell.set(viewModel: cellItem)
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(76.5)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellItem: HomeCellProtocol
        if isFiltering {
            cellItem = filteredItems[indexPath.row]
            let title = filteredItems[indexPath.row].titleText
            let description = filteredItems[indexPath.row].descriptionText
            let noteID = filteredItems[indexPath.row].noteID
            viewModel.didSelectRow(titleText: title, descriptionText: description, noteId: noteID, type: .showNote)
        } else {
            cellItem = viewModel.cellItemAt(indexPath: indexPath)
            let title = self.viewModel.cellItems[indexPath.row].titleText
            let description = self.viewModel.cellItems[indexPath.row].descriptionText
            let noteID = self.viewModel.cellItems[indexPath.row].noteID
            viewModel.didSelectRow(titleText: title, descriptionText: description, noteId: noteID, type: .showNote)
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            self.swipeDeleteAction(indexPath: indexPath)
            completionHandler(true)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            (action, sourceView, completionHandler) in
            self.swipeEditAction(indexPath: indexPath)
            completionHandler(true)
        }
        editAction.backgroundColor = UIColor(red: 255/255.0, green: 128.0/255.0, blue: 0.0, alpha: 1.0)
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
    fileprivate func swipeDeleteAction(indexPath: IndexPath) {
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        self.viewModel.deleteNote(noteID: noteID)
        tableView.reloadData()
    }
    fileprivate func swipeEditAction(indexPath: IndexPath) {
        let title = self.viewModel.cellItems[indexPath.row].titleText
        let description = self.viewModel.cellItems[indexPath.row].descriptionText
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        self.viewModel.editRow(titleText: title, descriptionText: description, noteId: noteID, type: .update)
    }
    func filterContentForSearchText(_ searchText: String ) {
        filteredItems = viewModel.cellItems.filter { (item: HomeCellProtocol) -> Bool in
            return item.titleText.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
}
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
        
    }
    
}
