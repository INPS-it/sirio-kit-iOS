//
// ExampleAvviso.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleAvviso: View {

    var body: some View {
        VStack {
            ScrollView {
                SirioAvviso(title: "Titolo avviso", text: .loremIpsum, textButton: "Text", onTapButtonAction: {
                    
                })
                
                SirioAvviso(schemeColor: .light, title: "Titolo avviso", text: .loremIpsum, textButton: "Text", onTapButtonAction: {
                    
                })
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("Avviso")
    }
}

#Preview {
    ExampleAvviso()
}
