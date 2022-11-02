//
// TabGroup.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Tab group component
/// - Parameters:
///   - items: List of tab data
///   - selectedIndex: The current selected index
///   - position:  The position of the selection indicator
///   - onSelectedTab: Callback that is executed when the tab is selected
public struct TabGroup: View {
    
    private var items: [TabData]
    @Binding private var selectedIndex: Int
    private var position: Position
    private var onSelectedTab: ((Int) -> Void)?
    
    public init(items: [TabData],
                selectedIndex: Binding<Int>,
                position: Position,
                onSelectedTab: ((Int) -> Void)?) {
        self.items = items
        self._selectedIndex = selectedIndex
        self.position = position
        self.onSelectedTab = onSelectedTab
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: position == .top ? Size.Tab.spacingHorizontalGroupTop : Size.Tab.spacingHorizontalGroupBottom) {
                ForEach(items.indices, id: \.self) { index in
                    let item = items[index]
                    let isSelected = selectedIndex == index
                    Tab(isSelected: isSelected,
                        position: position,
                        item: item,
                        onSelectTab: {
                        withAnimation {
                            self.selectedIndex = index
                        }
                        onSelectedTab?(index)
                    })
                }
            }
        })
    }
}

struct ExampleTabGroup: View {
    @State var selectedIndex = 0
    
    var body: some View {
        TabGroup(items: TabData.previewInps(),
                 selectedIndex: $selectedIndex,
                 position: .bottom,
                 onSelectedTab: nil)
    }
}

struct TabGroup_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTabGroup()
    }
}

