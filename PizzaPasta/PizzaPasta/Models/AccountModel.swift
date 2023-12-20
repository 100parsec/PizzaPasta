//
//  AccountModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 13.12.23.
//

import Foundation

struct AccountModel: Codable{
    var id: String
    var role: String
    var userName: String
    var password: String
}
