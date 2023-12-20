//
//  AddressApi.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 11.12.23.
//

import SwiftUI

struct AddressApi: View {
    
    @StateObject private var addressAPI = AddressCompViewModel()
    @State var searchAddress = ""
    @State var city = "stadt"
    @State var street = "strasse"
    
    var body: some View {
        TextField("Address", text: $searchAddress)
            .onChange(of: searchAddress){
            
            if searchAddress.count > 2 {
                addressAPI.getAdresses(enteredText: searchAddress)
            }
        }
        
        if searchAddress.count > 2{
            ForEach(addressAPI.addresses.results, id: \.place_id){ result in
                
                HStack{
                    Text(result.formatted ?? "")
                        .onTapGesture {
                            self.city = result.city ?? "n/a"
                            self.street = result.street ?? "n/a"
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    AddressApi()
}
