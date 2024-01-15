//
//  RecipeForCategoryView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct RecipeForCategoryView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @Binding var path: NavigationPath
    
    var role: String
    
    var body: some View {
            Form{
                ForEach(recipeViewModel.recipes, id: \.id){ recipe in
                    Section{
                        NavigationLink(value: recipe){
                            Text(recipe.title)
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 35))
                        }
                        .listRowBackground(Color.ppRed)
                        .padding(30)
                    }
                    .swipeActions{
                        if role == StringValues.roleCentral{
                            Button(role: .destructive){
                                recipeViewModel.deleteRecipe(with: recipe.d_id ?? "")
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                            .background(Color.white)
                        }
                    }
                }
            }
    }
}

//#Preview {
//    RecipeForCategoryView()
//}
