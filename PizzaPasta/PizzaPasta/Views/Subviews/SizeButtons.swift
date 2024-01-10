//
//  SizeButtons.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct SizeButtons: View {
    
    @EnvironmentObject var recipeVM: RecipeViewModel
    @State var category = StringValues.pizza
    
    var body: some View {
        
        if category == StringValues.pizza{
            HStack {
                Button(action: {
                    recipeVM.fetchPizza(size: "26")
                }, label: {
                    Text(PizzaSizeEnum.sizeOne.sizes)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(.ppYellow)
                        .cornerRadius(10)
                })
                .padding(.leading, 50)
                .padding(.top, 10)
                
                Button(action: {
                    recipeVM.fetchPizza(size: "32")
                }, label: {
                    Text(PizzaSizeEnum.sizeTwo.sizes)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 0.887, green: -0.142, blue: 0.133))
                        .cornerRadius(10)
                })
                .padding(.leading, 20)
                .padding(.top, 10)
                
                
                Button(action: {
                    
                }, label: {
                    Text(PizzaSizeEnum.sizeThree.sizes)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 0.887, green: -0.142, blue: 0.133))
                        .cornerRadius(10)
                })
                .padding(.leading, 20)
                .padding(.top, 10)
                
                Button(action: {
                    
                }, label: {
                    Text(PizzaSizeEnum.sizeFour.sizes)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 0.887, green: -0.142, blue: 0.133))
                        .cornerRadius(10)
                })
                .padding(.leading, 20)
                .padding(.top, 15)
            }
        } else if category == StringValues.salad{
            HStack {
                Button(action: {
                    
                }, label: {
                    Text(SaladSizeEnum.sizeOne.sizes)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 0.887, green: -0.142, blue: 0.133))
                        .cornerRadius(10)
                })
                .padding(.leading, 20)
                .padding(.top, 10)
                
                Button(action: {
                    
                }, label: {
                    Text(SaladSizeEnum.sizeTwo.sizes)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 0.887, green: -0.142, blue: 0.133))
                        .cornerRadius(10)
                })
                .padding(.leading, 20)
                .padding(.top, 15)
            }
        }
        
        
        
    }
}

#Preview {
    SizeButtons()
}
