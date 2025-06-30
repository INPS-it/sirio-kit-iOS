//
// ExampleDropdownMenu.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleDropdownMenu: View {

    var body: some View {
        List {
            NavigationLink(destination: {
                SirioDropdownMenu(items: [.init(value: "Action #1", action: {}),
                                          .init(value: "Action #2", action: {}),
                                          .init(value: "Action #3", action: {})], isOpen: .constant(true))
                .navigationTitle("Dropdown Menu")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dropdown Menu", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ExampleDropdownMenuPlayground1()
                .navigationTitle("Dropdown Menu - Playground 1")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Playground 1", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ExampleDropdownMenuPlayground1(text: "Label")
                    .navigationTitle("Dropdown Menu - Playground 2")
                    .navigationBarTitleDisplayMode(.inline)
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Playground 2", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Dropdown Menu")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleAvviso()
}

#Preview {
    ExampleDropdownMenuPlayground1()
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
