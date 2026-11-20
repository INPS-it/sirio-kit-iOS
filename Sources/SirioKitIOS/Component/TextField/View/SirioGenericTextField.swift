//
// SirioGenericTextField.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A customizable text field component supporting different types, icons, and interactions.
///
/// - Parameters:
///   - type: The semantic type of the text field, which defines its visual style (e.g., info, warning, alert, success).
///   - textInfo: An optional label displayed above the text field.
///   - placeholder: The placeholder text shown when the text field is empty.
///   - value: A binding to the value entered in the text field, supporting generic types conforming to `LosslessStringConvertible`.
///   - iconData: An optional icon displayed inside the text field.
///   - helperText: Additional text displayed below the text field, often used for hints or validation messages.
///   - isDisabled: A binding that determines whether the text field is disabled.
///   - isSecureText: A binding that determines whether the text field hides the input (for passwords).
///   - popoverTitle: An optional title displayed inside the info popover.
///   - popoverSubtitle: An optional subtitle or descriptive text displayed inside the info popover.
///   - popoverTextButton: An optional label for the action button inside the info popover.
///   - popoverOnTapButton: An optional action triggered when the button inside the popover is tapped.
///   - onTapInfoAction: An optional action triggered when the info icon is tapped.
///   - onTapIconAction: An optional action triggered when the main icon inside the text field is tapped.
///   - onTapTextFieldAction: An optional action triggered when the text field is tapped.
///   - accessibilityLabelInfo: A string used as an accessibility label for the info icon.
///   - accessibilityLabelIcon: A string used as an accessibility label for the main icon.

public struct SirioGenericTextField<T: LosslessStringConvertible>: View {
    @Binding var type: SirioSemantic
    var textInfo: String?
    var placeholder: String
    var iconData: SirioIconData?
    var helperText: String?
    @Binding var isDisabled: Bool
    @Binding var isSecureText: Bool
    
    var popoverTitle: String?
    var popoverSubtitle: String?
    var popoverTextButton: String?
    var popoverOnTapButton: (() -> Void)?
    
    var onTapInfoAction: (() -> Void)?
    var onTapIconAction: (() -> Void)?
    var onTapTextFieldAction: (() -> Void)?
    var accessibilityLabelInfo: String?
    var accessibilityLabelIcon: String?
    
    @FocusState private var isFocused: Bool
    @Binding var value: T
    
    @State private var isPopoverOpen: Bool = false
    @State private var componentFrame: CGRect = .zero
    @State private var infoIconFrame: CGRect = .zero
    
    public init(
        type: Binding<SirioSemantic> = .constant(.info),
        textInfo: String? = nil,
        placeholder: String,
        value: Binding<T>,
        iconData: SirioIconData? = nil,
        helperText: String? = nil,
        isDisabled: Binding<Bool> = .constant(false),
        isSecureText: Binding<Bool> = .constant(false),
        popoverTitle: String? = nil,
        popoverSubtitle: String? = nil,
        popoverTextButton: String? = nil,
        popoverOnTapButton: (() -> Void)? = nil,
        onTapInfoAction: (() -> Void)? = nil,
        onTapIconAction: (() -> Void)? = nil,
        onTapTextFieldAction: (() -> Void)? = nil,
        accessibilityLabelInfo: String? = nil,
        accessibilityLabelIcon: String? = nil) {
            self._type = type
            self.textInfo = textInfo
            self.placeholder = placeholder
            self._value = value
            self.iconData = iconData
            self.helperText = helperText
            self._isDisabled = isDisabled
            self._isSecureText = isSecureText
            self.popoverTitle = popoverTitle
            self.popoverSubtitle = popoverSubtitle
            self.popoverTextButton = popoverTextButton
            self.popoverOnTapButton = popoverOnTapButton
            self.onTapInfoAction = onTapInfoAction
            self.onTapIconAction = onTapIconAction
            self.onTapTextFieldAction = onTapTextFieldAction
            self.accessibilityLabelInfo = accessibilityLabelInfo
            self.accessibilityLabelIcon = accessibilityLabelIcon
        }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.s8) {
            HStack(spacing: Size.SirioTextField.spacing){
                if let textInfo = textInfo {
                    SirioText(text: textInfo, typography: Typography.TextField.label)
                        .foregroundColor(textColor)
                }
                
                if popoverTitle != nil || popoverSubtitle != nil {
                    SirioPopoverButton(semantic: type, title: popoverTitle, subtitle: popoverSubtitle, textButton: popoverTextButton, onTapButton: popoverOnTapButton)
                }
            }
            
            HStack {
                ZStack(alignment: .leading) {
                    if valueBinding.wrappedValue.isEmpty {
                        SirioText(text: placeholder, typography: textTypography)
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    }
                    
                    if isSecureText {
                        SecureField("", text: valueBinding)
                            .sirioFont(typography: Typography.TextField.text)
                            .foregroundColor(textFieldTextColor)
                            .focused($isFocused)
                    } else {
                        TextField("", text: valueBinding)
                            .sirioFont(typography: textTypography)
                            .foregroundColor(textFieldTextColor)
                            .focused($isFocused)
                    }
                }
                .disabled(onTapTextFieldAction != nil)
                
                Spacer()
                
                if let iconData = iconData {
                    SirioIcon(data: iconData)
                        .frame(width: Size.SirioTextField.Icon.frame2,
                               height: Size.SirioTextField.Icon.frame2)
                        .foregroundColor(iconColor)
                        .onTapGesture { self.onTapIconAction?() }
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
        .background(
            GeometryReader { geo in
                Color.clear.onAppear { componentFrame = geo.frame(in: .global) }
                    .onChange(of: geo.frame(in: .global)) { componentFrame = $0 }
            }
        )
        .disabled(isDisabled)
        .onTapGesture {
            onTapTextFieldAction?()
        }
        .onChange(of: isPopoverOpen) { newValue in
            if !newValue { SirioWindowManager.shared.dismiss() }
        }
    }
    
    // MARK: - Computed Properties
    private var valueBinding: Binding<String> {
        Binding<String>(
            get: { String(value) },
            set: { newValue in
                if let convertedValue = T(newValue) { value = convertedValue }
            }
        )
    }
    
    private var textTypography: Typography {
        T.self == Int.self ? Typography.TextField.number : Typography.TextField.text
    }
    
    private var textColor: Color {
        isDisabled ? Color.SirioTextField.Text.disabled : typeColor(for: .text)
    }
    
    private var textFieldTextColor: Color {
        if isDisabled { return Color.SirioTextField.Text.disabled }
        return valueBinding.wrappedValue.isEmpty ? Color.SirioTextField.Text.placeholder : typeColor(for: .text)
    }
    
    private var backgroundColor: Color {
        isDisabled ? Color.SirioTextField.Background.disabled : Color.SirioTextField.Background.default
    }
    
    private var borderColor: Color {
        isDisabled ? Color.SirioTextField.Border.disabled : typeColor(for: .border)
    }
    
    private var iconColor: Color {
        isDisabled ? Color.SirioTextField.Icon.disabled : typeColor(for: .icon)
    }
    
    private var infoIconColor: Color {
        isDisabled ? Color.SirioTextField.InfoIcon.disabled : typeColor(for: .infoIcon)
    }
    
    private enum ColorCategory { case text, border, icon, infoIcon }
    
    private func typeColor(for category: ColorCategory) -> Color {
        switch type {
        case .warning:
            switch category {
            case .text: return Color.SirioTextField.Text.warning
            case .border: return Color.SirioTextField.Border.warning
            case .icon: return Color.SirioTextField.Icon.warning
            case .infoIcon: return Color.SirioTextField.InfoIcon.warning
            }
        case .alert:
            switch category {
            case .text: return Color.SirioTextField.Text.alert
            case .border: return Color.SirioTextField.Border.alert
            case .icon: return Color.SirioTextField.Icon.alert
            case .infoIcon: return Color.SirioTextField.InfoIcon.alert
            }
        case .success:
            switch category {
            case .text: return Color.SirioTextField.Text.success
            case .border: return Color.SirioTextField.Border.success
            case .icon: return Color.SirioTextField.Icon.success
            case .infoIcon: return Color.SirioTextField.InfoIcon.success
            }
        case .info:
            switch category {
            case .text: return Color.SirioTextField.Text.default
            case .border: return Color.SirioTextField.Border.default
            case .icon: return Color.SirioTextField.Icon.default
            case .infoIcon: return Color.SirioTextField.InfoIcon.default
            }
        }
    }
}

#Preview {
    @State var userText: String = "Text"
    
    return ScrollView {
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover ",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover ",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover 5",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover 6",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
    }
}


#Preview {
    @State var userText: String = "Text"
    
    return
    HStack {
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input1",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto lungo"
        )
        .padding()
        
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input2",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper Text",
            popoverTitle: "Titolo Popover",
            popoverSubtitle: "Questo è un sottotitolo molto molto molto molto molto molto molto molto molto molto lungo"
        )
        .padding()
    }
}

