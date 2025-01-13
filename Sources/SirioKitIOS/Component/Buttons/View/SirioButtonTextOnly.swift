//
// SirioButtonTextOnly.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Button Text Only
/// - Parameters:
///   - style: The [SirioButtonStyle]
///   - size: The [SirioSize]
///   - text: The button text
///   - isDisabled: Whether the button is disabled
///   - isFullSize: Whether the button uses the maximum available space
///   - action: Callback that is executed when the button is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioButtonTextOnly: View {
    
    private var style: SirioButtonStyle
    private var size: SirioSize
    private var text: String
    @Binding private var isDisabled: Bool
    private var isFullSize: Bool
    private var action: () -> Void
    private var accessibilityLabel: String?

    public init(style: SirioButtonStyle,
                size: SirioSize,
                text: String,
                isDisabled: Binding<Bool> = .constant(false),
                isFullSize: Bool = false,
                action: @escaping () -> Void,
                accessibilityLabel: String? = nil){
        self.style = style
        self.size = size
        self.text = text
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
        .buttonStyle(SirioButtonTextOnlyStyle(style: style,
                                              size: size,
                                              text: text,
                                              isDisabled: $isDisabled,
                                              isFullSize: isFullSize))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct TestButtonsTextOnly: View {
    var type: String
    var style: SirioButtonStyle
    
    var body: some View {
        VStack(alignment: .center){
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack(spacing: 8) {
                VStack {
                    ForEach(SirioSize.allCases, id: \.self, content: { size in
                        SirioButtonTextOnly(style: style,
                                       size: size,
                                       text: "Text",
                                       isDisabled: .constant(false),
                                       action: {})
                    })
                }
                
                VStack {
                    ForEach(SirioSize.allCases, id: \.self, content: { size in
                        SirioButtonTextOnly(style: style,
                                       size: size,
                                       text: "Text",
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
            TestButtonsTextOnly(type: "Primary", style: .primary)
            TestButtonsTextOnly(type: "Secondary", style: .secondary)
            TestButtonsTextOnly(type: "Tertiary Light", style: .tertiaryLight)
            TestButtonsTextOnly(type: "Tertiary Dark", style: .tertiaryDark)
            TestButtonsTextOnly(type: "Danger", style: .danger)
            TestButtonsTextOnly(type: "Ghost", style: .ghost)
        }
    })
}
