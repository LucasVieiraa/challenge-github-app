//
//  ListTableViewCell.swift
//  GitHubApp
//
//  Created by Lucas Gomes on 29/03/23.
//

import UIKit

class RepositoryCellView: UITableViewCell {
    
    private lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.text = "repository-name"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var repositoryOwner: UILabel = {
        let label = UILabel()
        label.text = "git-user-name"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowIconImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow-right-icon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepositoryCellView {
    func settingCells(_ repository: Repository) {
        self.repositoryName.text = repository.name
        self.repositoryOwner.text = repository.owner
    }
}

private extension RepositoryCellView {
    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(repositoryName)
        addSubview(repositoryOwner)
        addSubview(arrowIconImageView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            repositoryName.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            repositoryName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            repositoryOwner.topAnchor.constraint(equalTo: repositoryName.bottomAnchor),
            repositoryOwner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            arrowIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            arrowIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            arrowIconImageView.heightAnchor.constraint(equalToConstant: 16),
            arrowIconImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
}
