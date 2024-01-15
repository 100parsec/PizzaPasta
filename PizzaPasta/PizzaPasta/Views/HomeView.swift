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
    
    var body: some View {
      
        HStack(spacing: 0) {
            ScrollView{
                
                ForEach(homeviewModel.indexMap.sorted(by: {$0.value < $1.value}), id: \.value){ key, value in
                    
                    CategoryButton(btnColor: $homeviewModel.colorArr[value], selectetCategorie: $recipeViewModel.selectedCategory, category: key.menuIcons, menuIcon: key, recipeViewModel: recipeViewModel, resetButtonColor: homeviewModel.resetButtonColor, resetPath: homeviewModel.resetPath)
                        .padding(.top, 20)
                }
                
                SettingsContextMenuComp(role: authenicationViewModel.user?.role ?? "")
                    .environmentObject(homeviewModel)
                    .environmentObject(authenicationViewModel)
                
//                if authenicationViewModel.user?.role == StringValues.roleCentral{
//                    
//                    SettingsContextMenuComp()
//                        .environmentObject(homeviewModel)
//                    
//                }
            }
            .frame(width: 200)
            .background(Color(red: 0.49, green: 0.591, blue: 0.581))
//            .sheet(isPresented: $showSheet){
//                AddIngredient()
//            }
            .sheet(isPresented: $homeviewModel.showAddRecipeSheet){
                AddRecipeSheet()
                    .environmentObject(recipeViewModel)
            }
            .sheet(isPresented: $homeviewModel.showAccountSettingsSheet){
                AccountSettingsSheet()
                    .environmentObject(authenicationViewModel)
            }
            
            NavigationStack(path: $homeviewModel.path) {
                
                RecipeForCategoryView(path: $homeviewModel.path, role: authenicationViewModel.user?.role ?? "")
                    .navigationDestination(for: Recipe.self){ recipe in
                        RecipeDetailView(recipe: recipe, path: $homeviewModel.path)
                            .environmentObject(recipeViewModel)
                            .navigationBarBackButtonHidden(true)
                    }
                    .environmentObject(recipeViewModel)
            }
            
        }
        .scrollIndicators(.hidden)
        .onDisappear{
            recipeViewModel.removeListener()
        }
    }
    

}

#Preview {
    HomeView()
}
