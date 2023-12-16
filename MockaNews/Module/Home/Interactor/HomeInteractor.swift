//
//  HomeInteractor.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    func getNews() -> Observable<[News]>
}

class HomeInteractor: HomeUseCase {
    private let repository: NewsRepositoryProtocol
    
    required init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    
    func getNews() -> Observable<[News]> {
        return repository.getNews()
    }
}
