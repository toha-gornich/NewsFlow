//
//  MockNetworkManager.swift
//  NewsFlow
//
//  Created by Горніч Антон on 07.03.2026.
//

import Testing
@testable import NewsFlow
import Foundation

final class MockNetworkManager: NetworkManagerProtocol {
    var mockArticles: [Article] = [
        Article(
            title: "Test Article",
            description: "Test Description",
            urlToImage: nil,
            url: "https://test.com",
            publishedAt: "2024-01-01",
            source: Source(name: "Test Source")
        )
    ]
    
    var shouldFail = false
    
    func fetchTopHeadlines(category: String) async throws -> [Article] {
        if shouldFail { throw NSError(domain: "MockError", code: -1) }
        return mockArticles
    }
    
    func searchArticles(query: String) async throws -> [Article] {
        if shouldFail { throw NSError(domain: "MockError", code: -1) }
        return mockArticles
    }
}
