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
    private let topView = HomeScreenTopView()
    private let addButton = UIButtonBuilder()
        .title(Strings.HomeViewController.addNoteButtonTitle)
        .tintColor(.white)
        .image(.addIcon)
        .cornerRadius(4)
        .build()
    let keychain = KeychainSwift()
    private let refreshControl = UIRefreshControl()
    var filteredItems: [HomeCellProtocol] = []
    var searchText: String = ""
    var isSearchTextEmpty: Bool {
        return searchText.isEmpty ?? true
    }
    var isFiltering: Bool {
        return !isSearchTextEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureContents()
        viewModel.fetchNotesListing()
        subscribeViewModelEvents()
        navigationController?.navigationBar.isHidden = true
        
        setProfilButtonAction()
        searchAction()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: .reloadDataNotification, object: nil)

    }
    
    @objc
    private func reloadData() {
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

// MARK: - Configure
extension HomeViewController {
    private func configureContents() {
        view.backgroundColor = .white
        makeTopView()
        makeTableView()
        makeAddNoteButton()
    }
    private func makeTableView() {
        view.addSubview(tableView)
        tableView.topToBottom(of: topView)
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.bottomToSuperview()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.defaultReuseIdentifier)
        tableView.refreshControl = refreshControl
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
    private func makeTopView() {
        view.addSubview(topView)
        topView.backgroundColor = .white
        topView.topToSuperview().constant = 44
        topView.leadingToSuperview()
        topView.trailingToSuperview()
        topView.height(66)
    }
}
// MARK: - Actions
extension HomeViewController {
    private func setProfilButtonAction() {
        topView.profileButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.profileButtonTapped()
        }
    }
    private func searchAction() {
        topView.searchTextFieldTapped = { [weak self] text in
            guard let self = self else { return }
            
            self.filterContentForSearchText(text)
            self.searchText = text
            self.tableView.reloadData()
        }

    }
    
    @objc
    private func addButtonTapped() {
        viewModel.addNote(titleText: "", descriptionText: Strings.DetailViewController.descriptionTitlePlaceholder, noteId: 0, type: .add)
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
        cell.selectionStyle = .none
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(99)
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
        let deleteAction = UIContextualAction(style: .destructive, title:"") { (_, _, completionHandler) in
            AlertUtility.shared.multiButton(title: Strings.HomeViewController.alertTitle,
                                            message: Strings.HomeViewController.alertSubTitle,
                                            firstButtonTitle: Strings.HomeViewController.alertCancelButtonTitle,
                                            secondButtonTitle1: Strings.HomeViewController.alertDeleteButtonTitle,
                                            firstButtonHandler: { _ in },
                                            secondButtonHandler: { _ in
                self.swipeDeleteAction(indexPath: indexPath)
            }, delegate: self)
            completionHandler(true)
        }
        deleteAction.image = .trashIcon
        deleteAction.backgroundColor = .appRed
        let editAction = UIContextualAction(style: .normal, title:"") { (_, _, completionHandler) in

            self.swipeEditAction(indexPath: indexPath)
            completionHandler(true)
        }
        editAction.backgroundColor = .appYellow
        editAction.image = .editIcon
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
    private func swipeDeleteAction(indexPath: IndexPath) {
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        self.viewModel.deleteNote(noteID: noteID)
        tableView.reloadData()
    }
    private func swipeEditAction(indexPath: IndexPath) {
        let title = self.viewModel.cellItems[indexPath.row].titleText
        let description = self.viewModel.cellItems[indexPath.row].descriptionText
        let noteID = self.viewModel.cellItems[indexPath.row].noteID
        self.viewModel.editRow(titleText: title, descriptionText: description, noteId: noteID, type: .update)
    }
    private func filterContentForSearchText(_ searchText: String ) {
        filteredItems = viewModel.cellItems.filter { (item: HomeCellProtocol) -> Bool in
            return item.titleText.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
}
