//
// ButtonStyle+Extension.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI

extension ButtonStyle {
    func getSirioButtonBackgroundColor(hierarchy: SirioButtonHierarchy, isDisabled: Bool, isPressed: Bool) -> Color {
        if isDisabled {
            return hierarchy.theme.background.disabled
        }
        
        let backgroundColor: Color = isPressed ? hierarchy.theme.background.pressed : hierarchy.theme.background.default
        
        return backgroundColor
    }
    
    func getSirioButtonIconColor(hierarchy: SirioButtonHierarchy, isDisabled: Bool, isPressed: Bool) -> Color {
        if isDisabled {
            return hierarchy.theme.icon.disabled
        } else if isPressed {
            return hierarchy.theme.icon.pressed
        }
        return hierarchy.theme.icon.default
    }
    
    func getSirioButtonTextColor(hierarchy: SirioButtonHierarchy, isDisabled: Bool, isPressed: Bool) -> Color {
        if isDisabled {
            return hierarchy.theme.text.disabled
        } else if isPressed {
            return hierarchy.theme.text.pressed
        }
        return hierarchy.theme.text.default
    }
    
    func getSirioButtonBorderColor(hierarchy: SirioButtonHierarchy, isDisabled: Bool, isPressed: Bool) -> Color {
        if let border = hierarchy.theme.border {
            if isDisabled {
                return border.disabled
            }
            
            let backgroundColor: Color = isPressed ? border.pressed : border.default
            
            return backgroundColor
        }
        return Color.clear
        
    }
}
