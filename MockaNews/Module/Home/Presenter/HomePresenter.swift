//
//  HomePresenter.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit
import RxSwift

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeUseCase? { get set }
    var view: HomeViewProtocol? { get set }
    
    func getNews()
}

class HomePresenter: HomePresenterProtocol {
    var router: HomeRouterProtocol?
    
    var interactor: HomeUseCase?
    
    var view: HomeViewProtocol?
    
    func getNews() {
        
    }
}
