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
                        Section{
                            
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
                                
                                let step = Step(id: UUID().uuidString, step: steps, ingredient: ingredient, unit: unit, value: value)
                                stepsList.append(step)
                                
                                
                                showAddStep = false
                                steps += 1
                                ingredient = "Teig"
                                unit = "Gramm"
                                
                            }, label: {
                                Text("Hinzufügen")
                            })
                        }
                    }
                    
                    if stepsList.count > 0{
                        Section{
                            
                            ForEach(stepsList, id: \.id){ ingredient in
                                HStack {
                                    Text(ingredient.ingredient)
                                    Spacer()
                                    Text("\(ingredient.value, specifier: "%.1f")")
                                    Text(ingredient.unit)
                                }
                            }
                            
                        }
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
