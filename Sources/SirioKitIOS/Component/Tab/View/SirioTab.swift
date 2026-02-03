//
// SirioTab.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Single tab to be used in [SirioTabGroup]
/// - Parameters:
///   - isSelected: Whether the tab is the selected one.
///   - position: The position of the selection indicator (top or bottom).
///   - item: The SirioTab item data.
///   - onSelectTab: A callback that is executed when the tab is selected.
///   
public struct SirioTab: View {
    var isSelected: Bool
    var item: SirioTabData
    var onSelectTab: (() -> Void)?
    
    public init(isSelected: Bool,
                item: SirioTabData,
                onSelectTab: (() -> Void)?){
        self.isSelected = isSelected
        self.item = item
        self.onSelectTab = onSelectTab
    }
    
    public var body: some View {
        Button(action: {
            self.onSelectTab?()
        }, label: {
            // Inside style
        }).buttonStyle(TabStyle(isSelected: isSelected,
                                item: item))
        .setAccessibilityLabel(item.accessibilityLabel)
        .disabled(item.isDisabled)
    }
}

#Preview {
    VStack(spacing: 20) {
        SirioTab(isSelected: true, item: .previewInps()[0],
            onSelectTab: nil)
        
        SirioTab(isSelected: false, item: .previewInps()[1],
            onSelectTab: nil)
        
        SirioTab(isSelected: false, item: .previewInps()[2],
            onSelectTab: nil)
    }
    .padding()
}
