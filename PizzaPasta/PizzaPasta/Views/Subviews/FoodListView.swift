//
//  FoodListView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 15.11.23.
//

import SwiftUI

struct FoodListView: View {
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 500)
            .background(Color.gray)
        }
        .frame(width: 800)
        .background(Color.blue)
        
    }
}

#Preview {
    FoodListView()
}
