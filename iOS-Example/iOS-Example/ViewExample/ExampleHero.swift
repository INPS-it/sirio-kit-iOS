//
// ExampleHero.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleHero: View {
    
    var body: some View {
        ScrollView {
            SirioHero(
                title: "Titolo",
                subtitle: "Sottotitolo",
                link: "Link",
                onTapLinkAction: {
                    print("Tap sul link della Hero")
                },
                //url: URL(string: "https://www.inps.it/content/dam/inps-site/immagini/INPS-home.svg")
                // oppure:
                imageName: "hero",
                // oppure:
                // base64: "..."
                bundle: .main
            )
        }
        .background(Color.colorBackground)
        .navigationTitle("Hero")
    }
}

#Preview {
    ExampleHero()
}
