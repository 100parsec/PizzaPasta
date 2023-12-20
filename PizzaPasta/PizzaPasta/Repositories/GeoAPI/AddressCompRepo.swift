//
//  AddressCompRepo.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 11.12.23.
//

import Foundation

// URL https://api.geoapify.com/v1/geocode/autocomplete?text=Friedrichskoog&lang=de&format=json&apiKey=ca7f33cd0da44c3e895543af35f4e297


class AddressCompRepo{
    
    static func getAddresses(enteredText: String) async throws -> AdressesModel{
        
        var baseURL = "https://api.geoapify.com/v1/geocode/autocomplete?text="
        let endURL = "&lang=de&limit=3&format=json&apiKey=ca7f33cd0da44c3e895543af35f4e297"
        
        baseURL.append(enteredText)
        baseURL.append(endURL)
        
        guard let baseURL = URL(string: baseURL) else {
//            return AdressesModel(results: [ResultModel(country: "", state: "", city: "", postcodes: [""], street: "", housenumber: "", formatted: "", address_line1: "", address_line2: "")])
            
            return AdressesModel(results: [ResultModel(country: "")])
        }
        
        let (data, _) = try await URLSession.shared.data(from: baseURL)
        
        return try JSONDecoder().decode(AdressesModel.self, from: data)
    }
    
}
