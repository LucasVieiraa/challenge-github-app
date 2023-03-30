//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController, UISearchBarDelegate {
    
    let searchController = UISearchController()
    
    private let listView: ListView = {
        let listView = ListView()
        return listView
    }()
    
    private let service = Service()
    
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
        searchByGitUserName("")
    }
    
    override func loadView() {
        self.view = listView
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        self.searchController.isActive = false
        searchBar.text = text
        searchByGitUserName(text ?? "")
        //TODO: Activate loading spinner
    }
    
    @objc private func navigateToSettings(sender: UIButton) {
        print("navigateToSettings")
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(navigateToSettings))
        self.navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
    }
    
    //TODO: Integration
    private func searchByGitUserName(_ name: String) {
        service.fetchList { [weak self] list in
            self?.listView.updateView(with: list)
        }
    }
}

private extension ListViewController {
    func showSearchingFeedback() {
        listView.showLoadingFeedbackSpinner()
        listView.showSearchingRepositoriesFeedbackLabel()
    }
    
    func hideSearchingFeedback() {
        listView.hideLoadingFeedbackSpinner()
        listView.hideSearchingRepositoriesFeedbackLabel()
    }
    
    func showNoRepositoriesFoundFeedback() {
        listView.showNoRepositoriesFoundFeedbackTitleLabel()
        listView.showNoRepositoriesFoundFeedbackSubTitleLabel()
    }
    
    func hideNoRepositoriesFoundFeedback() {
        listView.hideNoRepositoriesFoundFeedbackTitleLabel()
        listView.hideNoRepositoriesFoundFeedbackSubTitleLabel()
    }
}
