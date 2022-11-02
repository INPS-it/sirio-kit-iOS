//
// TabBar.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Tab bar component
/// - Parameters:
///   - items: The items [TabItemData] to be shown. Min 3 - Max 5
///   - selectedIndex: An int to manage the selected tab
public struct TabBar: View {
    private var items: [TabItemData]
    @Binding private var selectedIndex: Int
    
    public init(items: [TabItemData], selectedIndex: Binding<Int>) {
        self.items = items
        self._selectedIndex = selectedIndex
        
        precondition(self.items.count <= 3 || self.items.count >= 5, "Enter from a minimum of 3 tabs to a maximum of 5")
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
                    TabBarItem(itemData: item, isSelected: isSelected)
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

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarTest()
    }
}

struct TabBarTest: View {
    @State var selectedIndex = 0
    
    public var body: some View {
        TabBar(items: TabItemData.previewInps3(),
               selectedIndex: $selectedIndex)
    }
}

// This style doesn't highlight the buttons
struct StaticButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
