//
//  NewsRepository.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation
import RxSwift

protocol NewsRepository {
    func getNews() -> Observable<[News]
}


