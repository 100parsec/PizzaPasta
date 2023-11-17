//
//  CategoryButton.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 17.11.23.
//

import SwiftUI

struct CategoryButton: View {
    
    let red = Color(red: 0.887, green: -0.142, blue: 0.133)
    let yellow = Color(red: 1.023, green: 0.637, blue: -0.244)
    
    @Binding var pizzaButtonPressed: Bool
    @Binding var pastaButtonPressed: Bool
    @Binding var saladButtonPressed: Bool
    @Binding var bowlButtonPressed: Bool
    @Binding var wrapsButtonPressed: Bool
    @Binding var fingerfoodButtonPressed: Bool
    
    
    let imageName: String
    let categoryText: String
    
    var body: some View {
        Button(action: {
            setButtonColors(button: categoryText)
        }, label: {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .background(pizzaButtonPressed ? yellow : red)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
        })
        
        Text(categoryText)
            .font(.title)
            .foregroundColor(.white)
            .padding(.bottom, 20)
    }
    
    func setButtonColors(button: String){
        
        if button == "pizza"{
            pizzaButtonPressed = true
            //                pastaButtonPressed = false
            //                buttonPressed = false
            //                saladButtonPressed = false
            //                bowlButtonPressed = false
            //                wrapsButtonPressed = false
            //                fingerfoodButtonPressed = false
            
        } else if button == "pasta"{
            pizzaButtonPressed = false
            //                pastaButtonPressed = true
            //                buttonPressed = false
            //                saladButtonPressed = false
            //                bowlButtonPressed = false
            //                wrapsButtonPressed = false
            //                fingerfoodButtonPressed = false
            
        } else if button == "plus"{
            pizzaButtonPressed = false
            //                pastaButtonPressed = false
            //                buttonPressed = true
            //                saladButtonPressed = false
            //                bowlButtonPressed = false
            //                wrapsButtonPressed = false
            //                fingerfoodButtonPressed = false
            
        } else if button == "salat"{
            pizzaButtonPressed = false
            //                pastaButtonPressed = false
            //                buttonPressed = false
            //                saladButtonPressed = true
            //                bowlButtonPressed = false
            //                wrapsButtonPressed = false
            //                fingerfoodButtonPressed = false
            
        } else if button == "bowl"{
            pizzaButtonPressed = false
            //                pastaButtonPressed = false
            //                buttonPressed = false
            //                saladButtonPressed = false
            //                bowlButtonPressed = true
            //                wrapsButtonPressed = false
            //                fingerfoodButtonPressed = false
            
        } else if button == "wraps"{
            pizzaButtonPressed = false
            //                pastaButtonPressed = false
            //                buttonPressed = false
            //                saladButtonPressed = false
            //                bowlButtonPressed = false
            //                wrapsButtonPressed = true
            //                fingerfoodButtonPressed = false
            
        } else if button == "fingerfood"{
            pizzaButtonPressed = false
            //                pastaButtonPressed = false
            //                buttonPressed = false
            //                saladButtonPressed = false
            //                bowlButtonPressed = false
            //                wrapsButtonPressed = false
            //                fingerfoodButtonPressed = true
        }
    }
}

//#Preview {
//    CategoryButton()
//}
