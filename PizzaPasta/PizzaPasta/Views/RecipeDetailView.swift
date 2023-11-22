//
//  RecipeDetailView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 21.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe = Recipe(id: "", category: "Pizza", title: "Salami", steps: [Step(id: "", step: 1, stepTitle: "", description: "sasfbasfbadfsbasfbaFBASDFB")])
    
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
            
            ScrollView(.horizontal){
                HStack {
                    ForEach(recipe.steps, id: \.id){ step in
                        VStack{
                            Text("Schritt \(step.step)")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 45))
                                .padding(.top, 35)
                            
                            Text(step.description)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 20)
                                .font(.title)
                            
                            Spacer()
                        }
                        .frame(width: 400, height: 500)
                        .background(Color.ppRed)
                        .cornerRadius(20)
                    }
                    
//                    AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/pizzapasta-e305a.appspot.com/o/salami.jpg?alt=media&token=e9042ca5-e646-4bfa-9d9f-37505f021e19"),
//                        content: { image in
//                        image.image?.resizable().frame(width: 500, height: 500).padding(.leading, 35)
//                    })
                    
                    Image("salami")
                        .resizable()
                        .frame(width: 500, height: 500)
                        .padding(.leading, 35)
                }
            }
            .padding(.leading, 50)
            .padding(.top, 50)
            
            Spacer()
        }
        
        
    }
}

#Preview {
    RecipeDetailView()
}
