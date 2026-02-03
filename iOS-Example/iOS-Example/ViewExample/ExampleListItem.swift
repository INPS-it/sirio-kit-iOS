//
// ExampleListItem.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleListItem: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("List Item")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleListItem {
    
    enum Destination: Hashable {
        case defaultt
        case icon
        case info
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Default", action: { path.append(Destination.defaultt) }),
            .default(title: "Icon", action: { path.append(Destination.icon) }),
            .default(title: "Info", action: { path.append(Destination.info) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .defaultt:
            SirioListItems(items: [
                .init(title: "Titolo List Item 1"),
                .init(title: "Titolo List Item 2"),
                .init(title: "Titolo List Item 3"),
            ])
                .navigationTitle("List Item Default")
                .background(Color.colorBackground)
        case .icon:
            SirioListItems(items: [
                .init(type: .icon,title: "Titolo List Item 1", leadingIconData: .init(icon: .cube)),
                .init(type: .icon,title: "Titolo List Item 2", leadingIconData: .init(icon: .cube)),
                .init(type: .icon,title: "Titolo List Item 3", leadingIconData: .init(icon: .cube)),
            ])
            .navigationTitle("List Item Icon")
            .background(Color.colorBackground)
        case .info:
            SirioListItems(items: [
                .info(title: "Titolo list item 1",
                      subtitle: "Lorem ipsum dolor sit amet consectetur. Purus suscipit aliquam habitant",
                      action: {
                          print("Info item tapped")
                      },
                      titleDialog: "Titolo",
                      subtitleDialog: .loremIpsum),
                .info(title: "Titolo list item 2",
                      subtitle: "Lorem ipsum dolor sit amet",
                      action: {
                          print("Info item tapped")
                      },
                      titleDialog: "Titolo",
                      subtitleDialog: .loremIpsum),
                .info(title: "Titolo list item 3",
                      subtitle: "Lorem ipsum dolor sit amet",
                      action: {
                          print("Info item tapped")
                      },
                      titleDialog: "Titolo",
                      subtitleDialog: .loremIpsum),
            ])
            .navigationTitle("List Item Info")
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleListItem(path: .constant(NavigationPath()))
}
