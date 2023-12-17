//
//  NewsImageCollectionViewCell.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

class NewsImageCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: NewsImageCollectionViewCell.self)
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        configureConstraints()
    }
    
    private func configureConstraints() {
        contentView.addSubview(newsImageView)
        
        let newsImageViewConstraint = [
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(newsImageViewConstraint)
    }
    
    func configure(image: String) {
        guard let url = URL(string: image) else { return }
        newsImageView.sd_setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
