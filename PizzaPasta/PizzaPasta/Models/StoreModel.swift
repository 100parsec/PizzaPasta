//
//  StoreModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 13.12.23.
//

import Foundation

struct StoreModel: Codable{
    var id: String
    var street: String
    var housenumber: String
    var postcode: String
    var city: String
}
