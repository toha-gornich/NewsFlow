//
//  APIConfiguration.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//
import Foundation

struct APIConfiguration {
    static let shared = APIConfiguration()
    
    var apiKey: String{
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else{
            fatalError("API key not found in Config.xcconfig")
        }
        return key
    }
    
    let baseURL = "https://newsapi.org/v2"
}
