//
//  Source.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import Foundation

struct Source: Codable, Sendable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }

    nonisolated init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}
