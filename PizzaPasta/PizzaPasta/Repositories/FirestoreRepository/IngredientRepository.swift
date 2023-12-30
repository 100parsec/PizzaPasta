//
//  IngredientRepository.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.12.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class IngredientRepository{
    
    private static var listener: ListenerRegistration?
    
    static func createIngredient(category: String, name: String, icon: String){
        let ingredient = Ingredient(id: UUID().uuidString, category: category, name: name, icon: icon)
        
        do{
            try FirebaseManager.shared.database.collection("ingredient").addDocument(from: ingredient)
        }catch let error{
            print("error save ingredient into firebase ", error)
        }
    }
    
    static func fetchIngredient(ingredientClosure: @escaping ([Ingredient]) -> Void){
        
        var ingredientList = [Ingredient]()
        
        self.listener = FirebaseManager.shared.database.collection("ingredient")
            .addSnapshotListener{ querySnapshot, error in
                if let error{
                    print("error fetching ingredient: ", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("error loading from database")
                    return
                }
                
                let unsortedIngredients = documents.compactMap{ queryDocumentSnapshot -> Ingredient? in
                    return try? queryDocumentSnapshot.data(as: Ingredient.self)
                }
                
                ingredientList = unsortedIngredients.sorted{ $0.name < $1.name }
                
                ingredientClosure(ingredientList)
                
            }
    }
}
