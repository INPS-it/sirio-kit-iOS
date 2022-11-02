//
// ButtonIconOnly.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Button Icon Only
/// - Parameters:
///   - style: The [SirioButtonStyle]
///   - size: The [SirioButtonSize]
///   - icon: The button icon
///   - isDisabled: Whether the button is disabled
///   - action: Callback that is executed when the button is tapped
public struct ButtonIconOnly: View {
    
    private var style: SirioButtonStyle // primary, secondary...
    private var size: SirioButtonSize // large, medium, small
    private var icon: AwesomeIcon
    @Binding private var isDisabled: Bool
    private var action: () -> Void
    
    public init(style: SirioButtonStyle,
                size: SirioButtonSize,
                icon: AwesomeIcon,
                isDisabled: Binding<Bool> = .constant(false),
                action: @escaping () -> Void){
        self.style = style
        self.size = size
        self.icon = icon
        self._isDisabled = isDisabled
        self.action = action
    }
    
    public var body: some View {
        
        Button(action: {
            action()
        }, label: {
            // Inside style
        })
        .disabled(isDisabled)
        .buttonStyle(SirioButtonIconOnlyStyle(style: style, size: size, icon: icon, isDisabled: $isDisabled))
    }
}

struct ButtonIconOnly_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 8) {
                TrilogyButtonsIconOnly(type: "Primary", style: .primary)
                TrilogyButtonsIconOnly(type: "Secondary", style: .secondary)
                TrilogyButtonsIconOnly(type: "Tertiary Light", style: .tertiaryLight)
                TrilogyButtonsIconOnly(type: "Tertiary Dark", style: .tertiaryDark)
                TrilogyButtonsIconOnly(type: "Danger", style: .danger)
                TrilogyButtonsIconOnly(type: "Ghost", style: .ghost)
            }
        })
    }
}


struct TrilogyButtonsIconOnly: View {
    var type: String
    var style: SirioButtonStyle
    
    var body: some View {
        VStack(spacing: 8) {
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack {
                ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                    ButtonIconOnly(style: style,
                                   size: size,
                                   icon: .arrowRight,
                                   isDisabled: .constant(false),
                                   action: {})
                })
            }
            
            HStack {
                ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                    ButtonIconOnly(style: style,
                                   size: size,
                                   icon: .arrowRight,
                                   isDisabled: .constant(true),
                                   action: {})
                })
            }
        }
        .padding()
    }
}
