//
//  NewsSlideCollectionViewCell.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

class NewsSlideCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: NewsSlideCollectionViewCell.self)
    
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
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(tagLabel)
        contentView.addSubview(titleLabel)
        
        let thumbnailImageViewConstraints = [
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let tagLabelConstraints = [
            tagLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor),
            tagLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            tagLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 16)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 16),
        ]
        
        NSLayoutConstraint.activate(thumbnailImageViewConstraints)
        NSLayoutConstraint.activate(tagLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    func configureData(news: News) {
        guard let imageUrl = URL(string: news.contentThumbnail) else { return }
        thumbnailImageView.sd_setImage(with: imageUrl)
        
        titleLabel.text = news.title
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
