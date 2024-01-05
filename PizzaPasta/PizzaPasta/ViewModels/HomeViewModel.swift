//
//  HomeViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import Foundation
import SwiftUI


class HomeViewModel: ObservableObject{
    
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
    
    let indexMap: [MenuIconEnum : Int] = [MenuIconEnum.pizza : 0, MenuIconEnum.pasta : 1, MenuIconEnum.salad : 2, MenuIconEnum.bowl : 3, MenuIconEnum.wrap : 4, MenuIconEnum.fingefood : 5]
    
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
        
        for i in 0...5{
            colorArr[i] = .ppRed
        }
    }
    
    func resetPath(){
        path = .init()
    }
    
}
