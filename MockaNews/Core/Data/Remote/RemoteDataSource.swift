//
//  RemoteDataSource.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation
import RxSwift
import Alamofire

protocol RemoteDataSourceProtocol: AnyObject {
    func getNews() -> Observable<[NewsResponse]>
}


final class RemoteDataSource: NSObject {
    static let shared: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getNews() -> RxSwift.Observable<[NewsResponse]> {
        return Observable<[NewsResponse]>.create { observer in
            if let url = URL(string: Endpoints.gets.newsArticles.url) {
                AF.request(url)
                    .responseDecodable(of: [NewsResponse].self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(NetworkError.invalidResponse)
                        }
                    }
            } else {
                observer.onError(NetworkError.invalidURL)
            }
            
            return Disposables.create()
        }
    }
}
