//
//  Article.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import Foundation

struct Article: Codable, Sendable {
    let title: String
    let description: String?
    let urlToImage: String?
    let url: String
    let publishedAt: String
    let source: Source
    

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case url
        case publishedAt
        case source
    }

    nonisolated init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        url = try container.decode(String.self, forKey: .url)
        publishedAt = try container.decode(String.self, forKey: .publishedAt)
        source = try container.decode(Source.self, forKey: .source)
    }
}
