//
//  DetailPresenter.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import Foundation

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    func setNewsData(news: News)
}

class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    
    var router: DetailRouterProtocol?
    
    func setNewsData(news: News) {
        view?.updateNewsData(news: news)
    }
}
