//
//  CategoryCell.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//
import UIKit
import Kingfisher

final class CategoryCell: UICollectionViewCell{
    static let identifier = "CategoryCell"
    
    //MARK: - UIElement
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.layer.cornerRadius = 16
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    //MARK: - configuration
    func configure(with category: String, isSelected: Bool){
        titleLabel.text = category.capitalized
        
        if isSelected{
            contentView.backgroundColor = .systemBlue
            contentView.layer.borderColor = UIColor.systemBlue.cgColor
            titleLabel.textColor = .white
        }else{
            contentView.backgroundColor = .clear
            contentView.layer.borderColor = UIColor.systemGray4.cgColor
            titleLabel.textColor = .label
        }
    }

    
}
