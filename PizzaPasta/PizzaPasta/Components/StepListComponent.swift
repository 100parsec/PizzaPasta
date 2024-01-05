//
//  StepListComponent.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 19.12.23.
//

import SwiftUI

struct StepListComponent: View {
    
    var ingredient: Step
    
    init(ingredient: Step){
        self.ingredient = ingredient
    }
    
    var body: some View {
        
        HStack {
            Text("\(ingredient.step). ")
            Text(ingredient.ingredient.name)
            Spacer()
            Text("\(ingredient.value, specifier: "%.1f")")
            Text(ingredient.unit)
        }
    }
}

#Preview {
    StepListComponent(ingredient: Step(id: "", step: 1, ingredient: Ingredient(id: "", category: "", name: "", icon: ""), unit: "", value: 1.0))
}
