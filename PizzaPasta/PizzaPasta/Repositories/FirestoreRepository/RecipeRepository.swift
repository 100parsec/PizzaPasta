//
//  RecipeRepository.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.12.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecipeRepository{
    
    private static var listener: ListenerRegistration?
    
    static func createRecipe(category: String, title: String, steps: [Step]){
        let recipe = Recipe(id: UUID().uuidString, category: category, title: title, steps: steps)
        do{
            try FirebaseManager.shared.database.collection("recipes").addDocument(from: recipe)
        }catch let error{
            print("Error save data into databse: ", error.localizedDescription)
            //lieber firebase log
        }
    }
    
    static func deleteRecipe(with id: String){
        
        FirebaseManager.shared.database.collection("recipes").document(id).delete(){ error in
            if let error{
                print("error deleting recipe from database", error.localizedDescription)
                return
            }
        }
    }
    
//    static func fetchRecipes(category: String, recipeClosure: @escaping ([Ingredient]) -> Void){
//        
//        self.listener = FirebaseManager.shared.database.collection("recipes").whereField("category", isEqualTo: category)
//            .addSnapshotListener{ querySnapshot, error in
//                if let error{
//                    print("error fetching recipes: ", error.localizedDescription)
//                    return
//                }
//                
//                guard let documents = querySnapshot?.documents else {
//                    print("error loading \(category) from database")
//                    return
//                }
//                
//                self.recipes = documents.compactMap{ queryDocumentSnapshot -> Recipe? in
//                    return try? queryDocumentSnapshot.data(as: Recipe.self)
//                }
//            }
//    }
}
