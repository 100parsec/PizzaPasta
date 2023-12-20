//
//  AddressCompViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 11.12.23.
//

import Foundation

@MainActor
class AddressCompViewModel: ObservableObject{
    
//    @Published var addresses = AdressesModel(results: [ResultModel(country: "", state: "", city: "", postcodes: [""], street: "", housenumber: "", formatted: "", address_line1: "", address_line2: "")])
    
    @Published var addresses = AdressesModel(results: [ResultModel(country: "")])
    
    func getAdresses(enteredText: String){
        
        Task{
            do{
                self.addresses = try await AddressCompRepo.getAddresses(enteredText: enteredText)
            }catch{
                print("API request failed")
            }
        }
    }
}
