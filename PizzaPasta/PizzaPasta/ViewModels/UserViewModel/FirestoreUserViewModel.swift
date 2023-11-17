//
//  FirestoreUserViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 14.11.23.
//

import Foundation

extension AuthenticationViewModel{
    
    
    func createUser(with id: String, email: String, role: String){
        let newUser = FirestoreUser(id: id, email: email, role: role)
        
        do{
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: newUser)
            
        }catch let error {
            print("error save user into database: ", error.localizedDescription)
        }
    }
    
    func fetchUser(with id: String){
        
        FirebaseManager.shared.database.collection("users").document(id).getDocument{ document, error in
            if let error {
                print("error fetching user from database: ", error.localizedDescription)
                return
            }
            
            guard let document else{
                print("document for user does not exists")
                return
            }
            
            do{
                self.user = try document.data(as: FirestoreUser.self)
            }catch{
                print("document is not user: ", error.localizedDescription)
            }
        }
    }
}
