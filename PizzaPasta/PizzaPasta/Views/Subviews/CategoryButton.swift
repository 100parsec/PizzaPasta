//
//  CategoryButton.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 17.11.23.
//

import SwiftUI

struct CategoryButton: View {
    
    @Binding var btnColor: Color
    @Binding var selectetCategorie: String
    
    var category: String
    var menuIcon: MenuIconEnum
    var recipeViewModel: RecipeViewModel
    let resetButtonColor: () -> Void
    let resetPath: () -> Void
    
    var body: some View {
        Button(action: {
            selectetCategorie = category.capitalized
            resetButtonColor()
            resetPath()
            btnColor = .ppYellow
            
            if selectetCategorie == "Pizza"{
                recipeViewModel.fetchPizza(size: "26")
            } else{
                recipeViewModel.fetchRecipes()
            }
            
            
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
}

//#Preview {
//    CategoryButton()
//}
