//
// SirioDropdownMenu.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioDropdownMenu: View {
    let items: [SirioActionItem]
    @Binding var isOpen: Bool
    
    let nVisibleItems: Int = 3
    
    public init(items: [SirioActionItem], isOpen: Binding<Bool>) {
        self.items = items
        self._isOpen = isOpen
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: Size.s0) {
                ForEach(items) { item in
                    Button(action: {
                        item.action?()
                        isOpen = false
                    }) {
                        HStack {
                            Text(item.value)
                                .padding()
                            Spacer()
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(SirioDropdownStyle(text: item.value))
                }
            }
        }
        .frame(width: Size.DropdownMenu.width, height: height)
        .background(Color.aliasBackgroundColorPrimaryLight0)
        .overlay(
            RoundedRectangle(cornerRadius: Size.DropdownMenu.cornerRadius)
                .stroke(Color.aliasBackgroundColorSecondaryDark110, lineWidth: 1)
                .allowsHitTesting(false)
        )
        .cornerRadius(Size.DropdownMenu.cornerRadius)
    }
    
    var height: CGFloat {
        CGFloat(min(items.count, nVisibleItems) * Int(Size.DropdownMenu.singleItemHeight))
    }
}



#Preview {
    SirioDropdownMenu(items: [
        .init(value: "Item #1", action: {}),
        .init(value: "Item #2", action: {}),
        .init(value: "Item #3", action: {}),
        .init(value: "Item #4", action: {}),
        .init(value: "Item #5", action: {}),
    ], isOpen: .constant(true))
    .padding()
}


