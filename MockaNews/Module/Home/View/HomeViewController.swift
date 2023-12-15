//
//  HomeViewController.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let latestTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "LATEST NEWS"
        label.textColor = .label
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        
        return label
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

        configureConstraints()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    private func configureConstraints() {
        view.addSubview(latestTitleLabel)
        view.addSubview(newsTableView)
        
        
        let latestTitleLabelConstraints = [
            latestTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            latestTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            latestTitleLabel.topAnchor.constraint(equalTo: view.topAnchor)
        ]
        
        let newsTableViewConstraints = [
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.topAnchor.constraint(equalTo: latestTitleLabel.bottomAnchor, constant: 16),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(latestTitleLabelConstraints)
        NSLayoutConstraint.activate(newsTableViewConstraints)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
