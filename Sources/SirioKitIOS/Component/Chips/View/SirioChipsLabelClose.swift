//
// SirioChipsLabelClose.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio chip with label and close button
/// - Parameters:
///   - text: The string on the chip
///   - isDisabled: Whether the chip is isDisabled
///   - onTapChips: Callback that is executed when the chips is tapped
///   - onTapClose: Callback that is executed when the close button is tapped
///   - accessibilityLabelText: A string that identifies the text accessibility element
///   - accessibilityLabelClose: A string that identifies the close button accessibility element

public struct SirioChipsLabelClose: View {
    private var text: String
    @Binding private var isDisabled: Bool
    private var onTapChips: (() -> Void)?
    private var onTapClose: (() -> Void)?
    private var accessibilityLabelText: String?
    private var accessibilityLabelClose: String?
    
    public init(text: String,
                isDisabled: Binding<Bool> = .constant(false),
                onTapChips: (() -> Void)? = nil,
                onTapClose: (() -> Void)? = nil,
                accessibilityLabelText: String? = nil,
                accessibilityLabelClose: String? = nil){
        self.text = text
        self._isDisabled = isDisabled
        self.onTapChips = onTapChips
        self.onTapClose = onTapClose
        self.accessibilityLabelText = accessibilityLabelText
        self.accessibilityLabelClose = accessibilityLabelClose
    }
    
    public var body: some View {
        Button(action: {
            self.onTapChips?()
        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioChipsLabelCloseStyle(text: self.text,
                                          isDisabled: self.$isDisabled,
                                          onTapClose: self.onTapClose,
                                          accessibilityLabelText: accessibilityLabelText,
                                          accessibilityLabelClose: accessibilityLabelClose))
    }
}

#Preview {
    SirioChipsLabelClose(text: "Chips")
}
