//
//  NewsTableViewCell.swift
//  AccessibleNews
//
//  Created by Macbook Air 13 on 28.12.23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        return stackView
    }()
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 20.0)
        
        return label
    }()
    
    private let newsSummaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16.0)
        
        return label
    }()
    
    private let newsPublishDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12.0)
        label.textColor = .systemGray
        
        return label
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupTableViewConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        newsTitleLabel.text = ""
        newsSummaryLabel.text = ""
        newsPublishDateLabel.text = ""
    }
    
    
    // MARK: - Configure
    func configure(with model: News) {
        newsTitleLabel.text = model.title
        newsSummaryLabel.text = model.summary
        newsPublishDateLabel.text = model.publishedAt
    }
    
    
    // MARK: - Private Methods
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(newsTitleLabel)
        mainStackView.addArrangedSubview(newsSummaryLabel)
        mainStackView.addArrangedSubview(newsPublishDateLabel)
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
