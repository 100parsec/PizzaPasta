//
//  SettingsContextMenuComp.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 20.12.23.
//

import SwiftUI

struct SettingsContextMenuComp: View {
    
    @EnvironmentObject var homeviewModel: HomeViewModel
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var role: String
    
    var body: some View {
        Menu() {
            
            if role == StringValues.roleCentral {
                Button(StringValues.addRecipies, action: homeviewModel.showRecipeSheet)
                Button(StringValues.accountSettings, action: homeviewModel.showAccountSheet)
                //Button("Registrieren", action: homeviewModel.showAccountSheet)
                Button("Logout", action: authViewModel.logout)
            } else {
                Button("Logout", action: authViewModel.logout)
            }
            
            
        }label: {
            Image(systemName: StringValues.iconElipses)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(40)
                .background(.ppYellow)
                .foregroundColor(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    SettingsContextMenuComp(role: "")
}
