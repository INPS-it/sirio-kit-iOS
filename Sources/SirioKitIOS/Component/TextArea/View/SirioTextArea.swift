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

/// A customizable text area component with optional labels, icons, and actions.
///
/// - Parameters:
///   - type: The semantic [SemanticTextArea] type of the text area.
///   - textInfo: An optional label text displayed above the text area.
///   - infoIcon: An optional icon displayed next to the textInfo label.
///   - placeholder: The placeholder text shown when the text area is empty.
///   - text: A binding to the current text content of the text area.
///   - helperText: An optional helper text displayed below the text area.
///   - isDisabled: A binding that determines whether the entire component is disabled.
///   - onTapInfoAction: An optional callback executed when the info button is tapped.
///   - onTapTextAreaAction: An optional callback executed when the text area is tapped. If provided, the text area becomes non-editable and the action is executed instead.
///   - accessibilityLabelInfo: A string identifying the accessibility element for the info label.
///   - accessibilityLabelIcon: A string identifying the accessibility element for the icon.

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
                    SirioText(text: textInfo, typography: .labelMdMiddle)
                        .foregroundColor(textColor)
                }
                
                if let infoIcon = infoIcon {
                    Button(action: {
                        onTapInfoAction?()
                    }, label: {
                        SirioIcon(data: .init(icon: infoIcon))
                            .frame(width: Size.TextArea.icon,
                                   height: Size.TextArea.icon)
                            .foregroundColor(infoIconColor)
                    })
                    .setAccessibilityLabel(accessibilityLabelInfo)
                }
            }
            
            HStack {
                ZStack(alignment: .leading) {
                    TextEditor(text: $text)
                        .sirioFont(typography: Typography.labelMdMiddle)
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
                                SirioText(text: placeholder, typography: .labelMdMiddle)
                                    .foregroundColor(textColor)
                                    .lineLimit(1)
                                Spacer()
                            }.onTapGesture {
                                self.isFocused = true
                            }
                            
                            if let icon = icon {
                                Spacer()
                                
                                SirioIcon(data: .init(icon: icon))
                                    .frame(width: Size.TextArea.icon,
                                           height: Size.TextArea.icon)
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
            .background(backgroundColor)
            .cornerRadius(Size.TextArea.cornerRadius)
            
            if let helperText = helperText {
                SirioText(text: helperText, typography: .helper_text_xs_400)
                    .foregroundColor(textColor)
            }
        }
        .disabled(isDisabled)
        .onTapGesture {
            onTapTextAreaAction?()
        }
    }
    
    
    private var textColor: Color {
        if isDisabled {
            return Color.SirioTextArea.Text.disabled
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
    
    private var backgroundColor: Color {
        if isDisabled {
            return Color.SirioTextArea.Background.disabled
        }
        return Color.SirioTextArea.Background.default
    }
    
    private var borderColor: Color {
        if isDisabled {
            return Color.SirioTextArea.Border.disabled
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
    
    private var infoIconColor: Color {
        if isDisabled {
            return Color.SirioTextArea.InfoIcon.disabled
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
    
    private var icon: AwesomeIcon? {
        switch type {
        case .default, .info:
            return nil
        case .error:
            return .exclamationTriangle
        case .success:
            return .check
        }
    }
    
    private var iconColor: Color {
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
    ScrollView {
        VStack {
            ForEach(SemanticTextArea.allCases, id: \.self, content: { c in
                SirioTextArea(type: .constant(c),
                              textInfo: "Label",
                              infoIcon: .infoCircle,
                              placeholder: "Placeholder",
                              text: .constant(""),
                              helperText: "*Helper text",
                              isDisabled: .constant(false),
                              onTapInfoAction: nil)
                
            })
            
            SirioTextArea(type: .constant(.info),
                          textInfo: "Label",
                          infoIcon: .infoCircle,
                          placeholder: "Placeholder",
                          text: .constant(""),
                          helperText: "*Helper text",
                          isDisabled: .constant(true),
                          onTapInfoAction: nil)
        }
        .padding(.horizontal)
    }
}
