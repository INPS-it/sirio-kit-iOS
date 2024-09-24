//
// SirioFiltriTabs.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriTabs: View {

    private var items: [SirioTabData]
    @Binding private var selectedIndex: Int
    private var onSelectedTab: ((Int) -> Void)?
    private var withScroll: Bool
    var background: SirioFiltriBackground

    public init(items: [SirioTabData],
                selectedIndex: Binding<Int>,
                onSelectedTab: ((Int) -> Void)?,
                withScroll: Bool = true,
                background: SirioFiltriBackground = .default) {
        self.items = items
        self._selectedIndex = selectedIndex
        self.onSelectedTab = onSelectedTab
        self.withScroll = withScroll
        self.background = background
    }

    public var body: some View {
        HStack {
            if !withScroll {
                Button(action: {
                    if selectedIndex > 0 {
                        selectedIndex -= 1
                    }
                }, label: {
                    SirioIcon(data: .init(icon: .angleLeft))
                        .frame(width: 24, height: 24)
                })
                
            }
            
            SirioTabGroup(items: items, selectedIndex: $selectedIndex, position: .top, onSelectedTab: onSelectedTab)
                .background(Color.Filtri.Background.default)
            
            if !withScroll {
                Button(action: {
                    if selectedIndex < items.count - 1 {
                        selectedIndex += 1
                    }
                }, label: {
                    SirioIcon(data: .init(icon: .angleRight))
                        .frame(width: 24, height: 24)
                })
            }
        }
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

public struct TextSirioFiltriTabs: View {
    @State var index = 0
    
    public var body: some View {
        VStack {
            SirioFiltriTabs(items: [.init(icon: nil, text: "Label tab 1"),
                                    .init(icon: nil, text: "Label tab 2"),
                                    .init(icon: nil, text: "Label tab 3"),
                                    .init(icon: nil, text: "Label tab 4")],
                            selectedIndex: $index,
                            onSelectedTab: nil)
        }
    }
}

#Preview {
    TextSirioFiltriTabs()
}
