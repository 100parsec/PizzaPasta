//
//  Step.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 20.11.23.
//

import Foundation

struct Step: Codable, Identifiable{
    
    var id: String
    var step: Int
    var ingredient: Ingredient
    var unit: String
    var value: Double
    var size: String?
}
