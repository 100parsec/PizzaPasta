//
//  SauceEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 06.12.23.
//

import Foundation

enum SauceEnum: CaseIterable{
    case tomato, bbq, cream
    
    var sauce: String{
        switch self {
        case .tomato:
            "Tomatensoße"
        case .bbq:
            "BBQ Soße"
        case .cream:
            "Sahnesoße"
        }
    }
}
