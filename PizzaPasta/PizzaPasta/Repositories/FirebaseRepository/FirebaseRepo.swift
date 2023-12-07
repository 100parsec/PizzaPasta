//
//  FirebaseRepo.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 23.11.23.
//

import Foundation
import FirebaseAuth

class FirebaseRepo{
    
    static let firebaseRepo = FirebaseRepo()
    
    private var auth = Auth.auth()
    
    func logout() -> Bool{
        do{
            try auth.signOut()
            return true
        }catch{
            print("error sign out user: ", error.localizedDescription)
            return false
        }
    }
    
    func register(email: String, password: String, role: String){
        auth.createUser(withEmail: email, password: password){ authResult, error in
            if let error {
                print("Resitration failed: ", error.localizedDescription)
                return
            }
            
            guard let authResult else{
                return
            }
            
            self.createUser(with: authResult.user.uid, email: email, role: role)
        }
    }
    
    private func createUser(with id: String, email: String, role: String){
        let newUser = FirestoreUser(id: id, email: email, role: role)
        
        do{
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: newUser)
            
        }catch let error {
            print("error save user into database: ", error.localizedDescription)
        }
    }
    
    
    func login(username: String, password: String) -> String?{
        
        var uid: String? = nil
        
        auth.signIn(withEmail: username, password: password){ authResult, error in
            if let error {
                print("login failed: ", error.localizedDescription)
                return
            }
            
            guard let authResult else { return }
            
            uid = authResult.user.uid
            
        }
        
        return uid
    }
}
