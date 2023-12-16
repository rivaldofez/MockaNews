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
}

class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    
    var router: DetailRouterProtocol?
}
