//
//  Recipe.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 20.11.23.
//

import Foundation
import FirebaseFirestore

struct Recipe: Codable {
    
    @DocumentID var d_id: String?
    
    var id: String
    var category: String
    var title: String
    var steps: [Step]
    var size: String?
}

extension Recipe: Hashable, Equatable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id != rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
