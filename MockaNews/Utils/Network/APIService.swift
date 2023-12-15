//
//  APIService.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation

struct API {
    static let baseURL = "https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/newsapp/"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum gets: Endpoint {
        case newsArticles
        
        var url: String {
            switch self {
            case .newsArticles:
                return "\(API.baseURL)articles"
            }
        }
    }
}
