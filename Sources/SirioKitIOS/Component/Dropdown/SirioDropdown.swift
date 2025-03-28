//
// SirioDropdown.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI

/// A custom dropdown component for selecting an item from a list.
///
/// - Parameters:
///   - type: The type of the text field (e.g., `.info`).
///   - textInfo: Optional text to show as information above the text field.
///   - placeholder: The placeholder text for the dropdown text field.
///   - text: A binding to the selected value in the dropdown.
///   - listItem: The list of items to display in the dropdown.
///   - helperText: Optional helper text that may provide additional information to the user.
///   - isDisabled: A binding that controls whether the dropdown is disabled.
///   - onTapDismiss: A callback executed when the dropdown is dismissed.
///   - onTapOpen: A callback executed when the dropdown is opened.
///   - onTapInfoAction: A callback executed when the info icon is tapped.

public struct SirioDropdown: View {
    
    @Binding var type: SemanticTextField
    var textInfo: String?
    var placeholder: String
    @Binding var text: String
    var listItem: [String]
    var helperText: String?
    @Binding var isDisabled: Bool
    var onTapInfoAction: (() -> Void)?
    var onTapIconAction: (() -> Void)?
    var onTapOpen: (() -> Void)?
    var onTapDismiss: (() -> Void)?
    
    public init(type: Binding<SemanticTextField> = .constant(.info),
                textInfo: String? = nil,
                placeholder: String,
                text: Binding<String>,
                listItem: [String],
                helperText: String?,
                isDisabled: Binding<Bool> = .constant(false),
                onTapDismiss: (() -> Void)? = nil,
                onTapOpen: (() -> Void)? = nil,
                onTapInfoAction: (() -> Void)? = nil){
        self._type = type
        self.textInfo = textInfo
        self.placeholder = placeholder
        self._text = text
        self.listItem = listItem
        self.helperText = helperText
        self._isDisabled = isDisabled
        self.onTapDismiss = onTapDismiss
        self.onTapOpen = onTapOpen
        self.onTapInfoAction = onTapInfoAction
    }
    
    
    public var body: some View {
        Menu {
            Picker("", selection: $text) {
                ForEach(listItem, id: \.self) {
                    SirioText(text: $0, typography: .labelMdRegular)
                        .frame(maxWidth: .infinity)
                }
            }
        } label: {
            sirioTextField
                .multilineTextAlignment(.leading)
        }
        .onChange(of: text) { newValue in
            self.onTapDismiss?()
        }
    }
    
    var sirioTextField: some View {
        SirioGenericTextField(
            type: $type,
            textInfo: textInfo,
            placeholder: placeholder,
            value: $text,
            iconData: .init(icon: .angleDown),
            helperText: helperText,
            isDisabled: $isDisabled,
            onTapInfoAction: onTapInfoAction,
            onTapIconAction: onTapIconAction,
            onTapTextFieldAction: {
                onTapOpen?()
            })
        .disabled(isDisabled)
    }
}

#Preview {
    SirioDropdown(type: .constant(.info), textInfo: "Label", placeholder: "Placeholder", text: .constant(""), listItem: ["A", "B", "C"], helperText: "Helper text", isDisabled: .constant(false), onTapDismiss: {}, onTapOpen: {}, onTapInfoAction: {})
    
        .padding()
}
