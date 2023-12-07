//
//  UserRoleEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 23.11.23.
//

import Foundation

enum UserRoleEnum: CaseIterable{
    case branch, manager, central
    
    var role: String {
        switch self {
        case .branch:
            "Filiale"
        case .manager:
            "Filialleiter"
        case .central:
            "Zentrale"
        }
    }
}
