//
//  HomePresenter.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit
import RxSwift

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeUseCase? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func getNews()
    
    func didSelectNewsItem(news: News)
}

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeUseCase? {
        didSet {
            getNews()
        }
    }
    var router: HomeRouterProtocol?
    
    private let disposeBag = DisposeBag()
    
    func getNews() {
        interactor?.getNews()
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] newsResult in
                self?.view?.updateNewsList(with: newsResult)
            } onError: { error in
                
            } onCompleted: {
                
            }.disposed(by: disposeBag)
    }
    
    func didSelectNewsItem(news: News) {
        router?.navigateToDetail(news: news)
    }
}
