//
// SirioCheckbox.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom checkbox component, typically used for binary selection options (checked/unchecked).
/// It allows the user to toggle the checkbox state and provides feedback via a callback.
///
/// - Parameters:
///   - text: The label text displayed next to the checkbox. This is optional.
///   - isChecked: A `Binding` boolean that indicates whether the checkbox is checked (`true`) or unchecked (`false`).
///   - isDisabled: A `Binding` boolean that determines if the checkbox is interactive. When `true`, the checkbox is disabled and cannot be toggled.
///   - callback: A closure that is called whenever the checkbox state changes. It provides the `text` value as a parameter, which can be `nil` if no text is provided.
///   - accessibilityLabel: An optional string that helps identify the checkbox for accessibility tools like screen readers.


public struct SirioCheckbox: View {
    var text: String?
    @Binding var isChecked: Bool
    @Binding var isDisabled: Bool
    var callback: ((String?) -> ())?
    private var accessibilityLabel: String?

    public init(text: String?,
                isChecked: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                callback: ((String?) -> ())?,
                accessibilityLabel: String? = nil) {
        self.text = text
        self._isChecked = isChecked
        self._isDisabled = isDisabled
        self.callback = callback
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        Button(action: {
            if !isDisabled {
                self.isChecked.toggle()
                self.callback?(text)
            }
        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioCheckboxStyle(text: text, isChecked: isChecked, isDisabled: $isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

#Preview {
    VStack(spacing: 4) {
        
        SirioCheckbox(text: "Title",
                 isChecked: .constant(false),
                 isDisabled: .constant(false),
                 callback: { _ in
            
        })
        
        SirioCheckbox(text: "Title",
                 isChecked: .constant(true),
                 isDisabled: .constant(false),
                 callback: { _ in
            
        })
        
        SirioCheckbox(text: "Title",
                 isChecked: .constant(true),
                 isDisabled: .constant(true),
                 callback: { _ in
            
        })
        
        SirioCheckbox(text: "Title",
                 isChecked: .constant(false),
                 isDisabled: .constant(true),
                 callback: { _ in
            
        })
    }.padding()
}
