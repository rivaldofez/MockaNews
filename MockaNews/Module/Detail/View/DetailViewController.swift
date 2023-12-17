//
//  DetailViewController.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? { get set }

    func updateNewsData(news: News)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    var presenter: DetailPresenterProtocol?
    var imagesNews: [String] = []
    
    func updateNewsData(news: News) {
        titleLabel.text = news.title.capitalized
        contributorLabel.text = "By \(news.contributorName)"
        timePostLabel.text = NewsMapper.isoTimeToDate(time: news.createdAt)?.formatDatePost()
        descriptionLabel.text = news.content
        setMainImage(image: news.slideshow.first ?? news.contentThumbnail)
        
        if(news.slideshow.count > 0){
            self.newsImageCollectionView.isHidden = false
            DispatchQueue.main.async {
                self.imagesNews.removeAll()
                self.imagesNews.append(contentsOf: news.slideshow)
                self.newsImageCollectionView.reloadData()
            }
        } else {
            self.newsImageCollectionView.isHidden = true
        }
    }
    
    private let headerImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "HeaderImage")
        imageview.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return imageview
    }()

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
        label.textAlignment = .left
        
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
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        configureConstraints()
        
        newsImageCollectionView.delegate = self
        newsImageCollectionView.dataSource = self
    }
    
    private func configureConstraints() {
        self.navigationItem.titleView = headerImageView
        self.navigationItem.titleView = headerImageView
        view.addSubview(headerImageView)
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
        
        let newsImageViewConstraints = [
            newsImageView.heightAnchor.constraint(equalToConstant: 300),
            newsImageView.leadingAnchor.constraint(equalTo: mainScrollStackView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: mainScrollStackView.trailingAnchor)
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
        NSLayoutConstraint.activate(newsImageViewConstraints)
    }
    
    private func setMainImage(image: String){
        guard let url = URL(string: image) else { return }
        newsImageView.sd_setImage(with: url)
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsImageCollectionViewCell.identifier, for: indexPath) as? NewsImageCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(image: imagesNews[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setMainImage(image: imagesNews[indexPath.item])
    }
}
