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

    
    var formattedUnit: String{
        if unit == "Gramm"{
            return "g"
        } else{
            return "Stk"
        }
    }
    
    var formattedValue: String{
        
        let parts = value.components(separatedBy: ".")
        
        if parts.count == 2, let decimalPart = parts.last, decimalPart.allSatisfy({ $0 == "0" }) {
            
            let integerValue = parts.first ?? ""
            return integerValue
            
        } else {
            
            return value
        }
    }
    
    var body: some View {
        HStack{
            VStack{
                Text(step)
                    .bold()
                    .font(.title3)
            }
            .frame(width: 50, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                Image(systemName: icon)
            }
            .frame(width: 50, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                Text(ingredient)
                    .bold()
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
            }
            .frame(width: 220, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack{
                Text("\(formattedValue) \(formattedUnit)")
                    .bold()
                    .font(.title3)
            }
            .frame(width: 80, height: 60)
            .background(Color.ppRed)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}

#Preview {
    StepComponent(step: "1", icon: "fork.knife", ingredient: "Hähnchenbrustfilet", value: "50", unit: "Stk")
}
