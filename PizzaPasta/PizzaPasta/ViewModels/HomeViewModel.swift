//
//  HomeViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import Foundation
//import SwiftUI


class HomeViewModel: ObservableObject{
    
    @Published var selectedCategorie = "Pizza"
    @Published var showAddRecipeSheet = false
    @Published var showAccountSettingsSheet = false
    
//    @Published var btnColorPizza: Color = .ppYellow
//    @Published var btnColorPasta: Color = .ppRed
//    @Published var btnColorSalad: Color = .ppRed
//    @Published var btnColorBowl: Color = .ppRed
//    @Published var btnColorWraps: Color = .ppRed
//    @Published var btnColorFingerfood: Color = .ppRed
    
    
    func showRecipeSheet(){
        self.showAddRecipeSheet = true
    }
    
    func showAccountSheet(){
        self.showAccountSettingsSheet = true
    }
    
}
