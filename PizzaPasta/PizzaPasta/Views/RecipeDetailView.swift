//
//  RecipeDetailView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe = Recipe(id: "", category: "Pizza", title: "Salami", steps: [Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 2, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0), Step(id: "", step: 1, ingredient: "", unit: "sasfbasfbadfsbasfbaFBASDFB", value: 0.0)])
    
    @State var index = 0
    
    @Binding var path: NavigationPath
    
    var body: some View {
        
        VStack{
            HStack{
                if recipe.category == "Pizza"{
                    SizeButtons(category: "Pizza")
                } else if recipe.category == "Salad"{
                    SizeButtons(category: "Salad")
                }
                
                Spacer()
                
                Image("PP_Logo")
                    .resizable()
                    .frame(width: 150, height: 80)
                    .padding(.trailing, 50)
                    .padding(.top, 20)
            }
            
            HStack {
                Text("\(recipe.category) \(recipe.title)")
                    .font(.system(size: 45))
                    .foregroundColor(Color(red: 0.49, green: 0.591, blue: 0.581))
                    .bold()
                    .padding(.leading, 50)
                
                Spacer()
            }
            
            HStack{
                VStack{
                    ForEach(0 ..< 8){ i in
                        
                        StepComponent(step: "\(self.recipe.steps[i].step)", icon: "fork.knife", ingredient: "Hähnchenbrustfilet", value: "50", unit: "Stk")
                    }
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if recipe.steps.count > 8{
                    VStack{
                        ForEach(8 ..< recipe.steps.count){ i in
                            StepComponent(step: "\(i + 1)", icon: "fork.knife", ingredient: "Hähnchenbrustfilet", value: "50", unit: "Stk")
                        }
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color.ppYellow)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 50)
            
            Spacer()
        }
        
        
    }
}

#Preview {
    RecipeDetailView(path: .constant(NavigationPath()))
}
