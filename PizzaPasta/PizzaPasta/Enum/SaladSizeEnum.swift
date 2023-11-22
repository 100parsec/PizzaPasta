//
//  SaladSizeEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import Foundation

enum SaladSizeEnum: CaseIterable{
    case sizeOne, sizeTwo
    
    var sizes: String {
        switch self {
        case .sizeOne:
            "klein"
        case .sizeTwo:
            "groß"
        }
    }
}
