//
//  ArticleResponse.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import Foundation

struct ArticleResponse: Codable, Sendable {
    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case articles
    }

    nonisolated init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        articles = try container.decode([Article].self, forKey: .articles)
    }
}
