//
//  Recipe.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 20.11.23.
//

import Foundation

struct Recipe: Codable {
    
    var id: String
    var category: String
    var title: String
    var steps: [Step]
}

extension Recipe: Hashable, Equatable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id != rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
