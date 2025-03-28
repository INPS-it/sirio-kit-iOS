//
// SirioMenuSpallaExpandleItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI

public struct SirioMenuSpallaExpandleItem: View, Identifiable {
    public var id = UUID()
    var item: SirioMenuSpallaItemData
    @Binding var selectedID: UUID
    
    public init(item: SirioMenuSpallaItemData, selectedID: Binding<UUID>) {
        self.item = item
        self._selectedID = selectedID
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            SirioMenuSpallaItem(item: item, selectedID: $selectedID)
            if item.hasSubItems && item.hasChild(childId: selectedID){
                ForEach(item.children) { child in
                    SirioMenuSpallaExpandleItem(item: child, selectedID: $selectedID)
                }
            }
        }
        .animation(nil, value: false)
    }
}
