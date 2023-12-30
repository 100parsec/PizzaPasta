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
    
    let indexMap: [MenuIconEnum : Int] = [MenuIconEnum.pizza : 0, MenuIconEnum.pasta : 1, MenuIconEnum.salad : 2, MenuIconEnum.bowl : 3, MenuIconEnum.wrap : 4, MenuIconEnum.fingefood : 5]
    
    var body: some View {
      
        HStack(spacing: 0) {
            ScrollView{
                
                ForEach(indexMap.sorted(by: {$0.value < $1.value}), id: \.value){ key, value in
                    
                    CategoryButton(btnColor: $homeviewModel.colorArr[value], selectetCategorie: $homeviewModel.selectedCategorie, category: key.menuIcons, menuIcon: key, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
                        .padding(.top, 20)
                }
                
//                CategoryButton(btnColor: $homeviewModel.btnColorPizza, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.pizza, menuIcon: .pizza, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
//                    .padding(.top, 20)
//                
//                CategoryButton(btnColor: $homeviewModel.btnColorPasta, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.pasta, menuIcon: .pasta, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
//                
//                CategoryButton(btnColor: $homeviewModel.btnColorSalad, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.salad, menuIcon: .salad, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
//                
//                CategoryButton(btnColor: $homeviewModel.btnColorBowl, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.bowls, menuIcon: .bowl, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
//                
//                CategoryButton(btnColor: $homeviewModel.btnColorWraps, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.wraps, menuIcon: .wrap, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
//                
//                CategoryButton(btnColor: $homeviewModel.btnColorFingerfood, selectetCategorie: $homeviewModel.selectedCategorie, category: StringValues.fingerfood, menuIcon: .fingefood, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
                
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
            
            NavigationStack(path: $homeviewModel.path) {
                
                RecipeForCategoryView(path: $homeviewModel.path)
                    .navigationDestination(for: Recipe.self){ recipe in
                        RecipeDetailView(recipe: recipe, path: $homeviewModel.path).navigationBarBackButtonHidden(true)
                    }
                    .environmentObject(recipeViewModel)
            }
            
        }
        .scrollIndicators(.hidden)
    }
    

}

#Preview {
    HomeView()
}
