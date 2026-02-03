//
// ExampleTab.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTab: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Tab")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleTab {
    
    enum Destination: Hashable {
        case tabSingle
        case tabGroup
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Tab Single", action: { path.append(Destination.tabSingle) }),
            .default(title: "Tab Group", action: { path.append(Destination.tabGroup) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .tabSingle:
            ExampleTabSingle()
                .navigationTitle("Tab Single")
                .background(Color.colorBackground)
            
        case .tabGroup:
            ExampleTabGroup()
                .navigationTitle("Tab Group")
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleTab(path: .constant(NavigationPath()))
}

// Tab Single
struct ExampleTabSingle: View {
    var body: some View {
        VStack(spacing: 20) {
            // Top
            Group {
                SirioText(text: "Selected", typography: .label_md_400)
                SirioTab(isSelected: true,
                    item: .init(icon: .check, text: "Label tab", isDisabled: false),
                    onSelectTab: nil)
                
                SirioText(text: "Default", typography: .label_md_400)
                SirioTab(isSelected: false,
                    item: .init(icon: .check, text: "Label tab", isDisabled: false),
                    onSelectTab: nil)
                
                SirioText(text: "Disabled", typography: .label_md_400)
                SirioTab(isSelected: false,
                    item: .init(icon: .check, text: "Label tab", isDisabled: true),
                    onSelectTab: nil)
            }
            
            Spacer()
        }.padding()
    }
}



// Tab Group
struct ExampleTabGroup: View {
    @State var selectedIndex = 0
    
    private var items: [SirioTabData] = [
        .init(icon: .check, text: "Label tab 0"),
        .init(icon: .file, text: "Label tab  1"),
        .init(icon: .globeAfrica, text: "Label tab  2"),
        .init(icon: .lightbulb, text: "Label tab  3"),
        .init(icon: .piggyBank, text: "Label tab  4")
    ]
    
    var body: some View {
        VStack {
            SirioTabGroup(items: items, selectedIndex: $selectedIndex, onSelectedTab: nil)
            
            Spacer()
        }
        
    }
}
