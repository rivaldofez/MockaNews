//
//  HomeViewController.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit


protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? { get set }
    func updateNewsList(with news: [News])
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    private var newsTableData: [News] = []
    
    var timer = Timer()
    var counter = 0
    
    
    func updateNewsList(with news: [News]) {
        DispatchQueue.main.async {
            self.newsTableData.removeAll()
            self.newsTableData.append(contentsOf: news)
            self.newsTableView.reloadData()
            self.imageSlidesPageControl.numberOfPages = news.count
            self.imageSlidesCollectionView.reloadData()
        }

    }
    
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
        return stackView
    }()
    
    
    private let latestTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LATEST NEWS"
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var imageSlidesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width, height: 340)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(NewsSlideCollectionViewCell.self, forCellWithReuseIdentifier: NewsSlideCollectionViewCell.identifier)
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
    
    // Image Slide Page Control
    private let imageSlidesPageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        return pageControl
    }()
    
    
    private let newsTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableview.rowHeight = UITableView.automaticDimension
        
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureConstraints()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        imageSlidesCollectionView.delegate = self
        imageSlidesCollectionView.dataSource = self
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    private func configureConstraints() {
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainScrollStackView)
        mainScrollStackView.addArrangedSubview(imageSlidesCollectionView)
        mainScrollStackView.addArrangedSubview(imageSlidesPageControl)
        mainScrollStackView.addArrangedSubview(latestTitleLabel)
        mainScrollStackView.addArrangedSubview(newsTableView)
        
        
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
        
        let imageSlidesCollectionViewConstraints = [
            imageSlidesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageSlidesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageSlidesCollectionView.heightAnchor.constraint(equalToConstant: 340)
        ]
        
        let imageSlidesPageControlConstraints = [
            imageSlidesPageControl.bottomAnchor.constraint(equalTo: imageSlidesCollectionView.bottomAnchor, constant: -40),
            imageSlidesPageControl.centerXAnchor.constraint(equalTo: mainScrollStackView.centerXAnchor)
        ]
        
        mainScrollStackView.setCustomSpacing(32, after: imageSlidesPageControl)
        mainScrollStackView.setCustomSpacing(32, after: latestTitleLabel)
        
        
        let newsTableViewConstraints = [
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.heightAnchor.constraint(equalToConstant: view.frame.size.height)
        ]
        
        NSLayoutConstraint.activate(mainScrollStackViewConstraints)
        NSLayoutConstraint.activate(mainScrollViewConstraints)
        NSLayoutConstraint.activate(newsTableViewConstraints)
        NSLayoutConstraint.activate(imageSlidesCollectionViewConstraints)
    }
    
    @objc private func changeImage() {
        if !newsTableData.isEmpty {
            if counter < newsTableData.count {
                let index = IndexPath(item: counter, section: 0)
                
                self.imageSlidesCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                self.imageSlidesPageControl.currentPage = counter
                counter += 1
            } else {
                counter = 0
                let index = IndexPath(item: counter, section: 0)
                
                self.imageSlidesCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                self.imageSlidesPageControl.currentPage = counter
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        let news = newsTableData[indexPath.row]
        cell.configureData(news: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectNewsItem(news: newsTableData[indexPath.row])
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsTableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsSlideCollectionViewCell.identifier, for: indexPath) as? NewsSlideCollectionViewCell else { return UICollectionViewCell()}
        
        cell.configureData(news: newsTableData[indexPath.item])
        
        return cell
        
    }
}


