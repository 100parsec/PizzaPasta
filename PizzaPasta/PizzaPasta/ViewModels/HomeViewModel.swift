//
//  HomeViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import Foundation
import SwiftUI


class HomeViewModel: ObservableObject{
    
    @Published var selectedCategorie = "Pizza"
    @Published var showAddRecipeSheet = false
    @Published var showAccountSettingsSheet = false
    
    @Published var colorArr: [Color] = []
    
    @Published var btnColorPizza: Color = .ppYellow
    @Published var btnColorPasta: Color = .ppRed
    @Published var btnColorSalad: Color = .ppRed
    @Published var btnColorBowl: Color = .ppRed
    @Published var btnColorWraps: Color = .ppRed
    @Published var btnColorFingerfood: Color = .ppRed
    
    @Published var path = NavigationPath()
    
    init(){
        colorArr.append(btnColorPizza)
        colorArr.append(btnColorPasta)
        colorArr.append(btnColorSalad)
        colorArr.append(btnColorBowl)
        colorArr.append(btnColorWraps)
        colorArr.append(btnColorFingerfood)
    }
    
    
    func showRecipeSheet(){
        self.showAddRecipeSheet = true
    }
    
    func showAccountSheet(){
        self.showAccountSettingsSheet = true
    }
    
    func resetButtonColor(){
        colorArr[0] = .ppRed
        colorArr[1] = .ppRed
        colorArr[2] = .ppRed
        colorArr[3] = .ppRed
        colorArr[4] = .ppRed
        colorArr[5] = .ppRed
//        self.btnColorPizza = .ppRed
//        self.btnColorPasta = .ppRed
//        self.btnColorSalad = .ppRed
//        self.btnColorBowl = .ppRed
//        self.btnColorWraps = .ppRed
//        self.btnColorFingerfood = .ppRed
    }
    
    func resetPath(){
        path = .init()
    }
    
}
