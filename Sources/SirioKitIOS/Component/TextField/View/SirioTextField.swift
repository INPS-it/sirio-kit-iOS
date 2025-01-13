//
// SirioTextField.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// Various type of textfield
public enum SemanticTextField: String, CaseIterable {
    case warning, alert, success, info
}

/// Textfield component
/// - Parameters:
///   - type: The semantic [TextFieldSemantic] of text field
///   - textInfo: The info label text
///   - infoIcon: The info icon
///   - placeholder: The textfield placeholder
///   - text: The current text field text
///   - icon: The textfield icon
///   - helperText: The optionl text on bottom of text field
///   - isDisabled: Whether the component is disabled
///   - isSecureText: Whether the textfield is secure
///   - isTextFieldDisabled: Whether only the textfield is disabled. For example use it for show picker
///   - onTapInfoAction: Callback that is executed when the info button is tapped
///   - onTapIconAction: Callback that is executed when the icon button is tapped
///   - onTapTextFieldAction: Callback that is executed when the textfield is tapped. If the callback is provided, the textfield is disabled to allow the action; otherwise, the normal behavior is maintained.
///   - accessibilityLabelInfo: A string that identifies the info accessibility element
///   - accessibilityLabelIcon: A string that identifies the icon accessibility element

public struct SirioTextField: View {
    @Binding var type: SemanticTextField
    var textInfo: String?
    var infoIcon: AwesomeIcon?
    var placeholder: String
    @Binding var text: String
    var icon: AwesomeIcon?
    var helperText: String?
    @Binding var isDisabled: Bool
    @Binding var isSecureText: Bool
    var onTapInfoAction: (() -> Void)?
    var onTapIconAction: (() -> Void)?
    var onTapTextFieldAction: (() -> Void)?
    var accessibilityLabelInfo: String?
    var accessibilityLabelIcon: String?
    
    @State private var isHover: Bool = false
    @FocusState private var isFocused: Bool
    
    public init(type: Binding<SemanticTextField> = .constant(.info),
                textInfo: String? = nil,
                infoIcon: AwesomeIcon? = nil,
                placeholder: String,
                text: Binding<String>,
                icon: AwesomeIcon?,
                helperText: String? = nil,
                isDisabled: Binding<Bool> = .constant(false),
                isSecureText: Binding<Bool> = .constant(false),
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
        self.onTapInfoAction = onTapInfoAction
        self.onTapIconAction = onTapIconAction
        self.onTapTextFieldAction = onTapTextFieldAction
        self.accessibilityLabelInfo = accessibilityLabelInfo
        self.accessibilityLabelIcon = accessibilityLabelIcon
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.SirioTextField.spacing){
            
            HStack(spacing: Size.SirioTextField.spacing){
                if let textInfo = textInfo {
                    SirioText(text: textInfo, typography: Typography.TextField.label)
                        .foregroundColor(textColor)
                }
                
                if let infoIcon = infoIcon {
                    Button(action: {
                        onTapInfoAction?()
                    }, label: {
                        SirioIcon(data: .init(icon: infoIcon))
                            .frame(width: Size.SirioTextField.Icon.frame1,
                                   height: Size.SirioTextField.Icon.frame1)
                            .foregroundColor(infoIconColor)
                    })
                    .setAccessibilityLabel(accessibilityLabelInfo)
                }
            }
            
            HStack {
                
                ZStack(alignment: .leading) {
                    if text.isEmpty {
                        SirioText(text: placeholder, typography: Typography.TextField.text)
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    }
                    
                    if isSecureText {
                        SecureField("", text: $text)
                            .sirioFont(typography: Typography.TextField.text)
                            .foregroundColor(textFieldTextColor)
                            .focused($isFocused)
                            .disabled(onTapTextFieldAction != nil)
                            .if(onTapTextFieldAction != nil, transform: { view in
                                view.overlay(
                                    Button(action: {
                                        self.onTapTextFieldAction?()
                                    },
                                           label: {
                                               Color.clear
                                           })
                                )
                            })
                    } else {
                        TextField("", text: $text)
                            .sirioFont(typography: Typography.TextField.text)
                            .foregroundColor(textFieldTextColor)
                            .focused($isFocused)
                            .disabled(onTapTextFieldAction != nil)
                            .if(onTapTextFieldAction != nil, transform: { view in
                                view.overlay(
                                    Button(action: {
                                        self.onTapTextFieldAction?()
                                    },
                                           label: {
                                               Color.clear
                                           })
                                )
                            })
                    }
                }
                
                Spacer()
                
                if let icon = icon {
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.SirioTextField.Icon.frame2,
                               height: Size.SirioTextField.Icon.frame2)
                        .foregroundColor(iconColor)
                        .onTapGesture {
                            self.onTapIconAction?()
                        }
                        .setAccessibilityLabel(accessibilityLabelIcon)
                }
            }
            .padding(.horizontal, Size.SirioTextField.paddingHorizontal)
            .frame(height: Size.SirioTextField.height)
            .overlay(
                RoundedRectangle(cornerRadius: Size.SirioTextField.cornerRadius)
                    .stroke(borderColor, lineWidth: Size.SirioTextField.borderWidth)
            )
            .background(backgroundColor)
            .cornerRadius(Size.SirioTextField.cornerRadius)
            
            if let helperText = helperText, !helperText.isEmpty {
                SirioText(text: helperText, typography: Typography.TextField.helper)
                    .foregroundColor(textColor)
            }
        }
        .disabled(isDisabled)
        .onHover { isHover in
            self.isHover = isHover
        }
        .onTapGesture {
            onTapTextFieldAction?()
        }
    }
    
    var textColor: Color {
        if isDisabled {
            return Color.SirioTextField.Text.disabled
        } else if isHover {
            return Color.SirioTextField.Text.hover
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.Text.warning
            case .alert:
                return Color.SirioTextField.Text.alert
            case .success:
                return Color.SirioTextField.Text.success
            case .info:
                return Color.SirioTextField.Text.default
            }
        }
    }
    
    var textFieldTextColor: Color {
        if isDisabled {
            return Color.SirioTextField.Text.disabled
        } else if isHover {
            return Color.SirioTextField.Text.hover
        } else {
            if text.isEmpty {
                return Color.SirioTextField.Text.placeholder
            } else {
                switch type {
                case .warning:
                    return Color.SirioTextField.Text.warning
                case .alert:
                    return Color.SirioTextField.Text.alert
                case .success:
                    return Color.SirioTextField.Text.success
                case .info:
                    return Color.SirioTextField.Text.default
                }
            }
        }
    }
    
    var backgroundColor: Color {
        return Color.SirioTextField.Background.default
    }
    
    var borderColor: Color {
        if isDisabled {
            return Color.SirioTextField.Border.disabled
        } else if isHover {
            return Color.SirioTextField.Border.hover
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.Border.warning
            case .alert:
                return Color.SirioTextField.Border.alert
            case .success:
                return Color.SirioTextField.Border.success
            case .info:
                return Color.SirioTextField.Border.default
            }
        }
    }
    
    var iconColor: Color {
        if isDisabled {
            return Color.SirioTextField.Icon.disabled
        } else if isHover {
            return Color.SirioTextField.Icon.hover
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.Icon.warning
            case .alert:
                return Color.SirioTextField.Icon.alert
            case .success:
                return Color.SirioTextField.Icon.success
            case .info:
                return Color.SirioTextField.Icon.default
            }
        }
    }
    
    var infoIconColor: Color {
        if isDisabled {
            return Color.SirioTextField.InfoIcon.disabled
        } else if isHover {
            return Color.SirioTextField.InfoIcon.hover
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.InfoIcon.warning
            case .alert:
                return Color.SirioTextField.InfoIcon.alert
            case .success:
                return Color.SirioTextField.InfoIcon.success
            case .info:
                return Color.SirioTextField.InfoIcon.default
            }
        }
    }
}

#Preview {
    SirioTextField(type: .constant(.warning),
                   textInfo: "Label",
                   infoIcon: .infoCircle,
                   placeholder: "Placeholder",
                   text: .constant(""),
                   icon: .calendar,
                   helperText: "*Helper text",
                   onTapInfoAction: nil)
    .padding()
}
