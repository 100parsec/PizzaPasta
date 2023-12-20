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
    
    
    @State private var path = NavigationPath()
    
    @State var btnColorPizza: Color = .ppYellow
    @State var btnColorPasta: Color = .ppRed
    @State var btnColorSalad: Color = .ppRed
    @State var btnColorBowl: Color = .ppRed
    @State var btnColorWraps: Color = .ppRed
    @State var btnColorFingerfood: Color = .ppRed
    
    var body: some View {
      
        HStack(spacing: 0) {
            ScrollView{
                
                CategoryButton(btnColor: $btnColorPizza, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.pizza, menuIcon: .pizza, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                    .padding(.top, 20)
                
                CategoryButton(btnColor: $btnColorPasta, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.pasta, menuIcon: .pasta, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorSalad, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.salad, menuIcon: .salad, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorBowl, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.bowls, menuIcon: .bowl, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorWraps, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.wraps, menuIcon: .wrap, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorFingerfood, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.fingerfood, menuIcon: .fingefood, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                if authenicationViewModel.user?.role == StringValues.roleCentral{
                    
                    SettingsContextMenuComp()
                        .environmentObject(homeviewModel)
                    
                }
            }
            .frame(width: 200)
            .background(Color(red: 0.49, green: 0.591, blue: 0.581))
//            .sheet(isPresented: $showSheet){
//                AddIngredient()
//            }
            .sheet(isPresented: $homeviewModel.showAddRecipeSheet){
                AddRecipeSheet(selectetCategorie: $homeviewModel.selectedCategorie)
                    .environmentObject(recipeViewModel)
            }
            .sheet(isPresented: $homeviewModel.showAccountSettingsSheet){
                AccountSettingsSheet()
                    .environmentObject(authenicationViewModel)
            }
            
            NavigationStack(path: $path) {
                
                RecipeForCategoryView(path: $path)
                    .navigationDestination(for: Recipe.self){ recipe in
                        RecipeDetailView(recipe: recipe, path: $path).navigationBarBackButtonHidden(true)
                    }
                    .environmentObject(recipeViewModel)
            }
            
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
    
    private func resetPath(){
        path = .init()
    }
}

#Preview {
    HomeView()
}
