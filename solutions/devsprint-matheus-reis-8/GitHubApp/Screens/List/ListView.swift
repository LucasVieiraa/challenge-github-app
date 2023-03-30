//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

struct ListViewConfiguration {
    let listItems: [String]
}

final class ListView: UIView {
    
    private var listItems: [Repository] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var searchingRepositoriesFeedbackLabel: UILabel = {
        let label = UILabel()
        label.text = "Searching repositories..."
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private lazy var spinnerFeedBack: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.stopAnimating()
        return spinner
    }()
    
    private lazy var noRepositoriesFoundFeedbackTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "No repositories found"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private lazy var noRepositoriesFoundFeedbackSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search for users to see their public repositories here!"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    init() {
        super.init(frame: .zero)
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListView {
    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        self.addSubview(self.tableView)
        self.addSubview(self.searchingRepositoriesFeedbackLabel)
        self.addSubview(self.spinnerFeedBack)
        self.addSubview(self.noRepositoriesFoundFeedbackTitleLabel)
        self.addSubview(self.noRepositoriesFoundFeedbackSubTitleLabel)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.searchingRepositoriesFeedbackLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.searchingRepositoriesFeedbackLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.spinnerFeedBack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spinnerFeedBack.topAnchor.constraint(equalTo: self.searchingRepositoriesFeedbackLabel.bottomAnchor, constant: 14),
            self.noRepositoriesFoundFeedbackTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.noRepositoriesFoundFeedbackTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.noRepositoriesFoundFeedbackSubTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.noRepositoriesFoundFeedbackSubTitleLabel.topAnchor.constraint(equalTo: self.noRepositoriesFoundFeedbackTitleLabel.bottomAnchor, constant: 14),
            self.noRepositoriesFoundFeedbackSubTitleLabel.widthAnchor.constraint(equalToConstant: 283)
        ])
    }
}

extension ListView {
    func updateView(with repositories: [Repository]) {
        tableView.backgroundColor = .white
        self.listItems = repositories
        self.tableView.reloadData()
    }
    
    func showLoadingFeedbackSpinner() {
        spinnerFeedBack.startAnimating()
    }
    
    func hideLoadingFeedbackSpinner() {
        spinnerFeedBack.stopAnimating()
    }
    
    func showSearchingRepositoriesFeedbackLabel() {
        searchingRepositoriesFeedbackLabel.isHidden = false
    }
    
    func hideSearchingRepositoriesFeedbackLabel() {
        searchingRepositoriesFeedbackLabel.isHidden = true
    }
    
    func showNoRepositoriesFoundFeedbackTitleLabel() {
        noRepositoriesFoundFeedbackTitleLabel.isHidden = false
    }
    
    func hideNoRepositoriesFoundFeedbackTitleLabel() {
        noRepositoriesFoundFeedbackTitleLabel.isHidden = true
    }
    
    func showNoRepositoriesFoundFeedbackSubTitleLabel() {
        noRepositoriesFoundFeedbackSubTitleLabel.isHidden = false
    }
    
    func hideNoRepositoriesFoundFeedbackSubTitleLabel() {
        noRepositoriesFoundFeedbackSubTitleLabel.isHidden = true
    }
}

extension ListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell else { fatalError("Generate cell error") }
        cell.settingCells(self.listItems[indexPath.row])
        return cell
    }
}

extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

