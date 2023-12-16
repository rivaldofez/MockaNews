//
//  HomeRouter.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

typealias BeginEntry = HomeViewProtocol & UIViewController

protocol HomeRouterProtocol {
    var begin: BeginEntry? { get set }
    
    static func start() -> HomeRouterProtocol
}

class HomeRouter: HomeRouterProtocol {
    var begin: BeginEntry?
    
    static func start() -> HomeRouterProtocol {
        let router = HomeRouter()
        
        var view: HomeViewProtocol = HomeViewController()
        var presenter: HomePresenterProtocol = HomePresenter()
        let interactor: HomeUseCase = Injection().provideHome()
        
        view.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.begin = view as? BeginEntry
        
        return router
        
    }
    
    
}
