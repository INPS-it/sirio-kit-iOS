//
// SirioChipsSelection.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom view component that represents a selectable "chip" element, typically used in a list of options where users can select or deselect an item.
///
/// - Parameters:
///   - text: The main text content displayed within the chip.
///   - isSelected: A `Binding` boolean that reflects the current selection state of the chip. `true` indicates that the chip is selected, and `false` indicates it is not.
///   - isDisabled: A `Binding` boolean that determines whether the chip is interactive. When `true`, the chip becomes disabled and cannot be selected.
///   - onTapChips: An optional closure that is executed when the chip is tapped. It receives a boolean indicating the new selection state (`true` for selected, `false` for deselected).
///   - accessibilityLabel: An optional accessibility label for the chip, improving the accessibility of the component for screen readers.

public struct SirioChipsSelection: View {
    private var text: String
    @Binding var isSelected: Bool
    @Binding var isDisabled: Bool
    private var onTapChips: ((Bool) -> Void)?
    private var accessibilityLabel: String?
    
    public init(text: String,
                isSelected: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                onTapChips: ((Bool) -> Void)? = nil,
                accessibilityLabel: String? = nil) {
        self.text = text
        self._isSelected = isSelected
        self._isDisabled = isDisabled
        self.onTapChips = onTapChips
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        Button(action: {
            if isDisabled { return }
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.2)) {
                self.isSelected.toggle()
            }
            self.onTapChips?(isSelected)
        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioChipsSelectionStyle(text: self.text,
                                              isSelected: $isSelected,
                                              isDisabled: $isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct SirioChipsSelectionExample: View {
    @State var isSelected1: Bool = true
    @State var isSelected2: Bool = true
    @State var isSelected3: Bool = false
    @State var isSelected4: Bool = false
    
    var body: some View {
        VStack {
            SirioChipsSelection(text: "Chips",
                                isSelected: $isSelected1,
                                isDisabled: .constant(false),
                                onTapChips: nil)
            
            SirioChipsSelection(text: "Chips",
                                isSelected: $isSelected2,
                                isDisabled: .constant(true),
                                onTapChips: nil)
            SirioChipsSelection(text: "Chips",
                                isSelected: $isSelected3,
                                isDisabled: .constant(false),
                                onTapChips: nil)
            SirioChipsSelection(text: "Chips",
                                isSelected: $isSelected4,
                                isDisabled: .constant(true),
                                onTapChips: nil)
        }
    }
}

#Preview {
    SirioChipsSelectionExample()
}

