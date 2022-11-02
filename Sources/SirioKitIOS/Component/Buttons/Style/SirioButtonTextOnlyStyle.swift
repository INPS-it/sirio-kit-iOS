//
// ButtonTextOnlyStyle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Sirio button text only style
struct SirioButtonTextOnlyStyle: ButtonStyle {
    var style: SirioButtonStyle
    var size: SirioButtonSize
    var text: String
    @Binding var isDisabled: Bool
    var isFullSize: Bool
    @State var isHover = false
    @State var isPressed: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            if isFullSize {
                Spacer()
            }
            
            SirioText(text: text, typography: .label_md_700)
                .foregroundColor(getSirioButtonTextColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed))
                .lineLimit(1)
            
            if isFullSize {
                Spacer()
            }
        }
        .contentShape(Rectangle())
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .background(getSirioButtonBackgroundColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed))
        .cornerRadius(Size.Button.Border.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Size.Button.Border.cornerRadius)
                .stroke(getSirioButtonBorderColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed), lineWidth: Size.Button.Border.width)
        )
        .onHover { isHover in
            self.isHover = isHover
        }
        .onChange(of: configuration.isPressed) { isPressed in
            self.isPressed = isPressed
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.Text.paddingHorizontal
        case .medium:
            return Size.Button.Medium.Text.paddingHorizontal
        case .small:
            return Size.Button.Small.Text.paddingHorizontal
        }
    }
    
    private var paddingVertical: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.Text.paddingVertical
        case .medium:
            return Size.Button.Medium.Text.paddingVertical
        case .small:
            return Size.Button.Small.Text.paddingVertical
        }
    }
}

