//
//  CategoryCell.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//

import UIKit
import Kingfisher

final class ArticleCell: UITableViewCell{
    static let identifier = "ArticleCell"
    
    //MARK: - UIElement
    
    private lazy var articleImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        iv.backgroundColor = .systemGray5
        return iv
    }()
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var sourceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var dateLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.backgroundColor = .systemGray
        return label
    }()
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        contentView.addSubview(articleImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(sourceLabel)
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate(
            [articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             articleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             articleImageView.widthAnchor.constraint(equalToConstant: 90),
             articleImageView.heightAnchor.constraint(equalToConstant: 90),
             
             titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
             titleLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
             titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             
             sourceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
             sourceLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
             
             dateLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 4),
             dateLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 12),
             dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)]
        )
    }
    
    //MARK: - configuration
    func configure(with article: Article){
        titleLabel.text = article.title
        sourceLabel.text = article.source.name
        dateLabel.text = article.publishedAt.formatDate()
        
        if let urlString = article.urlToImage, let url = URL(string: urlString){
            articleImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "newspaper"))
        }else{
            articleImageView.image = UIImage(systemName: "newspaper")
        }
    }
    
    
    
}
