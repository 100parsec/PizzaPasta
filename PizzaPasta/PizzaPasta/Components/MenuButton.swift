//
//  MenuButton.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 22.11.23.
//

import SwiftUI

struct MenuButton: View {
    
    let icon: String
    let buttonPressed: Bool
    let category: String
    let setButtonColor: (String) -> Void
    let fetchRecipes: (String) -> Void
    
    
    var body: some View {
        Button(action: {
            setButtonColor(category)
            fetchRecipes(category)
//            setButtonColors(button: "pizza")
//            recipeViewModel.fetchRecipes(category: "Pizza")
        }, label: {
            VStack {
                Image(icon)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .background(buttonPressed ? Color.ppYellow : Color.ppRed)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        })
        
        Text(icon)
            .font(.title)
            .foregroundColor(.white)
            .padding(.bottom, 20)
    }
}

//#Preview {
//    MenuButton(icon: "", buttonPressed: false, category: "pizza"){_ in } fetchRecipes: <#() -> Void#>
//}
