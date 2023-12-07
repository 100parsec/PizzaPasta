//
//  UnitEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 06.12.23.
//

import Foundation

enum UnitEnum: CaseIterable{
    case gramm, piece
    
    var unit: String {
        switch self {
        case .gramm:
            "Gramm"
        case .piece:
            "Stück"
        }
    }
}
