//
// ExampleAvviso.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleAvviso: View {
    
    var body: some View {
        ScrollView {
            SirioAvviso(title: "Titolo avviso", text: .loremIpsum2)
                .padding()
            
            SirioAvviso(title: "Titolo avviso", text: .loremIpsum2, link: "Link opzionale")
                .padding()
        }
        .background(Color.colorBackground)
        .navigationTitle("Avviso")
    }
}

#Preview {
    ExampleAvviso()
}
