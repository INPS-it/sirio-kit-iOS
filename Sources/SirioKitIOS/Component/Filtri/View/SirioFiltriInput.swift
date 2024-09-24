//
// SirioFiltriInput.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriInput: View {
    
    @Binding var type: SemanticTextField
    var textInfo: String?
    var infoIcon: AwesomeIcon?
    var placeholder: String
    @Binding var text: String
    var icon: AwesomeIcon?
    var helperText: String?
    @Binding var isDisabled: Bool
    @Binding var isSecureText: Bool
    var background: SirioFiltriBackground
    var onTapInfoAction: (() -> Void)?
    var onTapIconAction: (() -> Void)?
    var onTapTextFieldAction: (() -> Void)?
    var accessibilityLabelInfo: String?
    var accessibilityLabelIcon: String?
    
    public init(type: Binding<SemanticTextField> = .constant(.info),
                textInfo: String? = nil,
                infoIcon: AwesomeIcon? = nil,
                placeholder: String,
                text: Binding<String>,
                icon: AwesomeIcon? = nil,
                helperText: String? = nil,
                isDisabled: Binding<Bool> = .constant(false),
                isSecureText: Binding<Bool> = .constant(false),
                background: SirioFiltriBackground = .default,
                onTapInfoAction: (() -> Void)? = nil,
                onTapIconAction: (() -> Void)? = nil,
                onTapTextFieldAction: (() -> Void)? = nil,
                accessibilityLabelInfo: String? = nil,
                accessibilityLabelIcon: String? = nil){
        self._type = type
        self.textInfo = textInfo
        self.infoIcon = infoIcon
        self.placeholder = placeholder
        self._text = text
        self.icon = icon
        self.helperText = helperText
        self._isDisabled = isDisabled
        self._isSecureText = isSecureText
        self.background = background
        self.onTapInfoAction = onTapInfoAction
        self.onTapIconAction = onTapIconAction
        self.onTapTextFieldAction = onTapTextFieldAction
        self.accessibilityLabelInfo = accessibilityLabelInfo
        self.accessibilityLabelIcon = accessibilityLabelIcon
    }
    
    public var body: some View {
        HStack {
            SirioTextField(type: $type,
                           textInfo: "Label",
                           infoIcon: nil,
                           placeholder: "Text",
                           text: $text,
                           icon: nil,
                           helperText: nil,
                           isDisabled: $isDisabled,
                           isSecureText: $isSecureText,
                           onTapInfoAction: nil,
                           onTapIconAction: nil,
                           onTapTextFieldAction: nil,
                           accessibilityLabelInfo: accessibilityLabelIcon,
                           accessibilityLabelIcon: accessibilityLabelIcon)
            
            Spacer()
        }
        .padding(Size.Filtri.padding)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

#Preview {
    SirioFiltriInput(textInfo: "Label", placeholder: "Text", text: .constant(""), icon: nil)
}
