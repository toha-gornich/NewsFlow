//
//  Extensions+String.swift
//  NewsFlow
//
//  Created by Горніч Антон on 06.03.2026.
//

import Foundation


extension String{
    func formatDate() -> String{
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: self) else {return self}
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        return displayFormatter.string(from: date)
    }
}
