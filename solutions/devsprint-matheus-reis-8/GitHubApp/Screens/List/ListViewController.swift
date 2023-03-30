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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(navigateToSettings))
        self.navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchController.searchBar.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        service.fetchList { repositories in
            DispatchQueue.main.async {
                self.listView.updateView(with: repositories)
            }
        }
    }
    
    override func loadView() {
        self.view = listView
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        print("search text: \(text)")
        self.searchController.isActive = false
        searchBar.text = text
    }

    @objc private func navigateToSettings(sender: UIButton) {
        print("navigateToSettings")
    }
}
