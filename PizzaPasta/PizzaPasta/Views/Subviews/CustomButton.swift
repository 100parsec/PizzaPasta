//
//  CustomButton.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    
    @State var isButtonClicked = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(isButtonClicked ? Color(red: 1.023, green: 0.637, blue: -0.244) : Color(red: 0.887, green: -0.142, blue: 0.133))
            .padding()
            .onChange(of: configuration.isPressed) { i, y in
                if !i{
                    isButtonClicked.toggle()
                }
                
            }
    }
}

#Preview(body: {
    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
    })
    .buttonStyle(CustomButton())
})
