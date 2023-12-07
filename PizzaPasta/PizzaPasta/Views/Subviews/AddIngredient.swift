//
//  AddIngredient.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 06.12.23.
//

import SwiftUI

struct AddIngredient: View {
    
    @StateObject var vm = RecipeViewModel()
    
    @State var cat = ""
    @State var name = ""
    @State var icon = ""
    
    var body: some View {
        VStack{
            TextField("Category", text: $cat)
            TextField("name", text: $name)
            TextField("name", text: $icon)
            
            Button(action: {
                save()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
    
    func save(){
        vm.createIngredient(category: cat, name: name, icon: icon)
    }
}

#Preview {
    AddIngredient()
}
