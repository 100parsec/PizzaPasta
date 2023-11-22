//
//  PizzaSizeEnum.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import Foundation

enum PizzaSizeEnum: CaseIterable{
    case sizeOne, sizeTwo, sizeThree, sizeFour
    
    var sizes: String {
        switch self {
        case .sizeOne:
            "26er"
        case .sizeTwo:
            "32er"
        case .sizeThree:
            "40er"
        case .sizeFour:
            "50er"
        }
    }
}
