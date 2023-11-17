//
//  PizzaPastaApp.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 14.11.23.
//

import SwiftUI
import Firebase

@main
struct PizzaPastaApp: App {
    
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
//            if authenticationViewModel.isUserLoggedIn{
//                HomeView()
//                    .environmentObject(authenticationViewModel)
//            } else {
//                LoginView()
//            }
        }
    }
}
