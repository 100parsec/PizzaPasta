//
//  CategoryButton.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 17.11.23.
//

import SwiftUI

struct CategoryButton: View {
    
    @Binding var btnColor: Color
    
    var category: String
    var menuIcon: MenuIconEnum
    var recipeViewModel: RecipeViewModel
    let function: () -> Void
    
    var body: some View {
        Button(action: {
            function()
            btnColor = .ppYellow
            recipeViewModel.fetchRecipes(category: category)
        }, label: {
            VStack {
                Image(menuIcon.menuIcons)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .background(btnColor)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        })
        
        Text(menuIcon.menuIcons)
            .font(.title)
            .foregroundColor(.white)
            .padding(.bottom, 20)
    }
    
    private func resetButtonColor(){
        btnColor = .ppRed
    }
}

//#Preview {
//    CategoryButton()
//}
