//
//  News.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation

struct News: Identifiable {
    let id: String
    let createdAt: String
    let contributorName: String
    let contributorAvatar: String
    let title, content: String
    let contentThumbnail: String
    let slideshow: [String]
}
