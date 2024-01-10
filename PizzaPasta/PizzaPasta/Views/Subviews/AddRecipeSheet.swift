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
    
    
    
    
    var stepCount: String {
        return "\(recipeViewModel.steps). Zutat"
    }
    
    var body: some View {
        VStack {
            
            HStack{
                
                Text("\(recipeViewModel.selectedCategory) Rezept hinzufügen")
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
                        Text(recipeViewModel.selectedCategory)
                        TextField("Titel", text: $recipeViewModel.recipteTitle)
                    }
                    
                    Section("Zutat hinzufügen"){
                        HStack{
                            
                            Text("\(stepCount)")
                            
                            Spacer()
                            
                            Button(action: {
                                recipeViewModel.showAddStep = true
                                
                            }, label: {
                                Image(systemName: "plus")
                            })
                        }
                    }
                    
                    if recipeViewModel.showAddStep{
                        if recipeViewModel.selectedCategory == "Pizza"{
                            List{
                                
                                Section("26er"){
                                    SectionAddAllPizzaSizes(size: "26").environmentObject(recipeViewModel)
                                }
                                
                                Section("32er"){
                                    SectionAddAllPizzaSizes(size: "32").environmentObject(recipeViewModel)
                                }
                                
                                Section("40er"){
                                    SectionAddAllPizzaSizes(size: "40").environmentObject(recipeViewModel)
                                }
                                
                                Section("50er"){
                                    SectionAddAllPizzaSizes(size: "50").environmentObject(recipeViewModel)
                                }
                                
                                Section{
                                    Button(action: {
                                        //TODO Icons einbauen
                                        
                                        var step = Step(id: UUID().uuidString, step: recipeViewModel.steps, ingredient: Ingredient(id: UUID().uuidString, category: recipeViewModel.selectedCategory, name: recipeViewModel.ingredient, icon: "fork.knife"), unit: recipeViewModel.unit, value: recipeViewModel.value)
                                        
                                        if recipeViewModel.selectedCategory == "Pizza"{
                                            step.value = recipeViewModel.value26
                                            recipeViewModel.stepsList26.append(step)
                                            
                                            step.value = recipeViewModel.value32
                                            recipeViewModel.stepsList32.append(step)
                                            
                                            step.value = recipeViewModel.value40
                                            recipeViewModel.stepsList40.append(step)
                                            
                                            step.value = recipeViewModel.value50
                                            recipeViewModel.stepsList50.append(step)
                                            
                                        } else{
                                            step.value = recipeViewModel.value
                                            recipeViewModel.stepsList.append(step)
                                        }
                                        
                                        
                                        
                                        recipeViewModel.showAddStep = false
                                        recipeViewModel.steps += 1
                                        recipeViewModel.ingredient = "Teig"
                                        recipeViewModel.unit = "Gramm"
                                        
                                    }, label: {
                                        Text("Hinzufügen")
                                    })
                                }
                                
                            }
                        }else{
                            
                            Picker("Zutat",selection: $recipeViewModel.ingredient){
                                
                                ForEach(recipeViewModel.ingredientArr, id: \.id){ ingredient in
                                    Text(ingredient.name).tag(ingredient.name)
                                }
                            }
                            VStack{
                                HStack{
                                    Text("1")
                                    Slider(value: $recipeViewModel.value, in: 1...100, step: 0.5)
                                    Text("100")
                                }
                                Text("\(recipeViewModel.value, specifier: "%.1f")")
                            }
                            
                            Section{
                                Button(action: {
                                    //TODO Icons einbauen
                                    
                                    var step = Step(id: UUID().uuidString, step: recipeViewModel.steps, ingredient: Ingredient(id: UUID().uuidString, category: recipeViewModel.selectedCategory, name: recipeViewModel.ingredient, icon: "fork.knife"), unit: recipeViewModel.unit, value: recipeViewModel.value)
                                    
                                    
                                    step.value = recipeViewModel.value
                                    recipeViewModel.stepsList.append(step)
                                    
                                    recipeViewModel.showAddStep = false
                                    recipeViewModel.steps += 1
                                    recipeViewModel.ingredient = "Teig"
                                    recipeViewModel.unit = "Gramm"
                                    
                                }, label: {
                                    Text("Hinzufügen")
                                })
                            }
                        }
                    }
                    
                    if recipeViewModel.stepsList26.count > 0{
                        VStack{
                            ForEach(recipeViewModel.stepsList26, id: \.id){ ingredient in
                                StepListComponent(ingredient: ingredient)
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
                    recipeViewModel.createRecipe(category: recipeViewModel.selectedCategory.capitalized)
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
        .sheet(isPresented: $recipeViewModel.showAddPizzaSizeSheet){
            AddAllPizzaSizesSheet()
                .environmentObject(recipeViewModel)
        }
        .background(Color(red: 0.49, green: 0.591, blue: 0.581))
        .interactiveDismissDisabled()
    }
    
    func close() {
        recipeViewModel.resetData()
        dismiss()
    }
    
}

#Preview {
    AddRecipeSheet()
}
