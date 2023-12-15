//
//  NewsCollectionViewCell.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = String(describing: NewsTableViewCell.self)
    
    private let thumbnailImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        
        return imageview
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Drama"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.systemPink
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private let timePostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4 menit yang lalu"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(tagLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timePostLabel)
        
        let thumbnailImageViewConstraints = [
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let tagLabelConstraints = [
            tagLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor),
            tagLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            tagLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 16),
        ]
        
        let timePostLabelConstraints = [
            timePostLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor),
            timePostLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            timePostLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16)
        ]
        
        NSLayoutConstraint.activate(thumbnailImageViewConstraints)
        NSLayoutConstraint.activate(tagLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(timePostLabelConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
