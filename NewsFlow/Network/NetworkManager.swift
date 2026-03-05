//
//  NetworkManager.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//
import Foundation

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    private let config = APIConfiguration.shared
    
    init() {}
    
    func fetchTopHeadlines(category: String) async throws -> [Article] {
        var parameters = Endpoint.topHeadlines(category: category).parameters
        parameters["apiKey"] = config.apiKey
        
        let url = config.baseURL + Endpoint.topHeadlines(category: category).path
        
        return try await request(url: url, parameters: parameters)
    }
    
    func searchArticles(query: String) async throws -> [Article] {
        var parameters = Endpoint.search(query: query).parameters
        parameters["apiKey"] = config.apiKey
        
        let url = config.baseURL + Endpoint.search(query: query).path
        
        return try await request(url: url, parameters: parameters)
    }
    
    private func request(url: String, parameters: [String: String]) async throws -> [Article] {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let response = try JSONDecoder().decode(ArticleResponse.self, from: data)
        return response.articles
    }
}
