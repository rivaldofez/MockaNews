//
//  NewsRepository.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation
import RxSwift

protocol NewsRepositoryProtocol {
    func getNews() -> Observable<[News]>
}

final class NewsRepository: NSObject {
    typealias NewsInstance = (RemoteDataSource) -> NewsRepository
    
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: NewsInstance = { remoteDataSource in
        return NewsRepository(remote: remoteDataSource)
    }
}

extension NewsRepository: NewsRepositoryProtocol {
    func getNews() -> RxSwift.Observable<[News]> {
        return self.remote.getNews()
            .map { NewsMapper.mapNewsResponsesToDomain(responses: $0) }
    }
    
}


