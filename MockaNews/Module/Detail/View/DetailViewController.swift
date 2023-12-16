//
//  DetailViewController.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

class DetailViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Siap-siap, BTS dikabarkan akan rilis album BE versi Terbaru"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .justified
        
        
        return label
    }()
    
    private let contributorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "By Videlia"
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
        layout.itemSize = CGSize(width: 100, height: 50)
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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
