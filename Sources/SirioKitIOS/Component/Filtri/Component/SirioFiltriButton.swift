//
// SirioFiltriButton.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI

public struct SirioFiltriButton: View {
    
    var clearText: String
    var onClearAction: () -> Void
    var applyText: String
    var onApplyAction: () -> Void
    
    public init(clearText: String = "Elimina filtri",
                onClearAction: @escaping () -> Void,
                applyText: String = "Applica filtri",
                onApplyAction: @escaping () -> Void) {
        self.clearText = clearText
        self.onClearAction = onClearAction
        self.applyText = applyText
        self.onApplyAction = onApplyAction
    }
    
    public var body: some View {
        HStack(spacing: Size.s16) {
            SirioButton(hierarchy: .secondary,
                        size: .large,
                        text: clearText,
                        iconData: nil,
                        isFullSize: true,
                        action: {
                onClearAction()
            }, accessibilityLabel: clearText)
                        
            SirioButton(hierarchy: .primary,
                        size: .large,
                        text: applyText,
                        iconData: nil,
                        isFullSize: true,
                        action: {
                onApplyAction()
            }, accessibilityLabel: applyText)
        }
        .padding(Size.p16)
        .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}

#Preview {
    SirioFiltriButton(onClearAction: {}, onApplyAction: {})
}
