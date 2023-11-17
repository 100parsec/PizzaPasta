//
//  AddRecipeSheet.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 17.11.23.
//

import SwiftUI

struct AddRecipeSheet: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Sheet view")

            Button("Dismiss", action: close)
        }
        .interactiveDismissDisabled()
    }

    func close() {
        dismiss()
    }
}

#Preview {
    AddRecipeSheet()
}
