//
// SirioTabGroup.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Tab group component
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
        GeometryReader { geometry in
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
                    .frame(minWidth: geometry.size.width)
                    
                })
                .onChange(of: selectedIndex) { newIndex in
                    withAnimation {
                        proxy.scrollTo(newIndex, anchor: .center)
                    }
                }
            }
            .background(Color.Tab.Background.default)
        }
        .frame(height: Size.Tab.height + Size.p8 + Size.p16 + Size.Tab.lineHeight)
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
