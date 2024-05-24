//
// ExampleHero.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleHero: View {
    var url = URL(string: "https://www.inps.it/content/dam/inps-site/immagini/lavoro/INPS_congedi_EX%2001.svg")!
    
    var body: some View {
        ScrollView {
            SirioHero(title: "Titolo Hero", subtitle: "Sottotitolo", text: .loremIpsum, textButton: "Text", url: url)
                .padding(.vertical)
        }
        .background(Color.colorBackground)
        .navigationTitle("Hero")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleHero()
}
