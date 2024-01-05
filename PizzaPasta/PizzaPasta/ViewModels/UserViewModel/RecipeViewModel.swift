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
    
    init(){
        fetchRecipes(category: "Pizza")
        fetchIngredient()
    }
    
    @Published var recipes = [Recipe]()
    @Published var ingredientArr = [Ingredient]()
    @Published var recipteTitle = ""
    @Published var showAddStep = false
    @Published var ingredient = "Teig"
    @Published var stepText = ""
    @Published var steps = 1
    @Published var value: Double = 1.0
    @Published var unit = "Gramm"
    @Published var stepsList:[Step] = []
    @Published var pizzaSizeIndex = 0
    @Published var selectedCategory = "Pizza"
    
    let pizzaSizes = ["26", "32", "40", "50"]
    
    
    private var listener: ListenerRegistration?
    
    func createRecipe(category: String){
        
        RecipeRepository.createRecipe(category: category, title: self.recipteTitle, steps: self.stepsList)
        
    }
    
    func deleteRecipe(with id: String){
        
        RecipeRepository.deleteRecipe(with: id)
    }
    
    func fetchRecipes(category: String){
        
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
    
    func fetchIngredient(){
        
        IngredientRepository.fetchIngredient{ ingredient in
            self.ingredientArr = ingredient
        }
    }
    
    func resetData(){
        recipteTitle = ""
        showAddStep = false
    }
    
    func getPizzaSize() -> String{
        return pizzaSizes[pizzaSizeIndex]
    }
    
    func getSectionIngredientText() -> String{
        
        if self.selectedCategory == "Pizza"{
            return "Zutaten Einheit für die \(pizzaSizes[pizzaSizeIndex])er"  
        } else{
            return ""
        }
        
    }
}
