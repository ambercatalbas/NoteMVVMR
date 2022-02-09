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
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.defaultReuseIdentifier)
        return tableView
    }()
    
  let keychain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
      addSubViews()
      configureContents()
      let token = keychain.get(Keychain.token)
//      print("loginden gelen token: \(token)" ?? "olmadı")
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
    }
}
// MARK: - Configure
extension HomeViewController {
  private func configureContents() {
      view.backgroundColor = .white
      tableView.dataSource = self
      tableView.delegate = self
  }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell: HomeCell = tableView.dequeueReusableCell(withIdentifier: HomeCell.defaultReuseIdentifier, for: indexPath) as! HomeCell
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
      print("let cell")
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.didSelectRow(indexPath: indexPath)
  }
}
