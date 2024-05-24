//
// ExampleTab.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS
import SwiftUI

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
                SirioText(text: "Selected - Top", typography: .label_md_400)
                Tab(isSelected: true,
                    position: .top,
                    item: .init(icon: .check, text: "Label tab", isDisabled: false),
                    onSelectTab: nil)
                
                SirioText(text: "Default - Top", typography: .label_md_400)
                Tab(isSelected: false,
                    position: .top,
                    item: .init(icon: .check, text: "Label tab", isDisabled: false),
                    onSelectTab: nil)
                
                SirioText(text: "Disabled - Top", typography: .label_md_400)
                Tab(isSelected: false,
                    position: .top,
                    item: .init(icon: .check, text: "Label tab", isDisabled: true),
                    onSelectTab: nil)
            }
            
            
            // Bottom
            Group {
                SirioText(text: "Selected - Bottom", typography: .label_md_400)
                Tab(isSelected: true,
                    position: .bottom,
                    item: .init(icon: .check, text: "Label tab", isDisabled: false),
                    onSelectTab: nil)
                
                SirioText(text: "Default - Bottom", typography: .label_md_400)
                Tab(isSelected: false,
                    position: .bottom,
                    item: .init(icon: .check, text: "Label tab", isDisabled: false),
                    onSelectTab: nil)
                
                SirioText(text: "Disabled - Bottom", typography: .label_md_400)
                Tab(isSelected: false,
                    position: .bottom,
                    item: .init(icon: .check, text: "Label tab", isDisabled: true),
                    onSelectTab: nil)
            }
            
            Spacer()
        }.padding()
    }
}



// Tab Group
struct ExampleTabGroup: View {
    @State var selectedIndex1 = 0
    @State var selectedIndex2 = 0
    
    private var items: [TabData] = [
        .init(icon: .check, text: "Label tab 0"),
        .init(icon: .file, text: "Label tab  1"),
        .init(icon: .globeAfrica, text: "Label tab  2"),
        .init(icon: .lightbulb, text: "Label tab  3"),
        .init(icon: .piggyBank, text: "Label tab  4")
    ]
    
    var body: some View {
        VStack {
            SirioText(text: "Top", typography: .label_md_400)
            TabGroup(items: items, selectedIndex: $selectedIndex1, position: .top, onSelectedTab: nil)
            
            Spacer()
                .frame(height: 60)
            
            SirioText(text: "Bottom", typography: .label_md_400)
            TabGroup(items: items, selectedIndex: $selectedIndex2, position: .bottom, onSelectedTab: nil)
            
            Spacer()
        }
        
    }
}
