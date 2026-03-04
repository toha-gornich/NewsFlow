//
//  Article.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import Foundation

struct Article: Codable, Sendable{
    let title: String
    let description: String?
    let urlToImage: String?
    let url: String
    let publishedAt: String
    let source: Source
    
}
