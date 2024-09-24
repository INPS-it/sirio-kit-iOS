//
// SirioTabBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// SirioTab bar component
/// - Parameters:
///   - items: The items [SirioTabItemData] to be shown. Min 3 - Max 5
///   - selectedIndex: An int to manage the selected tab
public struct SirioTabBar: View {
    private var items: [SirioTabItemData]
    @Binding private var selectedIndex: Int
    
    public init(items: [SirioTabItemData], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
        
        precondition(self.items.count >= 3 || self.items.count <= 5, "Enter from a minimum of 3 tabs to a maximum of 5")
    }
    
    public var body: some View {
        HStack {
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
                Spacer()
            }
        }
        .frame(height: Size.TabBar.height)
        .background(Color.TabBar.background)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarTest: View {
    @State var selectedIndex = 0
    
    public var body: some View {
        SirioTabBar(items: SirioTabItemData.previewInps3(),
               selectedIndex: $selectedIndex)
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
