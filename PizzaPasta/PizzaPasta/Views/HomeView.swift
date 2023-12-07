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
    
    let menuIcons = MenuIconEnum.allCases
    
    @State var showSheet = false
    @State var selectetCategorie = "Pizza"
    
    @State var btnColorPizza: Color = .ppYellow
    @State var btnColorPasta: Color = .ppRed
    @State var btnColorSalad: Color = .ppRed
    @State var btnColorBowl: Color = .ppRed
    @State var btnColorWraps: Color = .ppRed
    @State var btnColorFingerfood: Color = .ppRed
    
    var body: some View {
      
        HStack(spacing: 0) {
            ScrollView{
                
                CategoryButton(btnColor: $btnColorPizza, selectetCategorie: $selectetCategorie, category: "Pizza", menuIcon: .pizza, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                    .padding(.top, 20)
                
                CategoryButton(btnColor: $btnColorPasta, selectetCategorie: $selectetCategorie, category: "Pasta", menuIcon: .pasta, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorSalad, selectetCategorie: $selectetCategorie, category: "Salat", menuIcon: .salad, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorBowl, selectetCategorie: $selectetCategorie, category: "Bowl", menuIcon: .bowl, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorWraps, selectetCategorie: $selectetCategorie, category: "Wraps", menuIcon: .wrap, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                CategoryButton(btnColor: $btnColorFingerfood, selectetCategorie: $selectetCategorie, category: "Fingerfood", menuIcon: .fingefood, recipeViewModel: recipeViewModel, resetButtonColor: resetButtonColor, resetPath: resetPath)
                
                if authenicationViewModel.user?.role == "Zentrale"{
                    
                    Button(action: {
                        showSheet = true
                    }, label: {
                        
                        Image("plus")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .background(.ppYellow)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    })
                    .padding(.bottom, 20)
                }
            }
            .frame(width: 200)
            .background(Color(red: 0.49, green: 0.591, blue: 0.581))
//            .sheet(isPresented: $showSheet){
//                AddIngredient()
//            }
            .sheet(isPresented: $showSheet){
                AddRecipeSheet(selectetCategorie: $selectetCategorie)
                    .environmentObject(recipeViewModel)
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

struct MenuTest: Hashable{
    var menuIcon: MenuIconEnum
    var category: String
}
