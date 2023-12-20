//
//  StepListComponent.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 19.12.23.
//

import SwiftUI

struct StepListComponent: View {
    
    @State var stepList = [Step]()
    
    var body: some View {
        
        Section{
            ForEach(self.stepList, id: \.id){ ingredient in
                HStack {
                    Text(ingredient.ingredient.name)
                    Spacer()
                    Text("\(ingredient.value, specifier: "%.1f")")
                    Text(ingredient.unit)
                }
            }
        }
    }
}

#Preview {
    StepListComponent()
}
