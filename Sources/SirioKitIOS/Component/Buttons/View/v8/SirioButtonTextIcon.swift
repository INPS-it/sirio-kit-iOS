//
// SirioButtonTextIcon.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Button Text Icon
/// - Parameters:
///   - style: The [SirioButtonHierarchy]
///   - size: The [SirioSize]
///   - text: The button text
///   - iconData: The data for icon button
///   - isDisabled: Whether the button is disabled
///   - isFullSize: Whether the button uses the maximum available space
///   - action: Callback that is executed when the button is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

@available(*, deprecated, message: "This view is deprecated. Use SirioButton instead.")
public struct SirioButtonTextIcon: View {
    private var style: SirioButtonHierarchy
    private var size: SirioSize
    private var text: String
    private var iconData: SirioIconData
    @Binding private var isDisabled: Bool
    private var isFullSize: Bool
    private var action: () -> Void
    private var accessibilityLabel: String?

    public init(style: SirioButtonHierarchy,
                size: SirioSize,
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
        .buttonStyle(SirioButtonTextIconStyle(hierarchy: style,
                                              size: size,
                                              text: text,
                                              iconData: iconData,
                                              isDisabled: $isDisabled,
                                              isFullSize: isFullSize))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct TestButtonsTextIcon: View {
    var type: String
    var hierarchy: SirioButtonHierarchy
    
    var body: some View {
        VStack(alignment: .center){
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack(spacing: 8) {
                VStack {
                    ForEach(SirioSize.allCases, id: \.self, content: { size in
                        SirioButtonTextIcon(style: hierarchy,
                                       size: size,
                                       text: "Text",
                                       iconData: .init(icon: .arrowRight),
                                       isDisabled: .constant(false),
                                       action: {})
                    })
                }
                
                VStack {
                    ForEach(SirioSize.allCases, id: \.self, content: { size in
                        SirioButtonTextIcon(style: hierarchy,
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

#Preview {
    ScrollView(showsIndicators: false, content: {
        VStack(alignment: .leading, spacing: 8) {
            TestButtonsTextIcon(type: "Primary", hierarchy: .primary)
            TestButtonsTextIcon(type: "Secondary", hierarchy: .secondary)
            TestButtonsTextIcon(type: "Tertiary Light", hierarchy: .tertiaryLight)
            TestButtonsTextIcon(type: "Tertiary Dark", hierarchy: .tertiaryDark)
            TestButtonsTextIcon(type: "Danger", hierarchy: .danger)
            TestButtonsTextIcon(type: "Ghost", hierarchy: .ghost)
        }
    })
}
