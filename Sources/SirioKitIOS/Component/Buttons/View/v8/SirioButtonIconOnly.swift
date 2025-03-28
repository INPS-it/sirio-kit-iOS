//
// SirioButtonIconOnly.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Button Icon Only
/// - Parameters:
///   - style: The [SirioButtonHierarchy]
///   - size: The [SirioSize]
///   - iconData: The data for icon button
///   - isDisabled: Whether the button is disabled
///   - action: Callback that is executed when the button is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

@available(*, deprecated, message: "This view is deprecated. Use SirioButton instead.")
public struct SirioButtonIconOnly: View {
    
    private var style: SirioButtonHierarchy // primary, secondary...
    private var size: SirioSize // large, medium, small
    private var iconData: SirioIconData
    @Binding private var isDisabled: Bool
    private var action: () -> Void
    private var accessibilityLabel: String?
    
    public init(style: SirioButtonHierarchy,
                size: SirioSize,
                iconData: SirioIconData,
                isDisabled: Binding<Bool> = .constant(false),
                action: @escaping () -> Void,
                accessibilityLabel: String? = nil){
        self.style = style
        self.size = size
        self.iconData = iconData
        self._isDisabled = isDisabled
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
        .buttonStyle(SirioButtonIconOnlyStyle(hierarchy: style, size: size, iconData: iconData, isDisabled: $isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct TestButtonsIconOnly: View {
    var type: String
    var hierarchy: SirioButtonHierarchy
    
    var body: some View {
        VStack(spacing: 8) {
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack {
                ForEach(SirioSize.allCases, id: \.self, content: { size in
                    SirioButtonIconOnly(style: hierarchy,
                                   size: size,
                                   iconData: .init(icon: .arrowRight),
                                   isDisabled: .constant(false),
                                   action: {})
                })
            }
            
            HStack {
                ForEach(SirioSize.allCases, id: \.self, content: { size in
                    SirioButtonIconOnly(style: hierarchy,
                                   size: size,
                                   iconData: .init(icon: .arrowRight),
                                   isDisabled: .constant(true),
                                   action: {})
                })
            }
        }
        .padding()
    }
}

#Preview {
    ScrollView(showsIndicators: false, content: {
        VStack(alignment: .leading, spacing: 8) {
            TestButtonsIconOnly(type: "Primary", hierarchy: .primary)
            TestButtonsIconOnly(type: "Secondary", hierarchy: .secondary)
            TestButtonsIconOnly(type: "Tertiary Light", hierarchy: .tertiaryLight)
            TestButtonsIconOnly(type: "Tertiary Dark", hierarchy: .tertiaryDark)
            TestButtonsIconOnly(type: "Danger", hierarchy: .danger)
            TestButtonsIconOnly(type: "Ghost", hierarchy: .ghost)
        }
    })
}
