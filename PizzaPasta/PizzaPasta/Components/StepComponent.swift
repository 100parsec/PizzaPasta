//
//  StepComponent.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 06.12.23.
//

import SwiftUI

struct StepComponent: View {
    
    let step: String
    let icon: String
    let ingredient: String
    let value: String
    let unit: String
    
    var body: some View {
        HStack{
            VStack{
                Text(step)
                    .bold()
                    .font(.title2)
            }
            .frame(width: 60, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                Image(systemName: icon)
            }
            .frame(width: 60, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                Text(ingredient)
                    .bold()
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
            .frame(width: 230, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                Text("\(value) \(unit)")
                    .bold()
                    .font(.title2)
            }
            .frame(width: 90, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}

#Preview {
    StepComponent(step: "1", icon: "fork.knife", ingredient: "Hähnchenbrustfilet", value: "50", unit: "Stk")
}
