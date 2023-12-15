//
//  NewsMapper.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 15/12/23.
//

import Foundation

final class NewsMapper {
    static func mapNewsResponsesToDomain(responses: [NewsResponse]) -> [News] {
        return responses.map { mapNewsResponseToDomain(response: $0) }
    }
    
    static func mapNewsResponseToDomain(response: NewsResponse) -> News {
        return News(
            id: response.id,
            createdAt: response.createdAt,
            contributorName: response.contributorName,
            contributorAvatar: response.contributorAvatar,
            title: response.title,
            content: response.content,
            contentThumbnail: response.contentThumbnail,
            slideshow: response.slideshow)
    }
    
    static func isoTimeToDate(time: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter.date(from: time)
    }
}
