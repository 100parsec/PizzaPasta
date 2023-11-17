//
//  AddRecipeSheetView.swift
//  PizzaPasta
//
//  Created by Oliver Hamiko on 16.11.23.
//

import SwiftUI

struct AddRecipeSheetView: View {
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
    AddRecipeSheetView()
}
