//
//  Recipe.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 20.11.23.
//

import Foundation

struct Recipe: Codable{
    var id: String
    var category: String
    var title: String
    var steps: [Step]
}
