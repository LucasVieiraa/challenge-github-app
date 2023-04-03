//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    
    private var listItems: [Repository] = []
    let searchController = UISearchController()
    private let service = Service()
    
    private let listView: ListView = {
        let listView = ListView()
        return listView
    }()
    
    private let loadingView: LoadingView = {
        let loadingView = LoadingView()
        return loadingView
    }()
    
    private let emptyView: EmptyView = {
        let emptyView = EmptyView()
        return emptyView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTableView()
    }
    
    override func loadView() {
        self.view = listView
    }
    
    private func searchByGitUserName(_ name: String = "", _ completion: () -> Void ) {
        service.fetchList { [weak self] list in
            self?.listItems = list
            completion()
        }
    }
    
    private func setupTableView() {
        searchByGitUserName {
            listView.tableView.delegate = self
            listView.tableView.dataSource = self
            listView.tableView.reloadData()
        }
    }
}

private extension ListViewController {
    func showLoadingViewFeedback(with configuration: LoadingViewConfiguration? = nil) {
        self.view = loadingView
        loadingView.showLoadingViewTitleLabel()
        loadingView.showLoadingViewSpinnerActivityIndicator()
        
        if let configuration {
            loadingView.updateView(with: configuration)
        }
    }
    
    func showEmptyViewFeedback(with configuration: EmptyViewConfiguration? = nil) {
        self.view = emptyView
        emptyView.showEmptyViewTitleLabel()
        emptyView.showEmptyViewSubtitleLabel()
        
        if let configuration {
            emptyView.updateView(with: configuration)
        }
    }
    
    func hideLoadingViewFeedback() {
        self.view = listView
        loadingView.showLoadingViewTitleLabel()
        loadingView.showLoadingViewSpinnerActivityIndicator()
    }
    
    func hideEmptyViewFeedback() {
        self.view = listView
        emptyView.hideEmptyViewTitleLabel()
        emptyView.hideEmptyViewSubtitleLabel()
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        self.searchController.isActive = false
        searchBar.text = text
//        searchByGitUserName(text ?? "")
        print("search text: \(text)")
    }
    
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(red: 245, green: 245, blue: 245)
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(navigateToSettings))
        self.navigationItem.searchController = searchController

        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
    }
    
    @objc private func navigateToSettings(sender: UIButton) {
        print("navigateToSettings")
    }
}

extension ListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCellView") as? RepositoryCellView else { fatalError("Generate cell error") }
        cell.settingCells(self.listItems[indexPath.row])
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listItems[indexPath.row])
        //navigationController?.pushViewController(DetailViewController(nibName: "DetailViewController", bundle: nil), animated: true)
    }
}
