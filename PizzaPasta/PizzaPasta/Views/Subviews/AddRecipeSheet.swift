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
    @State var stepTitle = ""
    @State var showAddStep = false
    @State var recipeDescription = ""
    @State var recipeImage = ""
    @State var stepText = ""
    @State var steps = 1
    
    @State var stepsList:[Step] = []
    
    var stepTest: String {
        return "Schritt \(steps) Titel"
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
                    
                    Section("Schritt hinzufügen"){
                        HStack{
                            TextField(stepTest, text: $stepTitle)
                            
                            Button(action: {
                                showAddStep = true
                            }, label: {
                                Image(systemName: "plus")
                            })
                            
                            
                        }
                    }
                    
                    if showAddStep{
                        Section{
                            TextField("Beschreibung", text: $recipeDescription)
                            TextField("Bild hinzufügen", text: $recipeImage)
                            
                            Button(action: {
                                
                                let step = Step(id: UUID().uuidString, step: steps, stepTitle: stepTitle, description: recipeDescription)
                                stepsList.append(step)
                                
                                showAddStep = false
                                steps += 1
                                stepTitle = ""
                                recipeDescription = ""
                                recipeImage = ""
                                
                            }, label: {
                                Text("Hinzufügen")
                            })
                        }
                    }
                    
                    if stepsList.count > 0{
                        Section{
                            
                            ForEach(stepsList, id: \.id){ step in
                                Text(step.stepTitle)
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
