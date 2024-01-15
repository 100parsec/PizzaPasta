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
        //fetchRecipes()
        fetchPizza(size: "26")
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
    @Published var stepsList26:[Step] = []
    @Published var stepsList32:[Step] = []
    @Published var stepsList40:[Step] = []
    @Published var stepsList50:[Step] = []
    
    
    @Published var pizzaSizeIndex = 0
    @Published var selectedCategory = "Pizza"
    @Published var showAddPizzaSizeSheet = false
    
    @Published var value26: Double = 0.0
    @Published var value32: Double = 0.0
    @Published var value40: Double = 0.0
    @Published var value50: Double = 0.0
    
    let pizzaSizes = ["26", "32", "40", "50"]
    
    @Published var actuallySize = "26"
    private var listener: ListenerRegistration?
    
    func createRecipe(category: String){
        
        
        
        if selectedCategory == "Pizza"{
            RecipeRepository.createRecipe(category: category, title: self.recipteTitle, steps: self.stepsList26, size: "26")
            RecipeRepository.createRecipe(category: category, title: self.recipteTitle, steps: self.stepsList32, size: "32")
            RecipeRepository.createRecipe(category: category, title: self.recipteTitle, steps: self.stepsList40, size: "40")
            RecipeRepository.createRecipe(category: category, title: self.recipteTitle, steps: self.stepsList50, size: "50")
        } else{
            RecipeRepository.createRecipe(category: category, title: self.recipteTitle, steps: self.stepsList, size: "")
        }
    }
    
    func deleteRecipe(with id: String){
        
        RecipeRepository.deleteRecipe(with: id)
    }
    
    func fetchRecipes(){
        
        self.listener = FirebaseManager.shared.database.collection("recipes").whereField("category", isEqualTo: selectedCategory)
            .addSnapshotListener{ querySnapshot, error in
                if let error{
                    print("error fetching recipes: ", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("error loading \(self.selectedCategory) from database")
                    return
                }
                
                self.recipes = documents.compactMap{ queryDocumentSnapshot -> Recipe? in
                    return try? queryDocumentSnapshot.data(as: Recipe.self)
                }
            }
    }
    
    func fetchPizzaByNameAndSize(size: String, title: String){
        FirebaseManager.shared.database.collection("recipes").whereField("size", isEqualTo: size).whereField("title", isEqualTo: title)
            .addSnapshotListener{ querySnapshot, error in
                if let error{
                    print("error fetching recipes: ", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("error loading \(self.selectedCategory) from database")
                    return
                }
                
                self.recipes = documents.compactMap{ queryDocumentSnapshot -> Recipe? in
                    return try? queryDocumentSnapshot.data(as: Recipe.self)
                }
            }
    }
    
    func fetchPizza(size: String){
        FirebaseManager.shared.database.collection("recipes").whereField("size", isEqualTo: size)
            .addSnapshotListener{ querySnapshot, error in
                if let error{
                    print("error fetching recipes: ", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("error loading \(self.selectedCategory) from database")
                    return
                }
                
                self.recipes = documents.compactMap{ queryDocumentSnapshot -> Recipe? in
                    return try? queryDocumentSnapshot.data(as: Recipe.self)
                }
            }
    }
    
    func removeListener(){
        self.listener?.remove()
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
    
    func changePizzaSizeIndex(){
        pizzaSizeIndex += 1
    }
}
