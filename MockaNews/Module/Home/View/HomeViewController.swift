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
        
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
