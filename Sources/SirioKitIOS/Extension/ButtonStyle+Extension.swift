//
// ButtonStyle+Extension.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI

extension ButtonStyle {
    func getSirioButtonBackgroundColor(style: SirioButtonStyle, isDisabled: Bool, isHover: Bool, isPressed: Bool) -> Color {
        if isDisabled {
            return style.background.disabled
        }
        
        let backgroundColor: Color = isPressed ? style.background.pressed : style.background.default
        
        return isHover ? style.background.hover : backgroundColor
    }
    
    func getSirioButtonIconColor(style: SirioButtonStyle, isDisabled: Bool, isHover: Bool, isPressed: Bool) -> Color {
        if isDisabled {
            return style.icon.disabled
        } else if isHover {
            return style.icon.hover
        } else if isPressed {
            return style.icon.pressed
        }
        return style.icon.default
    }
    
    func getSirioButtonTextColor(style: SirioButtonStyle, isDisabled: Bool, isHover: Bool, isPressed: Bool) -> Color {
        if isDisabled {
            return style.text.disabled
        } else if isHover {
            return style.text.hover
        } else if isPressed {
            return style.text.pressed
        }
        return style.text.default
    }
    
    func getSirioButtonBorderColor(style: SirioButtonStyle, isDisabled: Bool, isHover: Bool, isPressed: Bool) -> Color {
        if let border = style.border {
            if isDisabled {
                return border.disabled
            }
            
            let backgroundColor: Color = isPressed ? border.pressed : border.default
            
            return isHover ? border.hover : backgroundColor
        }
        return Color.clear
        
    }
}
