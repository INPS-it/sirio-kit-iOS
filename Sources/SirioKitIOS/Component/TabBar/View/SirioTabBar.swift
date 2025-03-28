//
// SirioTabBar.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// SirioTabBar component for managing tab selection and display
/// - Parameters:
///   - items: An array of [SirioTabItemData] representing the tabs. Must contain at least 3 and no more than 5 items.
///   - selectedIndex: A binding to the currently selected tab index
///   
public struct SirioTabBar: View {
    private var items: [SirioTabItemData]
    @Binding private var selectedIndex: Int
    
    public init(items: [SirioTabItemData], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
        
        precondition(self.items.count >= 3 || self.items.count <= 5, "Enter from a minimum of 3 tabs to a maximum of 5")
    }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            Spacer()
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                Button(action: {
                    self.selectedIndex = index
                }, label: {
                    let isSelected = selectedIndex == index
                    SirioTabBarItem(itemData: item, isSelected: isSelected)
                        .environmentObject(OrientationInfo())
                })
                .buttonStyle(StaticButtonStyle())
            }
            Spacer()
        }
        .frame(height: Size.TabBar.height)
        .background(Color.TabBar.background)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarTest: View {
    @State var selectedIndex = 0
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            Text("Contenuto principale")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
                .ignoresSafeArea()
            
            SirioTabBar(items: SirioTabItemData.previewInps3(),
                        selectedIndex: $selectedIndex)
        }
    }
}

// This style doesn't highlight the buttons
struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

#Preview {
    TabBarTest()
}
