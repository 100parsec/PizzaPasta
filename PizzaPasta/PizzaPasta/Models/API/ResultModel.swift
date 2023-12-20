//
//  ResultModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 11.12.23.
//

import Foundation

struct ResultModel: Codable{
    
    var country: String?
    var state: String?
    var city: String?
    var postcode: String?
    var postcodes: [String]?
    var street: String?
    var housenumber: String?
    var formatted: String?
    var address_line1: String?
    var address_line2: String?
    var result_type: String?
    var place_id: String?
}
