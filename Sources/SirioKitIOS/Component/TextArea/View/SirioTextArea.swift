//
// SirioTextArea.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// Various type of Text Area
public enum SemanticTextArea: String, CaseIterable {
    case `default`, info, error, success
}

/// Text area component
/// - Parameters:
///   - type: The semantic [SemanticTextArea] of text area
///   - textInfo: The info label text
///   - infoIcon: The info icon
///   - placeholder: The text area placeholder
///   - text: The current text area text
///   - helperText: The optionl text on bottom of text area
///   - isDisabled: Whether the component is disabled
///   - isTextAreaDisabled: Whether only the text area is disabled.
///   - onTapInfoAction: Callback that is executed when the info button is tapped
///   - onTapTextAreaAction: Callback that is executed when the text area is tapped. If the callback is provided, the text area is disabled to allow the action; otherwise, the normal behavior is maintained.
///   - accessibilityLabelInfo: A string that identifies the info accessibility element
///   - accessibilityLabelIcon: A string that identifies the icon accessibility element

public struct SirioTextArea: View {
    @Binding var type: SemanticTextArea
    var textInfo: String?
    var infoIcon: AwesomeIcon?
    var placeholder: String
    @Binding var text: String
    var helperText: String?
    @Binding var isDisabled: Bool
    var onTapInfoAction: (() -> Void)?
    var onTapTextAreaAction: (() -> Void)?
    var accessibilityLabelInfo: String?
    var accessibilityLabelIcon: String?
    
    @State private var isHover: Bool = false
    @FocusState private var isFocused: Bool
    
    public init(type: Binding<SemanticTextArea> = .constant(.default),
                textInfo: String? = nil,
                infoIcon: AwesomeIcon? = nil,
                placeholder: String,
                text: Binding<String>,
                helperText: String?,
                isDisabled: Binding<Bool> = .constant(false),
                onTapInfoAction: (() -> Void)? = nil,
                onTapTextAreaAction: (() -> Void)? = nil,
                accessibilityLabelInfo: String? = nil,
                accessibilityLabelIcon: String? = nil){
        self._type = type
        self.textInfo = textInfo
        self.infoIcon = infoIcon
        self.placeholder = placeholder
        self._text = text
        self.helperText = helperText
        self._isDisabled = isDisabled
        self.onTapInfoAction = onTapInfoAction
        self.onTapTextAreaAction = onTapTextAreaAction
        self.accessibilityLabelInfo = accessibilityLabelInfo
        self.accessibilityLabelIcon = accessibilityLabelIcon
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.TextArea.spacing){
            
            HStack(spacing: Size.TextArea.spacing){
                if let textInfo = textInfo {
                    SirioText(text: textInfo, typography: .label_md_600)
                        .foregroundColor(textColor)
                }
                
                if let infoIcon = infoIcon {
                    Button(action: {
                        onTapInfoAction?()
                    }, label: {
                        SirioIcon(data: .init(icon: infoIcon))
                            .frame(width: Size.TextArea.Icon.frame1,
                                   height: Size.TextArea.Icon.frame1)
                            .foregroundColor(infoIconColor)
                    })
                    .setAccessibilityLabel(accessibilityLabelInfo)
                }
            }
            
            HStack {
                
                ZStack(alignment: .leading) {
                    
                    TextEditor(text: $text)
                        .sirioFont(typography: Typography.text_md_400)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                        .disabled(onTapTextAreaAction != nil)
                        .multilineTextAlignment(.leading)
                        .if(onTapTextAreaAction != nil, transform: { view in
                            view.overlay(
                                Button(action: {
                                    self.isFocused = true
                                    self.onTapTextAreaAction?()
                                },
                                       label: {
                                           Color.clear
                                       })
                            )
                        })
                        .padding(.vertical, Size.TextArea.paddingVerticalTextEditor)
                    
                    if text.isEmpty {
                        HStack(alignment: .top){
                            VStack {
                                SirioText(text: placeholder, typography: .placeholder_md_400)
                                    .foregroundColor(textColor)
                                    .lineLimit(1)
                                Spacer()
                            }.onTapGesture {
                                self.isFocused = true
                            }
                            
                            if let icon = icon {
                                Spacer()
                                
                                SirioIcon(data: .init(icon: icon))
                                    .frame(width: Size.TextArea.Icon.frame1,
                                           height: Size.TextArea.Icon.frame1)
                                    .foregroundStyle(iconColor)
                            }
                        }
                        .padding(.horizontal, Size.TextArea.paddingHorizontalPlaceholder)
                        .padding(.vertical, Size.TextArea.paddingVerticalPlaceholder)
                    }
                }
            }
            .padding(.horizontal, Size.TextArea.paddingHorizontal)
            .padding(.vertical, Size.TextArea.paddingVertical)
            .textEditorBackground(backgroundColor)
            .frame(height: Size.TextArea.height)
            .overlay(
                RoundedRectangle(cornerRadius: Size.TextArea.cornerRadius)
                    .stroke(borderColor, lineWidth: Size.TextArea.lineWidth)
            )
            .background(StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color)
            .cornerRadius(Size.TextArea.cornerRadius)
            
            if let helperText = helperText {
                SirioText(text: helperText, typography: .helper_text_xs_400)
                    .foregroundColor(textColor)
            }
        }
        .disabled(isDisabled)
        .onHover { isHover in
            self.isHover = isHover
        }
        .onTapGesture {
            onTapTextAreaAction?()
        }
    }
    
    
    var textColor: Color {
        if isDisabled {
            return Color.SirioTextArea.Text.disabled
        } else if isHover {
            return Color.SirioTextArea.Text.hover
        } else {
            switch type {
            case .default, .info:
                return Color.SirioTextArea.Text.default
            case .error:
                return Color.SirioTextArea.Text.error
            case .success:
                return Color.SirioTextArea.Text.success
                
            }
        }
    }
    
    var backgroundColor: Color {
        if isDisabled {
            return Color.SirioTextArea.Background.disabled
        }
        return Color.SirioTextArea.Background.default
    }
    
    var borderColor: Color {
        if isDisabled {
            return Color.SirioTextArea.Border.disabled
        } else if isHover {
            return Color.SirioTextArea.Border.hover
        } else {
            switch type {
            case .default, .info:
                return Color.SirioTextArea.Border.default
            case .error:
                return Color.SirioTextArea.Border.error
            case .success:
                return Color.SirioTextArea.Border.success
                
            }
        }
    }
    
    var infoIconColor: Color {
        if isDisabled {
            return Color.SirioTextArea.InfoIcon.disabled
        } else if isHover {
            return Color.SirioTextArea.InfoIcon.hover
        } else {
            switch type {
            case .default, .info:
                return Color.SirioTextArea.InfoIcon.default
            case .error:
                return Color.SirioTextArea.InfoIcon.error
            case .success:
                return Color.SirioTextArea.InfoIcon.success
                
            }
        }
    }
    
    var icon: AwesomeIcon? {
        switch type {
        case .default, .info:
            return nil
        case .error:
            return .exclamationTriangle
        case .success:
            return .check
        }
    }
    
    var iconColor: Color {
        switch type {
        case .default, .info:
            return Color.SirioTextArea.InfoIcon.default
        case .error:
            return Color.SirioTextArea.InfoIcon.error
        case .success:
            return Color.SirioTextArea.InfoIcon.success
        }
    }
    
}


#Preview {
    SirioTextArea(type: .constant(.success),
                  textInfo: "Label",
                  infoIcon: .infoCircle,
                  placeholder: "Placeholder",
                  text: .constant(""),
                  helperText: "*Helper text",
                  isDisabled: .constant(false),
                  onTapInfoAction: nil)
    .padding()
}
