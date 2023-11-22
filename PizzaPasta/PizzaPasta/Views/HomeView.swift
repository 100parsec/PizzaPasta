//
//  HomeView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authenicationViewModel: AuthenticationViewModel
    @StateObject var homeviewModel = HomeViewModel()
    @StateObject var recipeViewModel = RecipeViewModel()
    
    
    let menuIcons = MenuIconEnum.allCases
    let role = "Zentrale"
    
    @State var showSheet = false
    @State var selectetCategorie = "Pizza"
    
    @State var btnColorPizza: Color = .ppRed
    @State var btnColorPasta: Color = .ppRed
    @State var btnColorSalad: Color = .ppRed
    @State var btnColorBowl: Color = .ppRed
    @State var btnColorWraps: Color = .ppRed
    @State var btnColorFingerfood: Color = .ppRed
    
    
    var body: some View {
        
        HStack(spacing: 0) {
            ScrollView{
                
                CategoryButton(btnColor: $btnColorPizza, category: "Pizza", menuIcon: .pizza, recipeViewModel: recipeViewModel, function: resetButtonColor)
                
                CategoryButton(btnColor: $btnColorPasta, category: "Pasta", menuIcon: .pasta, recipeViewModel: recipeViewModel, function: resetButtonColor)
                
                CategoryButton(btnColor: $btnColorSalad, category: "Salat", menuIcon: .salad, recipeViewModel: recipeViewModel, function: resetButtonColor)
                
                CategoryButton(btnColor: $btnColorBowl, category: "Bowl", menuIcon: .bowl, recipeViewModel: recipeViewModel, function: resetButtonColor)
                
                CategoryButton(btnColor: $btnColorWraps, category: "Wraps", menuIcon: .wrap, recipeViewModel: recipeViewModel, function: resetButtonColor)
                
                CategoryButton(btnColor: $btnColorFingerfood, category: "Fingerfood", menuIcon: .fingefood, recipeViewModel: recipeViewModel, function: resetButtonColor)
                
                
                //nur zum view testen -- auskommentierte funktion nutzen
                //if authenicationViewModel.user?.role == "Zentrale"{
                if role == "Zentrale"{
                    
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Image("plus")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .background(.ppYellow)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })
                    
                    
                }
            }
            .frame(width: 200)
            .background(Color(red: 0.49, green: 0.591, blue: 0.581))
            .sheet(isPresented: $showSheet){
                AddRecipeSheet(selectetCategorie: $selectetCategorie)
                    .environmentObject(recipeViewModel)
            }
            
            RecipeForCategoryView()
                .environmentObject(recipeViewModel)
            
        }
        .scrollIndicators(.hidden)
    }
    
    private func resetButtonColor(){
        btnColorPizza = .ppRed
        btnColorPasta = .ppRed
        btnColorSalad = .ppRed
        btnColorBowl = .ppRed
        btnColorWraps = .ppRed
        btnColorFingerfood = .ppRed
    }
}

#Preview {
    HomeView()
}
