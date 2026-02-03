//
// ExampleDropdownMenu.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleDropdownMenu: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Dropdown Menu")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleDropdownMenu {
    
    enum Destination: Hashable {
        case dropdownMenu
        case playground1
        case playground2
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Dropdown Menu", action: { path.append(Destination.dropdownMenu) }),
            .default(title: "Playground 1", action: { path.append(Destination.playground1) }),
            .default(title: "Playground 2", action: { path.append(Destination.playground2) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .dropdownMenu:
            SirioDropdownMenu(
                items: [
                    .init(value: "Action #1", action: {}),
                    .init(value: "Action #2", action: {}),
                    .init(value: "Action #3", action: {})
                ],
                isOpen: .constant(true)
            )
            .navigationTitle("Dropdown Menu")
            .background(Color.colorBackground)
            
        case .playground1:
            ExampleDropdownMenuPlayground1()
                .navigationTitle("Dropdown Menu - Playground 1")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.colorBackground)
            
        case .playground2:
            ExampleDropdownMenuPlayground1(text: "Label")
                .navigationTitle("Dropdown Menu - Playground 2")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleDropdownMenu(path: .constant(NavigationPath()))
}

struct ExampleDropdownMenuPlayground1: View {
    var text: String?
    @State var isOpen1: Bool = false
    @State var isOpen2: Bool = false
    @State var isOpen3: Bool = false
    @State var isOpen4: Bool = false
    
    init(text: String? = nil){
        self.text = text
    }
    
    var body: some View {
        VStack {
            
            HStack(spacing: 20){
                SirioMoreAction(hierarchy: .primary, text: text, items: [
                    .init(value: "Item #1", action: {}),
                    .init(value: "Item #2", action: {}),
                    .init(value: "Item #3", action: {}),
                    .init(value: "Item #4", action: {}),
                    .init(value: "Item #5", action: {}),
                ], positionToOpen: .topLeft, isOpen: $isOpen1)
                
                SirioMoreAction(hierarchy: .primary, text: text, items: [
                    .init(value: "Item #1", action: {}),
                    .init(value: "Item #2", action: {}),
                    .init(value: "Item #3", action: {}),
                    .init(value: "Item #4", action: {}),
                    .init(value: "Item #5", action: {}),
                ], positionToOpen: .topRight, isOpen: $isOpen2)
            }
            
            Spacer().frame(height: 20)
            
            HStack(spacing: 20){
                SirioMoreAction(hierarchy: .primary, text: text, items: [
                    .init(value: "Item #1", action: {}),
                    .init(value: "Item #2", action: {}),
                    .init(value: "Item #3", action: {}),
                    .init(value: "Item #4", action: {}),
                    .init(value: "Item #5", action: {}),
                ], positionToOpen: .bottomLeft, isOpen: $isOpen3)
                                
                SirioMoreAction(hierarchy: .primary, text: text, items: [
                    .init(value: "Item #1", action: {}),
                    .init(value: "Item #2", action: {}),
                    .init(value: "Item #3", action: {}),
                    .init(value: "Item #4", action: {}),
                    .init(value: "Item #5", action: {}),
                ], positionToOpen: .bottomRight, isOpen: $isOpen4)
            }
        }
        .padding()
    }
}
