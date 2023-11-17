//
//  AuthenticationViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 14.11.23.
//

import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject{
    
    init(){
        checkAuth()
    }
    
    private var auth = Auth.auth()
    
    @Published var user: FirestoreUser?
    
    var isUserLoggedIn: Bool{
        user != nil
    }
    
    private func checkAuth(){
        guard let currentUser = auth.currentUser else {
            //crashlytics einbauen
            return
        }
        
        self.fetchUser(with: currentUser.uid)
    }
    
    func login(username: String, password: String){
        
        
        auth.signIn(withEmail: username, password: password){ authResult, error in
            if let error {
                print("login failed: ", error.localizedDescription)
                return
            }
            
            guard let authResult else { return }
            
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    
    func register(email: String, password: String, role: String){
        auth.createUser(withEmail: email, password: password){ authResult, error in
            if let error {
                print("Resitration failed: ", error.localizedDescription)
                return
            }
            
            guard let authResult else{ return }
            
            self.createUser(with: authResult.user.uid, email: email, role: role)
            
            //self.login(username: email, password: password)
        }
    }
    
    func logout(){
        do{
            try auth.signOut()
            self.user = nil
        }catch{
            print("error sign out user: ", error.localizedDescription)
        }
    }
}
