//
// ExampleMenuSpalla.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleMenuSpalla: View {
    @State var id = UUID()
    
    var items: [SirioMenuSpallaItemData] = [
        SirioMenuSpallaItemData(value: "Label 1 ", children: [
            SirioMenuSpallaItemData(value: "Label 1.1", children: [
                SirioMenuSpallaItemData(value: "Label 1.1.1"),
                SirioMenuSpallaItemData(value: "Label 1.1.2"),
            ]),
            SirioMenuSpallaItemData(value: "Label 1.2", children: [
                SirioMenuSpallaItemData(value: "Label 1.2.1"),
                
            ])
        ]),
        SirioMenuSpallaItemData(value: "Label 2", children: [
            SirioMenuSpallaItemData(value: "Label 2.1", children: [
                SirioMenuSpallaItemData(value: "Label 2.1.1"),
                SirioMenuSpallaItemData(value: "Label 2.1.2"),
            ]),
            SirioMenuSpallaItemData(value: "Label 2.2", children: [
                SirioMenuSpallaItemData(value: "Label 2.2.1"),
                SirioMenuSpallaItemData(value: "Label 2.2.2"),
            ]),
        ])
    ]
    
    var body: some View {
        List {
            NavigationLink(destination: {
                SirioMenuSpallaItemTitleSection(title: "Label menu")
                    .navigationTitle("Intestazione")
            }, label: {
                SirioText(text: "Intestazione", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                VStack {
                    Spacer()
                    SirioMenuSpalla(titleDrawer: .constant("Title"), subtitle: .constant("Subtitle"), sections: [
                        .init(titleSection: "Sezione", items: items)])
                }
                .background(Color.colorBackground)
                .navigationTitle("Menu Spalla")
                .listStyle(GroupedListStyle())
            }, label: {
                SirioText(text: "Menu Spalla", typography: .label_md_400)
            })
            
        }
        .background(Color.colorBackground)
        .navigationTitle("Menu Spalla")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleMenuSpalla()
}

