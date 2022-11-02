//
// ButtonTextOnly.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Button Text Only
/// - Parameters:
///   - style: The [SirioButtonStyle]
///   - size: The [SirioButtonSize]
///   - text: The button text
///   - isDisabled: Whether the button is disabled
///   - isFullSize: Whether the button uses the maximum available space
///   - action: Callback that is executed when the button is tapped
public struct ButtonTextOnly: View {
    
    private var style: SirioButtonStyle
    private var size: SirioButtonSize
    private var text: String
    @Binding private var isDisabled: Bool
    private var isFullSize: Bool
    private var action: () -> Void
    
    public init(style: SirioButtonStyle,
                size: SirioButtonSize,
                text: String,
                isDisabled: Binding<Bool> = .constant(false),
                isFullSize: Bool = false,
                action: @escaping () -> Void ){
        self.style = style
        self.size = size
        self.text = text
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        self.action = action
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
    }
}

struct ButtonTextOnly_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 8) {
                TrilogyButtonsTextOnly(type: "Primary", style: .primary)
                TrilogyButtonsTextOnly(type: "Secondary", style: .secondary)
                TrilogyButtonsTextOnly(type: "Tertiary Light", style: .tertiaryLight)
                TrilogyButtonsTextOnly(type: "Tertiary Dark", style: .tertiaryDark)
                TrilogyButtonsTextOnly(type: "Danger", style: .danger)
                TrilogyButtonsTextOnly(type: "Ghost", style: .ghost)
            }
        })
    }
}


struct TrilogyButtonsTextOnly: View {
    var type: String
    var style: SirioButtonStyle
    
    var body: some View {
        VStack(alignment: .center){
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack(spacing: 8) {
                VStack {
                    ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                        ButtonTextOnly(style: style,
                                       size: size,
                                       text: "Text",
                                       isDisabled: .constant(false),
                                       action: {})
                    })
                }
                
                VStack {
                    ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                        ButtonTextOnly(style: style,
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
