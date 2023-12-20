//
//  StoreViewModel.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 13.12.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class StoreViewModel: ObservableObject{
    
    @Published var storeList = [StoreModel]()
    
    private var listener: ListenerRegistration?
    
    init(){
        fetchStores()
    }
    
    
    func fetchStores(){
        self.listener = FirebaseManager.shared.database.collection("stores")
            .addSnapshotListener{ querySnapshot, error in
                if let error{
                    print("error fetching stores: ", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("error loading stores from database")
                    return
                }
                
                self.storeList = documents.compactMap{ queryDocumentSnapshot -> StoreModel? in
                    return try? queryDocumentSnapshot.data(as: StoreModel.self)
                }
            }
    }
    
    func saveStore(store: StoreModel){
        do{
            try FirebaseManager.shared.database.collection("stores").addDocument(from: store)
        }catch let error{
            print("Error save data into databse: ", error.localizedDescription)
            //lieber firebase log
        }
    }
    
    func deleteStore(){
        
    }
    
    func updateStore(){
        
    }
}
