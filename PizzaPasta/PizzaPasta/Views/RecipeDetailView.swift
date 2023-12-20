//
//  RecipeDetailView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe = Recipe(id: "", category: "", title: "", steps: [Step(id: "", step: 1, ingredient: Ingredient(id: "", category: "", name: "", icon: ""), unit: "", value: 0.0)])
    
    @State var index = 0
    
    @Binding var path: NavigationPath
    
    var body: some View {
        
        VStack{
            HStack{
                if recipe.category == StringValues.pizza{
                    SizeButtons(category: StringValues.pizza)
                } else if recipe.category == StringValues.salad{
                    SizeButtons(category: StringValues.salad)
                }
                
                Spacer()
                
                Image(StringValues.ppLogo)
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
                
                
                if recipe.steps.count > 8{
                    VStack{
                        HStack{
                            VStack {
                                ForEach(0 ..< 8){ i in
                                    StepComponent(step: "\(recipe.steps[i].step)", icon: "fork.knife", ingredient: recipe.steps[i].ingredient.name, value: "\(recipe.steps[i].value)", unit: recipe.steps[i].unit)
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 15)
                            .padding(.horizontal, 15)
                            
                            Spacer()
                            
                            VStack {
                                ForEach(8 ..< recipe.steps.count){ i in
                                    StepComponent(step: "\(recipe.steps[i].step)", icon: "fork.knife", ingredient: recipe.steps[i].ingredient.name, value: "\(recipe.steps[i].value)", unit: recipe.steps[i].unit)
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 15)
                            .padding(.horizontal, 15)
                        }
                    }
                    
                } else{
                    VStack{
                        ForEach(recipe.steps, id: \.id){ i in
                            
                            StepComponent(step: "\(i.step)", icon: "fork.knife", ingredient: i.ingredient.name, value: "\(i.value)", unit: i.unit)
                        }
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
