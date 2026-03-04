//
//  NetworkManager.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//
import Alamofire

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    private let config = APIConfiguration.shared
    
    init() {}
    
    func fetchTopHeadlines(category: String) async throws -> [Article] {
        var parameters = Endpoint.topHeadlines(category: category).parameters
        parameters["apiKey"] = config.apiKey
        
        let url = config.baseURL + Endpoint.topHeadlines(category: category).path
        
        return try await AF.request(url, parameters: parameters)
            .validate()
            .serializingDecodable(ArticleResponse.self, decoder: JSONDecoder())
            .value
            .articles
    }
    
    func searchArticles(query: String) async throws -> [Article] {
        var parameters = Endpoint.search(query: query).parameters
        parameters["apiKey"] = config.apiKey
        
        let url = config.baseURL + Endpoint.search(query: query).path
        
        return try await AF.request(url, parameters: parameters)
            .validate()
            .serializingDecodable(ArticleResponse.self, decoder: JSONDecoder())
            .value
            .articles
    }
}
