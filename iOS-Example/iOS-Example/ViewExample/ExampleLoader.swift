//
// ExampleLoader.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleLoader: View {
    @State var isLoading: Bool = true

    var body: some View {
        VStack {
            SirioGenericTextField(
                type: .constant(.info),
                textInfo: "Label",
                placeholder: "Text",
                value: .constant(""),
                popoverTitle: "Titolo Popover",
                popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga"
            )
            .padding()
            
            SirioGenericTextField(
                type: .constant(.info),
                textInfo: "Label",
                placeholder: "Text",
                value: .constant(""),
                popoverTitle: "Titolo Popover",
                popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga"
            )
            .padding()
            
            SirioGenericTextField(
                type: .constant(.info),
                textInfo: "Label",
                placeholder: "Text",
                value: .constant(""),
                popoverTitle: "Titolo Popover",
                popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga"
            )
            .padding()
            
            Spacer()
        }
        .background(Color.colorBackground)
        .navigationTitle("Loader")
        .withSirioLoader(isLoading: $isLoading)
    }
}

#Preview {
    ExampleLoader()
}
