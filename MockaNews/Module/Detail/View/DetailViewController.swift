//
//  DetailViewController.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

class DetailViewController: UIViewController {

    private var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // Main Stack View
    private var mainScrollStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Siap-siap, BTS dikabarkan akan rilis album BE versi Terbaru"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .justified
        
        return label
    }()
    
    private let contributorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By Videlia"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.systemPink
        
        return label
    }()
    
    private let timePostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rabu, 11 November 2023"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        
        return imageview
    }()
    
    private let newsImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 140, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(NewsImageCollectionViewCell.self, forCellWithReuseIdentifier: NewsImageCollectionViewCell.identifier)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        collectionview.isPagingEnabled = true
        collectionview.showsVerticalScrollIndicator = false
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.alwaysBounceVertical = false
        collectionview.alwaysBounceHorizontal = false
        collectionview.clipsToBounds = true
        collectionview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionview.automaticallyAdjustsScrollIndicatorInsets = false
        collectionview.contentInsetAdjustmentBehavior = .never
        
        return collectionview
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lorem ipsum"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        configureConstraints()
        
        newsImageCollectionView.delegate = self
        newsImageCollectionView.dataSource = self
        
        
        guard let url = URL(string: "https://static.cdntap.com/tap-assets-prod/wp-content/uploads/sites/24/2020/11/pelajaran-berharga-drama-korea-start-up-lead.jpg") else { return }
        newsImageView.sd_setImage(with: url)
    }
    
    private func configureConstraints() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainScrollStackView)
        mainScrollStackView.addArrangedSubview(titleLabel)
        mainScrollStackView.addArrangedSubview(contributorLabel)
        mainScrollStackView.addArrangedSubview(timePostLabel)
        mainScrollStackView.addArrangedSubview(newsImageView)
        mainScrollStackView.addArrangedSubview(newsImageCollectionView)
        mainScrollStackView.addArrangedSubview(descriptionLabel)
        
        let mainScrollViewConstraints = [
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let mainScrollStackViewConstraints = [
            mainScrollStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainScrollStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainScrollStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainScrollStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainScrollStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor)
        ]
        
        let newsImageCollectionViewConstraints = [
            newsImageCollectionView.heightAnchor.constraint(equalToConstant: 80),
            newsImageCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: mainScrollStackView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: mainScrollStackView.trailingAnchor, constant: -8)
        ]
        
        let contributorLabelConstraints = [
            contributorLabel.leadingAnchor.constraint(equalTo: mainScrollStackView.leadingAnchor, constant: 8),
            contributorLabel.trailingAnchor.constraint(equalTo: mainScrollStackView.trailingAnchor, constant: -8),
        ]
        
        let timePostLabelConstraints = [
            timePostLabel.leadingAnchor.constraint(equalTo: mainScrollStackView.leadingAnchor, constant: 8),
            timePostLabel.trailingAnchor.constraint(equalTo: mainScrollStackView.trailingAnchor, constant: -8),
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.leadingAnchor.constraint(equalTo: mainScrollStackView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainScrollStackView.trailingAnchor, constant: -8),
        ]
        
        mainScrollStackView.setCustomSpacing(16, after: titleLabel)
        mainScrollStackView.setCustomSpacing(16, after: timePostLabel)
        mainScrollStackView.setCustomSpacing(16, after: newsImageCollectionView)
        
        NSLayoutConstraint.activate(mainScrollViewConstraints)
        NSLayoutConstraint.activate(mainScrollStackViewConstraints)
        NSLayoutConstraint.activate(newsImageCollectionViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(contributorLabelConstraints)
        NSLayoutConstraint.activate(timePostLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsImageCollectionViewCell.identifier, for: indexPath) as? NewsImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(image: "https://static.cdntap.com/tap-assets-prod/wp-content/uploads/sites/24/2020/11/pelajaran-berharga-drama-korea-start-up-lead.jpg")
        
        return cell
    }
    
    
}
