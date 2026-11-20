//
// ExampleTabBar.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTabBar: View {
    @State private var selectedIndex: Int = 0
    
    private let items = [
        SirioTabItemData(icon: .home, name: "Home", hasBadge: false),
        SirioTabItemData(icon: .newspaper, name: "Notizie", hasBadge: true),
        SirioTabItemData(icon: .gripHorizontal, name: "Servizi", hasBadge: false, isHighlighted: true),
        SirioTabItemData(icon: .commentAlt, name: "Contatti", hasBadge: false),
        SirioTabItemData(icon: .list, name: "Opzioni", hasBadge: false),
    ]
    
    var body: some View {
        VStack(spacing: 2) {
            ZStack {
                Color.colorBackground
                Spacer()
                switch selectedIndex {
                case 0:
                    SirioText(text: "Home", typography: .label_md_400)
                case 1:
                    SirioText(text: "Notizie", typography: .label_md_400)
                case 2:
                    SirioText(text: "Servizi", typography: .label_md_400)
                case 3:
                    SirioText(text: "Contatti", typography: .label_md_400)
                case 4:
                    SirioText(text: "Opzioni", typography: .label_md_400)
                default:
                    EmptyView()
                }
                Spacer()
            }
            SirioTabBar(items: items, selectedIndex: $selectedIndex)
                .navigationBarTitle("Tab Bar", displayMode: .automatic)
        }
        .background(Color.colorBackground)
        .navigationTitle("Tab Bar")
    }
}

#Preview {
    ExampleTabBar()
}
