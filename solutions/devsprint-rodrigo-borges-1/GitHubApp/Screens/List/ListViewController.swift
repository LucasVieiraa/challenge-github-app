//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    
    private lazy var listView: ListView = {
        let listView = ListView()
        listView.delegate = self
        return listView
    }()
    
    private let service = Service()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.listView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchRepos()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(onNavigateToSettings))
    }
    
    private func fetchRepos(){
        self.service.fetchRepositories("devpass-tech"){ repositories in
            guard let repositories = repositories else {
                return
            }
            
            let configuration = ListViewConfiguration(listRepositories: repositories)
            
            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
            
        }
    }
    

    @objc func onNavigateToSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle = .formSheet
        let navVC = UINavigationController(rootViewController: settingsVC)
        self.present(navVC, animated: true, completion: nil)
    }
  
    func navigateToDetails() {
        
        let viewController = DetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListViewController: ListViewDelegate {
    
    func didSelectRepository(_ repository: Repository) {
        self.navigateToDetails()
    }
}
