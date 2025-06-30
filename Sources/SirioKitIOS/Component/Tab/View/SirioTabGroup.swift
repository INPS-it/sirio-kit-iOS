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
///   - items: A list of tab data to be displayed in the tab group.
///   - selectedIndex: The current selected index to determine which tab is selected.
///   - position: The position of the selection indicator (top or bottom).
///   - onSelectedTab: A callback that is executed when a tab is selected, passing the selected index.

public struct SirioTabGroup: View {
    
    private var items: [SirioTabData]
    @Binding private var selectedIndex: Int
    private var onSelectedTab: ((Int) -> Void)?
    
    public init(items: [SirioTabData],
                selectedIndex: Binding<Int>,
                onSelectedTab: ((Int) -> Void)?) {
        self.items = items
        self._selectedIndex = selectedIndex
        self.onSelectedTab = onSelectedTab
    }
    
    public var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false, content: {
                VStack(spacing: Size.s0) {
                    HStack(spacing: Size.s8) {
                        ForEach(items.indices, id: \.self) { index in
                            let item = items[index]
                            let isSelected = selectedIndex == index
                            SirioTab(isSelected: isSelected,
                                     item: item,
                                     onSelectTab: {
                                withAnimation {
                                    self.selectedIndex = index
                                }
                                onSelectedTab?(index)
                            })
                        }
                    }
                    .padding(.horizontal, Size.p16)
                    Rectangle()
                        .frame(height: Size.Tab.lineHeight)
                        .foregroundStyle(Color.Tab.Line.default)
                }
                .padding(.top, Size.p8)
                .padding(.bottom, Size.p16)

            })
            .onChange(of: selectedIndex) { newIndex in
                withAnimation {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
        .background(Color.Tab.Background.default)
    }
}

struct ExampleTabGroup: View {
    @State var selectedIndex = 0
    
    var body: some View {
        SirioTabGroup(items: SirioTabData.previewInps(),
                 selectedIndex: $selectedIndex,
                onSelectedTab: nil)
    }
}

#Preview {
    ExampleTabGroup()
}
