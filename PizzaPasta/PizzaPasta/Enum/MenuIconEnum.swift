//
//  MenuIconEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import Foundation

enum MenuIconEnum: CaseIterable{
    case pizza, pasta, salad, bowl, wrap, fingefood
    
    var menuIcons: String{
        switch self {
        case .pizza:
            "pizza"
        case .pasta:
            "pasta"
        case .salad:
            "salat"
        case .bowl:
            "bowl"
        case .wrap:
            "wrap"
        case .fingefood:
            "fingerfood"
        }
    }
}
