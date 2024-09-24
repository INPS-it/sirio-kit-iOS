//
// SirioTab.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// SirioTab selection indicator position
public enum Position: String, CaseIterable {
    case top, bottom
}

/// Single tab to be used in [SirioTabGroup]
/// - Parameters:
///   - isSelected: Whether the tab is the selected one
///   - position: The position of the selection indicator
///   - item: The SirioTab item data
///   - onSelectTab: Callback that is executed when the tab is selected
public struct SirioTab: View {
    var isSelected: Bool
    var position: Position
    var item: SirioTabData
    var onSelectTab: (() -> Void)?
    
    public init(isSelected: Bool,
                position: Position,
                item: SirioTabData,
                onSelectTab: (() -> Void)?){
        self.isSelected = isSelected
        self.position = position
        self.item = item
        self.onSelectTab = onSelectTab
    }
    
    public var body: some View {
        Button(action: {
            self.onSelectTab?()
        }, label: {
            // Inside style
        }).buttonStyle(TabStyle(isSelected: isSelected,
                                position: position,
                                item: item))
        .setAccessibilityLabel(item.accessibilityLabel)
    }
}

#Preview {
    VStack(spacing: 20) {
        SirioTab(isSelected: true, position: .top, item: .previewInps()[0],
            onSelectTab: nil)
        
        SirioTab(isSelected: false, position: .top, item: .previewInps()[1],
            onSelectTab: nil)
        
        SirioTab(isSelected: false, position: .top, item: .previewInps()[2],
            onSelectTab: nil)
        
        SirioTab(isSelected: true, position: .bottom, item: .previewInps()[0], onSelectTab: nil)
        
        SirioTab(isSelected: false, position: .bottom, item: .previewInps()[1], onSelectTab: nil)
        
        SirioTab(isSelected: false, position: .bottom, item: .previewInps()[2], onSelectTab: nil)
    }
}
