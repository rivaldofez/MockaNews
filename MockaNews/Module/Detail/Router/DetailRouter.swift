//
//  DetailRouter.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import Foundation

protocol DetailRouterProtocol {
    var entry: DetailViewController? { get }
    
    static func createDetail(with news: News) -> DetailRouterProtocol
}


class DetailRouter: DetailRouterProtocol {
    var entry: DetailViewController?
    
    static func createDetail(with news: News) -> DetailRouterProtocol {
        let router = DetailRouter()
        
        var view: DetailViewProtocol = DetailViewController()
        var presenter: DetailPresenterProtocol = DetailPresenter()
        
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.setNewsData(news: news)
        
        router.entry = view as? DetailViewController
        return router
    }
    
    
}
