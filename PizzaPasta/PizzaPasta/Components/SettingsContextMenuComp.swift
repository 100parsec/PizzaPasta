//
//  SettingsContextMenuComp.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 20.12.23.
//

import SwiftUI

struct SettingsContextMenuComp: View {
    
    @EnvironmentObject var homeviewModel: HomeViewModel
    
    var body: some View {
        Menu() {
            
            
            Button(StringValues.addRecipies, action: homeviewModel.showRecipeSheet)
            Button(StringValues.accountSettings, action: homeviewModel.showAccountSheet)
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
    SettingsContextMenuComp()
}
