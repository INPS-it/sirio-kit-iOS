//
// SirioTabGroup.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
public struct SirioTabGroup: View {
    
    private var items: [SirioTabData]
    @Binding private var selectedIndex: Int
    private var position: Position
    private var onSelectedTab: ((Int) -> Void)?
    
    public init(items: [SirioTabData],
                selectedIndex: Binding<Int>,
                position: Position,
                onSelectedTab: ((Int) -> Void)?) {
        self.items = items
        self._selectedIndex = selectedIndex
        self.position = position
        self.onSelectedTab = onSelectedTab
    }
    
    public var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: position == .top ? Size.Tab.spacingHorizontalGroupTop : Size.Tab.spacingHorizontalGroupBottom) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]
                        let isSelected = selectedIndex == index
                        SirioTab(isSelected: isSelected,
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
            .onChange(of: selectedIndex) { newIndex in
                withAnimation {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
    }
}

struct ExampleTabGroup: View {
    @State var selectedIndex = 0
    
    var body: some View {
        SirioTabGroup(items: SirioTabData.previewInps(),
                 selectedIndex: $selectedIndex,
                 position: .bottom,
                 onSelectedTab: nil)
    }
}

#Preview {
    ExampleTabGroup()
}
