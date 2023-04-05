//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {

    var repository: Repository?
    
    private let detailView: DetailView = {
        let detailView = DetailView()
        return detailView
    }()
    
    override func viewDidLoad() {
        setupNavigationBar()
    }
    
    override func loadView() {
        self.view = detailView
        print(repository)
    }
    
    class func instance(_ repository: Repository) -> DetailViewController {
        let detailViewController: DetailViewController = DetailViewController(nibName: String(describing: self), bundle: nil)
        detailViewController.repository = repository
        return detailViewController
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.title = repository?.name ?? "-"
    }
}
