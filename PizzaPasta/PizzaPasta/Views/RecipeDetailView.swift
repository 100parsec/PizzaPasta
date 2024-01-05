//
//  RecipeDetailView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe = Recipe(id: "", category: "", title: "", steps: [Step(id: "", step: 1, ingredient: Ingredient(id: "", category: "", name: "", icon: ""), unit: "", value: 0.0)])
    
    
    //TODO beim speichern auf groß- kleinschreibung achten
    
    let rows = [
        GridItem(.fixed(60)),
        GridItem(.fixed(60)),
        GridItem(.fixed(60)),
        GridItem(.fixed(60)),
        GridItem(.fixed(60)),
        GridItem(.fixed(60)),
        GridItem(.fixed(60)),
        GridItem(.fixed(60))
    ]
    
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
                
                HStack(){
                    LazyHGrid(rows: rows, alignment: .top, spacing: -4){
                        ForEach(recipe.steps, id: \.id){ i in
                            StepComponent(step: "\(i.step)", icon: "fork.knife", ingredient: i.ingredient.name, value: "\(i.value)", unit: i.unit)
                                .padding(.top, 15)
                                .padding(.leading, 10)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
