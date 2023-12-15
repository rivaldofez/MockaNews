//
//  Injection.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation

final class Injection: NSObject {
    private func provideRepository() -> NewsRepositoryProtocol {
        let remote = RemoteDataSource.shared
        
        return NewsRepository.sharedInstance(remote)
    }
    
    private func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
}
