//
// ExampleTab.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTab: View {
    var body: some View {
        List {
            // Tab
            NavigationLink(destination: {
                ExampleTabSingle()
                    .navigationTitle("Tab Single")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Tab Single", typography: .label_md_400)
            })
            
            // Tab Group
            NavigationLink(destination: {
                ExampleTabGroup()
                    .navigationTitle("Tab Group")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Tab Group", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Tab")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleTab()
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
