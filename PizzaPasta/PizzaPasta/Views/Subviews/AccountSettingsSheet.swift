//
//  AccountSettingsSheet.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 13.12.23.
//

import SwiftUI

struct AccountSettingsSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var addressApiVM = AddressCompViewModel()
    @StateObject private var storeVM = StoreViewModel()
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var showStoreDetails = false
    @State private var showAddStore = false
    @State private var storeAddress: ResultModel? = ResultModel()
    @State private var street = "bitte ausfüllen"
    @State private var housenumber = "bitte ausfüllen"
    @State private var postcode = "bitte ausfüllen"
    @State private var city = "bitte ausfüllen"
    @State private var searchText = ""
    @State private var isEditing = false
    @State private var showEditAddress = false
    @State private var adressComplete = false
    @State private var managerEmail = ""
    @State private var managerPass = ""
    @State private var storeEmail = ""
    @State private var storePass = ""
    
    var body: some View {
        VStack{
            HStack{
                
                
                Text("Konto Einstellungen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 50)
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    close()
                }, label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color(red: 0.887, green: -0.142, blue: 0.133))
                })
                .padding(.trailing, 15)
                .padding(.top, 15)
                
            }
            
            HStack{
                
                Form{
                    Section("Stores"){
                        ForEach(storeVM.storeList, id: \.id){ store in
                            HStack {
                                
                                Image(systemName: "building.2")
                                
                                Text(store.street)
                                Text("\(store.housenumber), ")
                                Text(store.postcode)
                                Text(store.city)
                                
                                Spacer()
                                
                                Button(action: {
                                    showStoreDetails.toggle()
                                }, label: {
                                    Image(systemName: "pencil")
                                })
                            }
                        }
                    }
                    
                    HStack{
                        
                        Text("Store hinzufügen")
                        
                        Spacer()
                        
                        if !adressComplete{
                            Button(action: {
                                showAddStore = true
                                showEditAddress = true
                                
                            }, label: {
                                Image(systemName: "plus")
                            })
                        }
                        
                        
                    }
                    .background(.opacity(0.0))
                    
                    
                    // Hinzufügen bereich
                    if showAddStore {
                        
                        if showEditAddress {
                            HStack{
                                
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                
                                TextField("Adresse...", text: $searchText)
                                    .frame(maxWidth: .infinity)
                                    .padding(7)
                                    .padding(.horizontal, 25)
                                    .background(Color(hue: 0.664, saturation: 0.036, brightness: 0.918))
                                    .cornerRadius(8)
                                    .padding(.horizontal, 10)
                                    .onTapGesture {
                                        self.isEditing = true
                                    }
                                    .onChange(of: searchText){
                                        if searchText.count > 2{
                                            addressApiVM.getAdresses(enteredText: searchText)
                                        }
                                    }
                                
                                if isEditing{
                                    Button(action: {
                                        self.searchText = ""
                                        self.isEditing = false
                                    }, label: {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 20)
                                    })
                                }
                            }
                        }
                        
                        if searchText.count > 0{
                            ForEach(addressApiVM.addresses.results, id: \.place_id){ result in
                              
                                HStack {
                                    Text(result.formatted ?? "")
                                        .onTapGesture {
                                            self.searchText = ""
                                        }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "checkmark")
                                        .onTapGesture {
                                            self.street = result.street ?? ""
                                            self.postcode = result.postcode ?? ""
                                            self.city = result.city ?? ""
                                            self.searchText = ""
                                            showEditAddress = false
                                            adressComplete = true
                                        }
                                }
                            }
                        }
                        
                        if adressComplete{
                            HStack{
                                Text("Strasse: ")
                                    .frame(width: 200, alignment: .leading)
                                    .bold()
                                
                                TextField("", text: $street)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .onTapGesture{
                                        self.street = ""
                                    }
                            }
                            
                            HStack{
                                Text("Hausnummer: ")
                                    .frame(width: 200, alignment: .leading)
                                    .bold()
                                    
                                
                                TextField("", text: $housenumber)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .onTapGesture{
                                        self.housenumber = ""
                                    }
                            }
                            
                            HStack{
                                Text("Postleitzahl: ")
                                    .frame(width: 200, alignment: .leading)
                                    .bold()
                                
                                TextField("", text: $postcode)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .onTapGesture{
                                        self.postcode = ""
                                    }
                            }
                            
                            HStack{
                                Text("Stadt: ")
                                    .frame(width: 200, alignment: .leading)
                                    .bold()
                                
                                TextField("", text: $city)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .onTapGesture{
                                        self.city = ""
                                    }
                            }
                            
                            Section("Store Manager"){
                                VStack{
                                    HStack{
                                        Text("eMail:")
                                            .frame(width: 200, alignment: .leading)
                                            .bold()
                                        
                                        TextField("", text: $managerEmail)
                                            .textInputAutocapitalization(.never)
                                    }
                                    
                                    HStack{
                                        Text("Passwort:")
                                            .frame(width: 200, alignment: .leading)
                                            .bold()
                                        
                                        TextField("", text: $managerPass)
                                            .textInputAutocapitalization(.never)
                                    }
                                }
                            }
                            
                            Section("Store Mitarbeiter"){
                                VStack{
                                    HStack{
                                        Text("eMail:")
                                            .frame(width: 200, alignment: .leading)
                                            .bold()
                                        
                                        TextField("", text: $storeEmail)
                                            .textInputAutocapitalization(.never)
                                    }
                                    
                                    HStack{
                                        Text("Passwort:")
                                            .frame(width: 200, alignment: .leading)
                                            .bold()
                                        
                                        TextField("", text: $storePass)
                                            .textInputAutocapitalization(.never)
                                    }
                                }
                            }
                            
                            Section{
                                Button(action: {
                                    saveStore()
                                    showAddStore = false
                                }, label: {
                                    Text("Speichern")
                                })
                            }
                        }
                        
                    }
                }
                .cornerRadius(8)
                .padding(7)
            }
            
            Spacer()
        }
        .background(Color(red: 0.49, green: 0.591, blue: 0.581))
        .interactiveDismissDisabled()
    }
    
    func saveStore(){
        
        
        
        let newStore = StoreModel(id: UUID().uuidString, street: self.street, housenumber: self.housenumber, postcode: self.postcode, city: self.city)
        
        storeVM.saveStore(store: newStore)
        
        authenticationViewModel.register(email: self.storeEmail, password: self.storePass, role: "Filiale")
        
        authenticationViewModel.register(email: self.managerEmail, password: self.managerPass, role: "Manager")
    }
    
    func close() {
        dismiss()
    }
}

#Preview {
    AccountSettingsSheet()
}

