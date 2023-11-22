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
    
    @Published var recipes = [Recipe]()
    
    private var listener: ListenerRegistration?
    
    func createRecipe(category: String, title: String, steps: [Step]){
        let recipe = Recipe(id: UUID().uuidString, category: category, title: title, steps: steps)
        
        do{
            try FirebaseManager.shared.database.collection("recipes").addDocument(from: recipe)
        }catch let error{
            print("Error save data into databse: ", error.localizedDescription)
            //lieber firebase log
        }
    }
    
    func deleteMeal(with id: String){
        
        FirebaseManager.shared.database.collection("recipes").document(id).delete(){ error in
            if let error{
                print("error deleting recipe from database", error.localizedDescription)
                return
            }
        }
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
}
