//
// ExampleTabBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTabBar: View {
    let items = [
                 TabItemData(icon: .home, name: "Home", hasBadge: false),
                 TabItemData(icon: .bell, name: "News", hasBadge: true),
                 TabItemData(icon: .globe, name: "Maps", hasBadge: false),
                 TabItemData(icon: .commentAlt, name: "Contacts", hasBadge: false),
                 TabItemData(icon: .gripHorizontal, name: "Services", hasBadge: false)]
    @State var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 2) {
            ZStack {
                Color.colorBackground
                Spacer()
                switch selectedIndex {
                case 0:
                    SirioText(text: "Home", typography: .label_md_400)
                case 1:
                    SirioText(text: "News", typography: .label_md_400)
                case 2:
                    SirioText(text: "Maps", typography: .label_md_400)
                case 3:
                    SirioText(text: "Contacts", typography: .label_md_400)
                case 4:
                    SirioText(text: "Services", typography: .label_md_400)
                default:
                    EmptyView()
                }
                Spacer()
            }
            
            TabBar(items: items, selectedIndex: $selectedIndex)
                .navigationBarTitle("Tab Bar", displayMode: .automatic)
        }
        
    }
}

#Preview {
    ExampleTabBar()
}

