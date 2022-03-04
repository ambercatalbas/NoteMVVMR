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
    
    private let tableView = UITableViewBuilder()
        .build()
    private let topView = HomeScreenTopView()
    private let addButton = UIButtonBuilder()
        .title(Strings.General.addNote)
        .tintColor(.white)
        .image(.addIcon)
        .cornerRadius(4)
        .build()
    let keychain = KeychainSwift()
    private let refreshControl = UIRefreshControl()
    var filteredItems: [HomeCellProtocol] = []
    var searchText: String = ""
    private var note: Note = Note(title: "", description: "", noteID: 0)
    var isSearchTextEmpty: Bool {
        return searchText.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return !isSearchTextEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.fetchNotesListing()
        subscribeViewModelEvents()
        setProfilButtonAction()
        searchAction()
        addObserver()
        tableView.keyboardDismissMode = .onDrag
    }
    
    private func addObserver() {
        let notificationCenter: NotificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(reloadData), name: .reloadDataNotification, object: nil)
    }
    
    @objc
    private func reloadData() {
        viewModel.fetchNotesListing()
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchRecipes = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.tableFooterView = nil
            }
            self.tableView.reloadData()
        }
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        makeTableView()
        makeAddNoteButton()
        makeTopView()
    }
    
    private func makeTopView() {
        topView.width(UIScreen.main.bounds.width-20)
    }
    
    private func makeTableView() {
        view.addSubview(tableView)
        tableView.topToSuperview()
        tableView.leadingToSuperview()
        tableView.trailingToSuperview()
        tableView.bottomToSuperview()
    }
    
    private func makeAddNoteButton() {
        view.addSubview(addButton)
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
        topView.searchTextField.delegate = self
        topView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.defaultReuseIdentifier)
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefreshValueChanged), for: .valueChanged)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        self.navigationController?.navigationBar.topItem?.titleView = topView
    }
    
}

// MARK: - Actions
extension HomeViewController {
    
    private func setCancelButtonAction() {
        topView.cancelButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.filterContentForSearchText("")
            self.searchText = ""
            self.tableView.reloadData()
        }
    }
    
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
        viewModel.addNote(note: Note(title: "", description: "", noteID: 0), type: .add)
    }
    
    @objc
    private func profileButtonTapped() {
        viewModel.showProfileScreen()
    }
    
    @objc
    private func pullToRefreshValueChanged() {
        viewModel.cellItems.isEmpty ? viewModel.fetchMoreNotesListing() : tableView.reloadData()
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

// MARK: - UITableViewDelegate
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
            viewModel.didSelectRow(note: Note(title: title, description: description, noteID: noteID), type: .showNote)
        } else {
            cellItem = viewModel.cellItemAt(indexPath: indexPath)
            let title = self.viewModel.cellItems[indexPath.row].titleText
            let description = self.viewModel.cellItems[indexPath.row].descriptionText
            let noteID = self.viewModel.cellItems[indexPath.row].noteID
            viewModel.didSelectRow(note: Note(title: title, description: description, noteID: noteID), type: .showNote)
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
        self.viewModel.editRow(note: Note(title: title, description: description, noteID: noteID), type: .update)
    }
    
    private func filterContentForSearchText(_ searchText: String ) {
        filteredItems = viewModel.cellItems.filter { (item: HomeCellProtocol) -> Bool in
            return item.titleText.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height-100-scrollView.frame.size.height && viewModel.isPagingEnabled && viewModel.isRequestEnabled {
            self.tableView.tableFooterView = createSpinnerFooter()
            viewModel.fetchMoreNotesListing()
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("ghjkt")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
