//
//  APIConfiguration.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//
import Foundation

enum Endpoint {
    case topHeadlines(category:String)
    case search(query: String)
    
    var path: String{
        switch self{
        case .topHeadlines(category: let category):
            return "/top-headlines"
        case .search(query: let query):
            return "/everything"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .topHeadlines(let category):
            return ["category": category, "country": "us"]
        case .search(let query):
            return ["q": query, "sortBy": "publishedAt"]
        }
    }
}
