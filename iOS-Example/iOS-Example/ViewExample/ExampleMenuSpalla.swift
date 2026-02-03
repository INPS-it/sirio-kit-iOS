//
// ExampleMenuSpalla.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleMenuSpalla: View {
    @Binding var path: NavigationPath
    @State private var id = UUID()
    
    var items: [SirioMenuSpallaItemData] = [
        SirioMenuSpallaItemData(value: "Label 1", children: [
            SirioMenuSpallaItemData(value: "Label 1.1", children: [
                SirioMenuSpallaItemData(value: "Label 1.1.1"),
                SirioMenuSpallaItemData(value: "Label 1.1.2")
            ]),
            SirioMenuSpallaItemData(value: "Label 1.2", children: [
                SirioMenuSpallaItemData(value: "Label 1.2.1")
            ])
        ]),
        SirioMenuSpallaItemData(value: "Label 2", children: [
            SirioMenuSpallaItemData(value: "Label 2.1", children: [
                SirioMenuSpallaItemData(value: "Label 2.1.1"),
                SirioMenuSpallaItemData(value: "Label 2.1.2")
            ]),
            SirioMenuSpallaItemData(value: "Label 2.2", children: [
                SirioMenuSpallaItemData(value: "Label 2.2.1"),
                SirioMenuSpallaItemData(value: "Label 2.2.2")
            ])
        ])
    ]
    
    var body: some View {
        SirioListItems(items: listItems)
            .navigationTitle("Menu Spalla")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleMenuSpalla {
    
    enum Destination: Hashable {
        case intestazione
        case menuSpalla
    }
    
    var listItems: [SirioListItemModel] {
        [
            .default(title: "Intestazione", action: { path.append(Destination.intestazione) }),
            .default(title: "Menu Spalla", action: { path.append(Destination.menuSpalla) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .intestazione:
            SirioMenuSpallaItemTitleSection(title: "Label menu")
                .navigationTitle("Intestazione")
                .background(Color.colorBackground)
            
        case .menuSpalla:
            VStack {
                Spacer()
                SirioMenuSpalla(
                    titleDrawer: .constant("Title"),
                    subtitle: .constant("Subtitle"),
                    sections: [
                        .init(titleSection: "Sezione", items: items)
                    ]
                )
            }
            .background(Color.colorBackground)
            .navigationTitle("Menu Spalla")
        }
    }
}

#Preview {
    ExampleMenuSpalla(path: .constant(NavigationPath()))
}
