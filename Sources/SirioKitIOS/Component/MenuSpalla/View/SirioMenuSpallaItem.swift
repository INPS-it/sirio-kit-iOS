//
// SirioMenuSpallaItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioMenuSpallaItemLevel: Int, CaseIterable {
    case first = 0
    case second = 1
    case third = 2
    case unknown
}

public struct SirioMenuSpallaItem: View {
    @ObservedObject private var item: SirioMenuSpallaItemData
    @Binding var selectedID: UUID
    @State var isSelected: Bool = false
    @State var isOpen: Bool = false
    
    public init(item: SirioMenuSpallaItemData, selectedID: Binding<UUID>) {
        self.item = item
        _selectedID = selectedID
    }
    
    public var body: some View {
        Button(action: {
            if !item.isDisabled {
                if (isSelected && isOpen) {
                    guard let parent = item.parent else {
                        self.selectedID = UUID()
                        return
                    }
                    selectedID = parent.id
                } else {
                    selectedID = item.id
                }
                item.onTapAction()
            }
        }, label: {
            
        })
        .disabled(item.isDisabled)
        .buttonStyle(SirioMenuSpallaItemStyle(item: item, isSelected: $isSelected))
        .accessibilityLabel(item.accessibilityLabel ?? item.value)
        .onChange(of: selectedID){ value in
            isSelected = item.hasChild(childId: value)
            isOpen = isSelected && item.hasSubItems
        }
        .animation(nil, value: false)
    }
}
