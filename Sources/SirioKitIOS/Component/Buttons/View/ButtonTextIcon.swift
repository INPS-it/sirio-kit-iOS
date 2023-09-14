//
// ButtonTextIcon.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Button Text Icon
/// - Parameters:
///   - style: The [SirioButtonStyle]
///   - size: The [SirioButtonSize]
///   - text: The button text
///   - iconData: The data for icon button
///   - isDisabled: Whether the button is disabled
///   - isFullSize: Whether the button uses the maximum available space
///   - action: Callback that is executed when the button is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

public struct ButtonTextIcon: View {
    
    private var style: SirioButtonStyle
    private var size: SirioButtonSize
    private var text: String
    private var iconData: SirioIconData
    @Binding private var isDisabled: Bool
    private var isFullSize: Bool
    private var action: () -> Void
    private var accessibilityLabel: String?

    public init(style: SirioButtonStyle,
                size: SirioButtonSize,
                text: String,
                iconData: SirioIconData,
                isDisabled: Binding<Bool> = .constant(false),
                isFullSize: Bool = false,
                action: @escaping () -> Void,
                accessibilityLabel: String? = nil){
        self.style = style
        self.size = size
        self.text = text
        self.iconData = iconData
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        self.action = action
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        
        Button(action: {
            action()
        }, label: {
            // Inside style
        })
        .disabled(isDisabled)
        .buttonStyle(SirioButtonTextIconStyle(style: style,
                                              size: size,
                                              text: text,
                                              iconData: iconData,
                                              isDisabled: $isDisabled,
                                              isFullSize: isFullSize))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct ButtonTextIcon_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 8) {
                TrilogyButtonsTextIcon(type: "Primary", style: .primary)
                TrilogyButtonsTextIcon(type: "Secondary", style: .secondary)
                TrilogyButtonsTextIcon(type: "Tertiary Light", style: .tertiaryLight)
                TrilogyButtonsTextIcon(type: "Tertiary Dark", style: .tertiaryDark)
                TrilogyButtonsTextIcon(type: "Danger", style: .danger)
                TrilogyButtonsTextIcon(type: "Ghost", style: .ghost)
            }
        })
    }
}


struct TrilogyButtonsTextIcon: View {
    var type: String
    var style: SirioButtonStyle
    
    var body: some View {
        VStack(alignment: .center){
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack(spacing: 8) {
                VStack {
                    ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                        ButtonTextIcon(style: style,
                                       size: size,
                                       text: "Text",
                                       iconData: .init(icon: .arrowRight),
                                       isDisabled: .constant(false),
                                       action: {})
                    })
                }
                
                VStack {
                    ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                        ButtonTextIcon(style: style,
                                       size: size,
                                       text: "Text",
                                       iconData: .init(icon: .arrowRight),
                                       isDisabled: .constant(true),
                                       action: {})
                    })
                }
            }
            .padding()
        }
    }
}
