//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Lucas Gomes on 03/04/23.
//

import UIKit

final class EmptyView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "No repositories found"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
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

extension EmptyView {
    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 14),
            self.subtitleLabel.widthAnchor.constraint(equalToConstant: 283)
        ])
    }
}

extension EmptyView {
    func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.title
        subtitleLabel.text = configuration.subtitle
    }
    
    func showEmptyViewTitleLabel() {
        titleLabel.isHidden = false
    }
    
    func hideEmptyViewTitleLabel() {
        titleLabel.isHidden = true
    }
    
    func showEmptyViewSubtitleLabel() {
        subtitleLabel.isHidden = false
    }
    
    func hideEmptyViewSubtitleLabel() {
        subtitleLabel.isHidden = true
    }
}
