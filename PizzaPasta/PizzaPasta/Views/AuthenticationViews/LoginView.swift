//
//  LoginView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 14.11.23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
    
    @State private var username = ""
    @State private var password = ""
    @State private var isSecured = true
    
    var body: some View {
        
        VStack{
            Image("PP_Logo")
                .padding(.top, 80)
            
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 50)
                    .cornerRadius(5)
                
                TextField("Benutzername",text: $username)
                    .frame(width: 300, height: 50)
                    .padding(.leading, 15)
                    .cornerRadius(5)
                    .shadow(radius: 50)
                    .textInputAutocapitalization(.never)
            }
            .padding(.top, 50)
            
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 50)
                    .cornerRadius(5)
                
                HStack {
                    
                    if isSecured {
                        SecureField("Passwort",text: $password)
                            .frame(width: 230, height: 50)
                            .padding(.trailing, 15)
                            .cornerRadius(5)
                            .shadow(radius: 50)
                            .textInputAutocapitalization(.never)
                    } else{
                        TextField("Passwort",text: $password)
                            .frame(width: 230, height: 50)
                            .padding(.trailing, 15)
                            .cornerRadius(5)
                            .shadow(radius: 50)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }, label: {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.black)
                    })
                }
                
                
            }
            .padding(.top, 10)
            
            
            Button(action: {
                authenticationViewModel.login(username: self.username, password: self.password)
            }, label: {
                Text("ANMELDEN")
                    .foregroundColor(.white)
                    .bold()
                    .padding(10)
                    .frame(width: 150)
            })
            .background(Color(red: 1.023, green: 0.637, blue: -0.244))
            .cornerRadius(5)
            .padding(.top, 50)
            
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.49, green: 0.591, blue: 0.581))
        
        
    }
    
    func performToggle(){
        
    }
}

#Preview {
    LoginView()
}
