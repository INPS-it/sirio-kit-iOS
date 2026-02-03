//
// SirioButtonHierarchy.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// This struct defines the various hierarchies for buttons provided by Sirio.
public enum SirioButtonHierarchy {
    case primary
    case secondary
    case tertiaryLight
    case tertiaryDark
    case danger
    @available(*, deprecated, renamed: "ghostLight", message: "Use 'ghostLight' or 'ghostDark' instead.")
    case ghost
    case ghostLight
    case ghostDark
    
    var theme: SirioButtonTheme {
        switch self {
        case .primary:
            return SirioButtonTheme(background: Color.SirioButton.Primary.Background.state,
                         icon: Color.SirioButton.Primary.Icon.state,
                         text: Color.SirioButton.Primary.Text.state)
        case .secondary:
            return SirioButtonTheme(background: Color.SirioButton.Secondary.Background.state,
                         icon: Color.SirioButton.Secondary.Icon.state,
                         text: Color.SirioButton.Secondary.Text.state)
        case .tertiaryLight:
            return SirioButtonTheme(background: Color.SirioButton.TertiaryLight.Background.state,
                         border: Color.SirioButton.TertiaryLight.Border.state,
                         icon: Color.SirioButton.TertiaryLight.Icon.state,
                         text: Color.SirioButton.TertiaryLight.Text.state)
        case .tertiaryDark:
            return SirioButtonTheme(background: Color.SirioButton.TertiaryDark.Background.state,
                         border: Color.SirioButton.TertiaryDark.Border.state,
                         icon: Color.SirioButton.TertiaryDark.Icon.state,
                         text: Color.SirioButton.TertiaryDark.Text.state)
        case .danger:
            return SirioButtonTheme(background: Color.SirioButton.Danger.Background.state,
                         icon: Color.SirioButton.Danger.Icon.state,
                         text: Color.SirioButton.Danger.Text.state)
        case .ghost, .ghostLight:
            return SirioButtonTheme(background: Color.SirioButton.GhostLight.Background.state,
                         icon: Color.SirioButton.GhostLight.Icon.state,
                         text: Color.SirioButton.GhostLight.Text.state)
            
        case .ghostDark:
            return SirioButtonTheme(
                background: Color.SirioButton.GhostDark.Background.state,
                         icon: Color.SirioButton.GhostDark.Icon.state,
                         text: Color.SirioButton.GhostDark.Text.state)
            
        }
    }
    
    struct SirioButtonTheme {
        var background: ColorState
        var border: ColorState? = nil
        var icon: ColorState
        var text: ColorState
    }
}

// MARK: - Manual CaseIterable con esclusione del case deprecato
extension SirioButtonHierarchy: CaseIterable {
    public static var allCases: [SirioButtonHierarchy] {
        [
            .primary,
            .secondary,
            .tertiaryLight,
            .tertiaryDark,
            .danger,
            .ghostLight,
            .ghostDark
        ]
    }
}
