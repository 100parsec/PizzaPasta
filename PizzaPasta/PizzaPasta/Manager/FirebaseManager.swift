//
//  FirebaseManager.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 14.11.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager{
    
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    var userId: String? {
        auth.currentUser?.uid
    }
}
