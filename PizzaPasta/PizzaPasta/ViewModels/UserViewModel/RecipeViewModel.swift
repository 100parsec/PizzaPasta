//
//  AddRecipeSheetViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecipeViewModel: ObservableObject{
    
    let ingredientRepo = IngredientRepository()
    
    
    
    init(){
        fetchRecipes(category: "Pizza")
    }
    
    @Published var recipes = [Recipe]()
    @Published var ingredient = [Ingredient]()
    
    private var listener: ListenerRegistration?
    
    func createRecipe(category: String, title: String, steps: [Step]){
        
        RecipeRepository.createRecipe(category: category, title: title, steps: steps)
        
    }
    
    func deleteRecipe(with id: String){
        
        RecipeRepository.deleteRecipe(with: id)
    }
    
    func fetchRecipes(category: String){
        
        print("kategorie: ", category)
        
        
        self.listener = FirebaseManager.shared.database.collection("recipes").whereField("category", isEqualTo: category)
            .addSnapshotListener{ querySnapshot, error in
                if let error{
                    print("error fetching recipes: ", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("error loading \(category) from database")
                    return
                }
                
                self.recipes = documents.compactMap{ queryDocumentSnapshot -> Recipe? in
                    return try? queryDocumentSnapshot.data(as: Recipe.self)
                }
            }
    }
    
    func createIngredient(category: String, name: String, icon: String){
        IngredientRepository.createIngredient(category: category, name: name, icon: icon)
    }
    
    func fetchIngredient(category: String){
        
        IngredientRepository.fetchIngredient{ ingredient in
            self.ingredient = ingredient
        }

    }
}
