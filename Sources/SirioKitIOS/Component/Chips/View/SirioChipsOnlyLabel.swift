//
// SirioChipsOnlyLabel.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio chip with label
/// - Parameters:
///   - text: The string on the chip
///   - isDisabled: Whether the chip is isDisabled
///   - selectedType: Manages the activation of the chips
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioChipsOnlyLabel: View {
    private var text: String
    @Binding private var selectedType: String?
    @Binding private var isDisabled: Bool
    private var accessibilityLabel: String?

    public init(text: String,
                selectedType: Binding<String?>,
                isDisabled: Binding<Bool> = .constant(false),
                accessibilityLabel: String? = nil){
        self.text = text
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
            }
        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioChipsOnlyLabelStyle(text: self.text,
                                isActive: self.text == self.selectedType,
                                isDisabled: self.$isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct ChipsOnlyLabelTestView : View {
    @State private var selectedType: String? = "Type"

     var body: some View {
         SirioChipsOnlyLabel(text: "Chips", selectedType: $selectedType)
     }
}
#Preview {
    ChipsOnlyLabelTestView()
}
