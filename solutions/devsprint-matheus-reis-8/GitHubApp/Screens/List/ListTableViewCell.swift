//
//  ListTableViewCell.swift
//  GitHubApp
//
//  Created by Lucas Gomes on 29/03/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    private lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.text = "repository-name"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var gitUserName: UILabel = {
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

extension ListTableViewCell {
    func settingCells(_ repository: Repository) {
        self.repositoryName.text = repository.name
        self.gitUserName.text = repository.userName
    }
}

private extension ListTableViewCell {
    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(repositoryName)
        addSubview(gitUserName)
        addSubview(arrowIconImageView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            repositoryName.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            repositoryName.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            gitUserName.topAnchor.constraint(equalTo: repositoryName.bottomAnchor),
            gitUserName.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            arrowIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            arrowIconImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            arrowIconImageView.heightAnchor.constraint(equalToConstant: 16),
            arrowIconImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
}
