//
// SirioChipsLabelIcon.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio chip with icon and label
/// - Parameters:
///   - text: The string on the chip
///   - icon: The icon at the start of the chip
///   - isDisabled: Whether the chip is isDisabled
///   - selectedType: Manages the activation of the chips
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioChipsLabelIcon: View {
    private var text: String
    private var icon: AwesomeIcon
    @Binding private var selectedType: String?
    @Binding private var isDisabled: Bool
    private var accessibilityLabel: String?

    public init(text: String,
                icon: AwesomeIcon,
                selectedType: Binding<String?>,
                isDisabled: Binding<Bool> = .constant(false),
                accessibilityLabel: String? = nil){
        self.text = text
        self.icon = icon
        self._selectedType = selectedType
        self._isDisabled = isDisabled
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        Button(action: {
            if selectedType == text {
                selectedType = nil
            } else {
                self.selectedType = text
            }        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioChipsLabelIconStyle(text: self.text,
                                         icon: self.icon,
                                         isActive: self.text == self.selectedType,
                                         isDisabled: self.$isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
}


struct ChipsLabelIconTestView : View {
    @State private var selectedType: String? = "Type"
    
    var body: some View {
        SirioChipsLabelIcon(text: "Chips", icon: .check, selectedType: $selectedType)
    }
}
#Preview {
    ChipsLabelIconTestView()
}
