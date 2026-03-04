//
//  NetworkManagerProtocol.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchTopHeadlines(category: String) async throws -> [Article]
    func searchArticles(query: String) async throws -> [Article]
}
