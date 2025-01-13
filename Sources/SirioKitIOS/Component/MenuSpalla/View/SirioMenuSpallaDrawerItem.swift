//
// SirioMenuSpallaDrawerItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioMenuSpallaDrawerItem: View {
    private var title: String
    private var subtitle: String?
    private var onTapAction: (() -> Void)?
    private var accessibilityLabel: String?
    @Binding private var isOpen: Bool
    
    public init(title: String,
                subtitle: String? = nil,
                isOpen: Binding<Bool>,
                onTapAction: (() -> Void)? = nil,
                accessibilityLabel: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self._isOpen = isOpen
        self.onTapAction = onTapAction
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        
        Button(action: {
            withAnimation {
                self.isOpen.toggle()
            }
            onTapAction?()
        }, label: {
            // Inside style
        })
        .buttonStyle(SirioMenuSpallaDrawerItemStyle(title: title,
                                               subtitle: subtitle,
                                               isOpen: $isOpen))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

#Preview {
    SirioMenuSpallaDrawerItem(title: "Action Label", subtitle: "Placeholder Label", isOpen: .constant(false))
}
