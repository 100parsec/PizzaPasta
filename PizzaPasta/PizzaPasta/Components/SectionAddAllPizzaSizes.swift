//
//  SectionAddAllPizzaSizes.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 05.01.24.
//

import SwiftUI

struct SectionAddAllPizzaSizes: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    @State var size = ""
    
    var body: some View {
        
        Picker("Zutat",selection: $recipeViewModel.ingredient){
            
            ForEach(recipeViewModel.ingredientArr, id: \.id){ ingredient in
                Text(ingredient.name).tag(ingredient.name)
            }
        }
        
        VStack {
            Text("Menge")
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                
                if size == "26"{
                    
                    VStack{
                        HStack{
                            Text("1")
                            Slider(value: $recipeViewModel.value26, in: 1...100, step: 0.5)
                            Text("100")
                        }
                        Text("\(recipeViewModel.value26, specifier: "%.1f")")
                    }
                    
                    
                } else if size == "32"{
                    
                    VStack{
                        HStack{
                            Text("1")
                            Slider(value: $recipeViewModel.value32, in: 1...100, step: 0.5)
                            Text("100")
                        }
                        Text("\(recipeViewModel.value32, specifier: "%.1f")")
                    }
                    
                    
                } else if size == "40"{
                    
                    VStack{
                        HStack{
                            Text("1")
                            Slider(value: $recipeViewModel.value40, in: 1...100, step: 0.5)
                            Text("100")
                        }
                        Text("\(recipeViewModel.value40, specifier: "%.1f")")
                    }
                    
                    
                } else if size == "50"{
                    
                    VStack{
                        HStack{
                            Text("1")
                            Slider(value: $recipeViewModel.value50, in: 1...100, step: 0.5)
                            Text("100")
                        }
                        Text("\(recipeViewModel.value50, specifier: "%.1f")")
                    }
                    
                    
                }
            }
            
        }
        
        Picker("Einheit", selection: $recipeViewModel.unit){
            ForEach(UnitEnum.allCases, id: \.self){ unit in
                Text(unit.unit).tag(unit.unit)
            }
        }
        
//        Button(action: {
//            //TODO Icons einbauen
//            
//            let step = Step(id: UUID().uuidString, step: recipeViewModel.steps, ingredient: Ingredient(id: UUID().uuidString, category: recipeViewModel.selectedCategory, name: recipeViewModel.ingredient, icon: "fork.knife"), unit: recipeViewModel.unit, value: recipeViewModel.value)
//            
//            if recipeViewModel.actuallySize == "26"{
//                recipeViewModel.stepsList26.append(step)
//            } else if recipeViewModel.actuallySize == "32"{
//                recipeViewModel.stepsList32.append(step)
//            } else if recipeViewModel.actuallySize == "40"{
//                recipeViewModel.stepsList40.append(step)
//            } else if recipeViewModel.actuallySize == "50"{
//                recipeViewModel.stepsList50.append(step)
//            }
//            
//            
//            recipeViewModel.showAddStep = false
//            recipeViewModel.steps += 1
//            recipeViewModel.ingredient = "Teig"
//            recipeViewModel.unit = "Gramm"
//        
//        }, label: {
//            Text("Hinzufügen")
//        })
        
        
//        Section(recipeViewModel.getSectionIngredientText()){
//            
//            Picker("Zutat",selection: $recipeViewModel.ingredient){
//                
//                ForEach(recipeViewModel.ingredientArr, id: \.id){ ingredient in
//                    Text(ingredient.name).tag(ingredient.name)
//                }
//            }
//            
//            VStack {
//                Text("Menge")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                HStack{
//                    Text("1")
//                    Slider(value: $recipeViewModel.value, in: 1...100, step: 0.5)
//                    Text("100")
//                }
//                Text("\(recipeViewModel.value, specifier: "%.1f")")
//            }
//            
//            Picker("Einheit", selection: $recipeViewModel.unit){
//                ForEach(UnitEnum.allCases, id: \.self){ unit in
//                    Text(unit.unit).tag(unit.unit)
//                }
//            }
//            
//            Button(action: {
//                //TODO Icons einbauen
//                
//                let step = Step(id: UUID().uuidString, step: recipeViewModel.steps, ingredient: Ingredient(id: UUID().uuidString, category: recipeViewModel.selectedCategory, name: recipeViewModel.ingredient, icon: "fork.knife"), unit: recipeViewModel.unit, value: recipeViewModel.value)
//                
//                if recipeViewModel.actuallySize == "26"{
//                    recipeViewModel.stepsList26.append(step)
//                } else if recipeViewModel.actuallySize == "32"{
//                    recipeViewModel.stepsList32.append(step)
//                } else if recipeViewModel.actuallySize == "40"{
//                    recipeViewModel.stepsList40.append(step)
//                } else if recipeViewModel.actuallySize == "50"{
//                    recipeViewModel.stepsList50.append(step)
//                }
//                
//                
//                recipeViewModel.showAddStep = false
//                recipeViewModel.steps += 1
//                recipeViewModel.ingredient = "Teig"
//                recipeViewModel.unit = "Gramm"
//            
//            }, label: {
//                Text("Hinzufügen")
//            })
//        }
    }
}

#Preview {
    SectionAddAllPizzaSizes()
}
