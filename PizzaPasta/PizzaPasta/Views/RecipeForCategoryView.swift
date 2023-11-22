//
//  RecipeForCategoryView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct RecipeForCategoryView: View {
    
    //später löschen - nur zum test
    let recipes: [Recipe] = [Recipe(id: "1", category: "pizza", title: "Salami", steps: [Step(id: "1.1", step: 1, stepTitle: "", description: "")]),
                             Recipe(id: "2", category: "pizza", title: "Salami", steps: [Step(id: "2.1", step: 1, stepTitle: "", description: "")]),
                             Recipe(id: "3", category: "pizza", title: "Salami", steps: [Step(id: "3.1", step: 1, stepTitle: "", description: "")]),
                             Recipe(id: "4", category: "pizza", title: "Salami", steps: [Step(id: "4.1", step: 1, stepTitle: "", description: "")])]
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        NavigationStack{
            Form{
                
                //ForEach(recipes, id: \.id){ recipe in
                ForEach(recipeViewModel.recipes, id: \.id){ recipe in
                    Section{
                        NavigationLink(destination: RecipeDetailView(recipe: recipe).navigationBarBackButtonHidden(true)){
                            Text(recipe.title)
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 35))
                        }
                        .listRowBackground(Color.ppRed)
                        .padding(30)
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    RecipeForCategoryView()
}
