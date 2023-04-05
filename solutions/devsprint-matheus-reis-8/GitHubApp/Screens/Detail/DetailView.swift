//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

class DetailView: UIView {
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailView {
    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() { }
    
    func configureSubviewsConstraints() { }
}
