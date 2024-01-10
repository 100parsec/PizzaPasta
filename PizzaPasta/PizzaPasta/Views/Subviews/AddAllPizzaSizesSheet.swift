//
//  AddAllPizzaSizesSheet.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 05.01.24.
//

import SwiftUI

struct AddAllPizzaSizesSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var recipeVM: RecipeViewModel
    
    @State var testValues = [0.1, 0.1, 0.1]
    
    @State var sliderValue = 0.0
    
    @State var showSlider = false
//    
//    @State var stepsArr = [[Step]]()
//    
    @State var stepList = [Step]()
//    @State var stepList40 = [Step]()
//    @State var stepList50 = [Step]()
    
    @State var pizzaSize = "32"
    
    @State var testIndex = 0
    
    @State var newStep = Step(id: UUID().uuidString, step: 0, ingredient: Ingredient(id: UUID().uuidString, category: "", name: "", icon: ""), unit: "", value: 0.0)
    
    var body: some View {
        VStack {
            
            HStack{
                
                Text("Rezepte ergänzen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 50)
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color(red: 0.887, green: -0.142, blue: 0.133))
                })
                .padding(.trailing, 15)
                .padding(.top, 15)
                
            }
            
            
            Form{
                
                Section{
                    
                   
                    
                    ForEach(recipeVM.stepsList26, id: \.id){ step in
                        
                        HStack{
                            Text(step.ingredient.name)
                            
                            Spacer()
                            Text("\(step.value)")
                            Text("\(step.unit)")
                            
                            Button(action: {
                                self.newStep = step
                                self.showSlider = true
                                
                            }, label: {
                                Image(systemName: "pencil")
                            })

                        }
                        
                    }
                    
                    
                }
                
                Section{
                    if showSlider{
                        
                        VStack{
                            Slider(value: $sliderValue, in: 1...100, step: 0.5)
                            
                            Button(action: {
                                self.newStep.value = sliderValue
                                
                                
                                self.showSlider = false
                            }, label: {
                                Text("ändern")
                            })

                        }
                        
                        
                    }
                    
                }
            }
            .cornerRadius(8)
            .padding(.horizontal, 7)
            
            Spacer()
            
            HStack{
                
                Button(action: {
                    dismiss()
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
}

#Preview {
    AddAllPizzaSizesSheet()
}
