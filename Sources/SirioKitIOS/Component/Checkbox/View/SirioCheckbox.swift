//
// SirioCheckbox.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio checkbox
/// - Parameters:
///   - text: The string checkbox right
///   - isChecked: Whether the checkbox is checked
///   - isDisabled: Whether the checkbox is disabled
///   - callback: The callback when the checkbox state change
///   - accessibilityLabel: A string that identifies the accessibility element

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
