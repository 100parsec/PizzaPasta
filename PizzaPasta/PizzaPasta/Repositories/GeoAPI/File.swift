//
//  File.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.12.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


// RecipeRepository.swift

import Foundation


class RecipeRepository2 {
    var onDataUpdate: (([Recipe]) -> Void)?
    private var listener: ListenerRegistration?
    
    func fetchRecipes(completion: @escaping (Result<[Recipe], Error>) -> Void) {
        // Implementiere die Logik, um Rezepte aus Firestore abzurufen
        // und rufe die completion Handler mit den Ergebnissen auf
        
        
        
        
        // Aktualisiere dann items und rufe onDataUpdate auf
        // mit den aktualisierten Daten
    }
    
    func startObserving(listener: @escaping ([Recipe]) -> Void) {
        self.listener = FirebaseManager.shared.database.collection("recipes").addSnapshotListener { querySnapshot, error in
            if let error = error {
                // Handle Fehler
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                // Handle keine Daten
                return
            }
            
            let recipes = documents.compactMap { queryDocumentSnapshot -> Recipe? in
                return try? queryDocumentSnapshot.data(as: Recipe.self)
            }
            
            // Rufe den Listener aus dem ViewModel auf
            listener(recipes)
            
            // Rufe auch den onDataUpdate im Repository auf
            self.onDataUpdate?(recipes)
        }
    }
    
    func stopObserving() {
        // Stoppe den Snapshot-Listener hier
        listener?.remove()
    }
}

// IngredientRepository.swift


class IngredientRepository2 {
    var onDataUpdate: (([Ingredient]) -> Void)?
    private var listener: ListenerRegistration?
    
    func fetchIngredients(completion: @escaping (Result<[Ingredient], Error>) -> Void) {
        // Implementiere die Logik, um Zutaten aus Firestore abzurufen
        // und rufe die completion Handler mit den Ergebnissen auf
        // Aktualisiere dann items und rufe onDataUpdate auf
        // mit den aktualisierten Daten
    }
    
    func startObserving(listener: @escaping ([Ingredient]) -> Void) {
        self.listener = FirebaseManager.shared.database.collection("ingredients").addSnapshotListener { querySnapshot, error in
            if let error = error {
                // Handle Fehler
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                // Handle keine Daten
                return
            }
            
            let ingredients = documents.compactMap { queryDocumentSnapshot -> Ingredient? in
                return try? queryDocumentSnapshot.data(as: Ingredient.self)
            }
            
            // Rufe den Listener aus dem ViewModel auf
            listener(ingredients)
            
            // Rufe auch den onDataUpdate im Repository auf
            self.onDataUpdate?(ingredients)
        }
    }
    
    func stopObserving() {
        // Stoppe den Snapshot-Listener hier
        listener?.remove()
    }
}

// RecipeViewModel.swift


class RecipeViewModel2 {
    private let recipeRepository = RecipeRepository2()
    private let ingredientRepository = IngredientRepository2()
    
    var onDataUpdate: (() -> Void)? {
        didSet {
            // Setze den onDataUpdate-Handler in beiden Repositories
            recipeRepository.onDataUpdate = { [weak self] recipes in
                self?.onDataUpdate?()
            }
            
            ingredientRepository.onDataUpdate = { [weak self] ingredients in
                self?.onDataUpdate?()
            }
            
            // Registriere den Listener im ViewModel und übergib ihn an die Repositories
            recipeRepository.startObserving { [weak self] recipes in
                self?.onDataUpdate?()
            }
            
            ingredientRepository.startObserving { [weak self] ingredients in
                self?.onDataUpdate?()
            }
        }
    }
    
    func fetchData() {
        // Hier kannst du die Logik implementieren, um Daten
        // von beiden Repositories abzurufen
        recipeRepository.fetchRecipes { result in
            // Handle das Ergebnis
        }
        
        ingredientRepository.fetchIngredients { result in
            // Handle das Ergebnis
        }
    }
    
    func stopObserving() {
        recipeRepository.stopObserving()
        ingredientRepository.stopObserving()
    }
}
