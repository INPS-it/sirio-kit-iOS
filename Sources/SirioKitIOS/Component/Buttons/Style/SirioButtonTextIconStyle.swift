//
// ButtonTextIconStyle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Sirio button with text and icon style
struct SirioButtonTextIconStyle: ButtonStyle {
    var style: SirioButtonStyle
    var size: SirioButtonSize
    var text: String
    var icon: AwesomeIcon
    @Binding var isDisabled: Bool
    var isFullSize: Bool
    @State var isHover = false
    @State var isPressed = false
    
    @State var colorText: Color
    @State var colorIcon: Color
    @State var colorBackground: Color
    @State var colorBorder: Color
    
    init(style: SirioButtonStyle, size: SirioButtonSize, text: String, icon: AwesomeIcon, isDisabled: Binding<Bool>, isFullSize: Bool){
        self.style = style
        self.size = size
        self.text = text
        self.icon = icon
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        
        // Set default color by state
        self.colorText = isDisabled.wrappedValue ? self.style.text.disabled : self.style.text.default
        self.colorIcon = isDisabled.wrappedValue ? self.style.icon.disabled : self.style.icon.default
        self.colorBackground = isDisabled.wrappedValue ? self.style.background.disabled : self.style.background.default
        
        if let border = self.style.border {
            self.colorBorder = isDisabled.wrappedValue ? border.disabled : border.default
        } else {
            self.colorBorder = .clear
        }
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.Button.padding) {
            if isFullSize {
                Spacer()
            }
            
            SirioText(text: text, typography: .label_md_700)
                .lineLimit(1)
                .foregroundColor(colorText)
            
            SirioIcon(icon: icon)
                .frame(width: iconFrame, height: iconFrame)
                .foregroundColor(colorIcon)

            if isFullSize {
                Spacer()
            }
        }
        .contentShape(Rectangle())
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .background(colorBackground)
        .cornerRadius(Size.Button.Border.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Size.Button.Border.cornerRadius)
                .stroke(colorBorder, lineWidth: Size.Button.Border.width)
        )
        .onHover { isHover in
            self.isHover = isHover
        }
        .onChange(of: configuration.isPressed) { isPressed in
            self.isPressed = isPressed
            self.colorText = getSirioButtonTextColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
            self.colorIcon = getSirioButtonIconColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
            self.colorBackground = getSirioButtonBackgroundColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
            self.colorBorder = getSirioButtonBorderColor(style: style, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
        }
        .onChange(of: isDisabled) { isDisabled in
            self.setColor(isDisabled: isDisabled)
        }
    }
    
    private func setColor(isDisabled: Bool) {
        // Set default color by state
        self.colorText = isDisabled ? self.style.text.disabled : self.style.text.default
        self.colorIcon = isDisabled ? self.style.icon.disabled : self.style.icon.default
        self.colorBackground = isDisabled ? self.style.background.disabled : self.style.background.default
        
        if let border = self.style.border {
            self.colorBorder = isDisabled ? border.disabled : border.default
        } else {
            self.colorBorder = .clear
        }
    }
    
    private var iconFrame: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.TextIcon.frame
        case .medium:
            return Size.Button.Medium.TextIcon.frame
        case .small:
            return Size.Button.Small.TextIcon.frame
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.TextIcon.paddingHorizontal
        case .medium:
            return Size.Button.Medium.TextIcon.paddingHorizontal
        case .small:
            return Size.Button.Small.TextIcon.paddingHorizontal
        }
    }
    
    private var paddingVertical: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.TextIcon.paddingVertical
        case .medium:
            return Size.Button.Medium.TextIcon.paddingVertical
        case .small:
            return Size.Button.Small.TextIcon.paddingVertical
        }
    }
}
