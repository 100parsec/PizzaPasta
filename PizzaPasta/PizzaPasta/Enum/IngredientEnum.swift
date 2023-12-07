//
//  IngredientEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 06.12.23.
//

import Foundation

enum IngredientEnum: CaseIterable{
    
    case dough, tomatosauce, cheese, salami
    
    var ingredient: String {
        switch self {
        case .dough:
            "Teig"
        case .tomatosauce:
            "Soße"
        case .cheese:
            "Käse"
        case .salami:
            "Salami"
        }
    }
}
