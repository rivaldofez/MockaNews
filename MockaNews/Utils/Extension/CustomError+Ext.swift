//
//  CustomError+Ext.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidResponse
    case invalidURL
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "The server responded with garbage."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
        case .invalidURL: return "URL is invalid and cannot be parse."
        }
    }
}
