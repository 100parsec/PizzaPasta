//
//  AddRecipeSheet.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 17.11.23.
//

import SwiftUI

struct AddRecipeSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    @Binding var selectetCategorie: String
    
    @State var recipteTitle = ""
    @State var showAddStep = false
    @State var ingredient = "Teig"
    @State var stepText = ""
    @State var steps = 1
    @State var value: Double = 1.0
    @State var unit = "Gramm"
    
    let pizzaSizes = ["26", "32", "40", "50"]
    @State var pizzaSizeIndex = 0
    
    @State var pizzaRecipes: [Recipe] = []
    
    @State var stepList26: [Step] = []
    @State var stepList32: [Step] = []
    @State var stepList40: [Step] = []
    @State var stepList50: [Step] = []
    
    @State var ingredients: [Ingredient] = []
    @State var stepsList:[Step] = []
    
    var stepTest: String {
        return "\(steps). Zutat"
    }

    var body: some View {
        VStack {
            
            HStack{
                
                Text("\(selectetCategorie) Rezept hinzufügen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 50)
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    close()
                }, label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color(red: 0.887, green: -0.142, blue: 0.133))
                })
                .padding(.trailing, 15)
                .padding(.top, 15)
                
            }
            
            
            HStack{
                
                Form {
                    Section("Kategorie & Titel"){
                        Text(selectetCategorie)
                        TextField("Titel", text: $recipteTitle)
                    }
                    
                    Section("Zutat hinzufügen"){
                        HStack{
                            
                            Text("\(stepTest)")
                            
                            Spacer()
                            
                            Button(action: {
                                showAddStep = true
                                
                                if recipeViewModel.ingredient.count == 0{
                                    recipeViewModel.fetchIngredient(category: selectetCategorie)
                                }
                                
                            }, label: {
                                Image(systemName: "plus")
                            })
                        }
                    }
                    
                    if showAddStep{
                        Section("Zutaten Einheit für die \(pizzaSizes[pizzaSizeIndex])er"){
                            
                            Picker("Zutat",selection: $ingredient){
                                
                                ForEach(recipeViewModel.ingredient, id: \.id){ ingredient in
                                    Text(ingredient.name).tag(ingredient.name)
                                }
                            }
                            
                            VStack {
                                Text("Menge")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                HStack{
                                    Text("1")
                                    Slider(value: $value, in: 1...100, step: 0.5)
                                    Text("100")
                                }
                                Text("\(value, specifier: "%.1f")")
                            }
                            
                            Picker("Einheit", selection: $unit){
                                ForEach(UnitEnum.allCases, id: \.self){ unit in
                                    Text(unit.unit).tag(unit.unit)
                                }
                            }
                            
                            Button(action: {
                                //TODO Icons einbauen
                                if selectetCategorie == "Pizza"{
                                    if pizzaSizeIndex < 3{
                                        pizzaSizeIndex += 1
                                        
                                        if pizzaSizeIndex == 0{
                                            let step = Step(id: UUID().uuidString, step: steps, ingredient: Ingredient(id: UUID().uuidString, category: self.selectetCategorie, name: self.ingredient, icon: "fork.knife"), unit: unit, value: value)
                                            stepList26.append(step)
                                        } else if pizzaSizeIndex == 1{
                                            let step = Step(id: UUID().uuidString, step: steps, ingredient: Ingredient(id: UUID().uuidString, category: self.selectetCategorie, name: self.ingredient, icon: "fork.knife"), unit: unit, value: value)
                                            stepList32.append(step)
                                        } else if pizzaSizeIndex == 2{
                                            let step = Step(id: UUID().uuidString, step: steps, ingredient: Ingredient(id: UUID().uuidString, category: self.selectetCategorie, name: self.ingredient, icon: "fork.knife"), unit: unit, value: value)
                                            stepList40.append(step)
                                        } else if pizzaSizeIndex == 3{
                                            let step = Step(id: UUID().uuidString, step: steps, ingredient: Ingredient(id: UUID().uuidString, category: self.selectetCategorie, name: self.ingredient, icon: "fork.knife"), unit: unit, value: value)
                                            stepList50.append(step)
                                        }
                                        
                                    } else{
                                        pizzaSizeIndex = 0
                                        showAddStep = false
                                        steps += 1
                                        ingredient = "Teig"
                                        unit = "Gramm"
                                    }
                                } else{
                                    
                                    let step = Step(id: UUID().uuidString, step: steps, ingredient: Ingredient(id: UUID().uuidString, category: self.selectetCategorie, name: self.ingredient, icon: "fork.knife"), unit: unit, value: value)
                                    stepsList.append(step)
                                    
                                    showAddStep = false
                                    steps += 1
                                    ingredient = "Teig"
                                    unit = "Gramm"
                                }
                                
                                
                                
                            }, label: {
                                Text("Hinzufügen")
                            })
                        }
                    }
                    
                    if stepsList.count > 0{
                        StepListComponent(stepList: stepsList)
                    }
                    
                    if stepList26.count > 0{
                        StepListComponent(stepList: stepList26)
                    }
                }
                .cornerRadius(8)
                .padding(.leading, 7)
                
                
                Spacer()
            }
            
            HStack{
                
                Button(action: {
                    close()
                }, label: {
                    Text("Abbrechen")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 0.887, green: -0.142, blue: 0.133))
                        .cornerRadius(10)
                })
                .padding(.leading, 50)
                .padding(.top, 10)
                
                Spacer()
                
                Button(action: {
                    recipeViewModel.createRecipe(category: selectetCategorie, title: recipteTitle, steps: stepsList)
                    close()
                    
                }, label: {
                    Text("Speichern")
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 150)
                        .background(Color(red: 1.023, green: 0.637, blue: -0.244))
                        .cornerRadius(10)
                })
                .padding(.trailing, 50)
                .padding(.top, 10)
            }
            
            Spacer()
            
        }
        .background(Color(red: 0.49, green: 0.591, blue: 0.581))
        .interactiveDismissDisabled()
    }

    func close() {
        dismiss()
    }
}

#Preview {
    AddRecipeSheet(selectetCategorie: .constant("Pizza"))
}
