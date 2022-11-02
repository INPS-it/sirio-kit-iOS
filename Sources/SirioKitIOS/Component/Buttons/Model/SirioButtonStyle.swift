//
// SirioButtonStyle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// This struct contains the various styles of buttons provided by Sirio
public struct SirioButtonStyle {
    var background: ColorState
    var border: ColorState? = nil
    var icon: ColorState
    var text: ColorState
    
    public static let primary: SirioButtonStyle = .init(background: Color.SirioButton.Primary.Background.state,
                                                 icon: Color.SirioButton.Primary.Icon.state,
                                                 text: Color.SirioButton.Primary.Text.state)
    
    public static let secondary: SirioButtonStyle = .init(background: Color.SirioButton.Secondary.Background.state,
                                                   icon: Color.SirioButton.Secondary.Icon.state,
                                                   text: Color.SirioButton.Secondary.Text.state)
    
    public static let tertiaryLight: SirioButtonStyle = .init(background: Color.SirioButton.TertiaryLight.Background.state,
                                                       border: Color.SirioButton.TertiaryLight.Border.state,
                                                       icon: Color.SirioButton.TertiaryLight.Icon.state,
                                                       text: Color.SirioButton.TertiaryLight.Text.state)
    
    public static let tertiaryDark: SirioButtonStyle = .init(background: Color.SirioButton.TertiaryDark.Background.state,
                                                      border: Color.SirioButton.TertiaryDark.Border.state,
                                                      icon: Color.SirioButton.TertiaryDark.Icon.state,
                                                      text: Color.SirioButton.TertiaryDark.Text.state)
    
    public static let danger: SirioButtonStyle = .init(background: Color.SirioButton.Danger.Background.state,
                                                icon: Color.SirioButton.Danger.Icon.state,
                                                text: Color.SirioButton.Danger.Text.state)
    
    public static let ghost: SirioButtonStyle = .init(background: Color.SirioButton.Ghost.Background.state,
                                               icon: Color.SirioButton.Ghost.Icon.state,
                                               text: Color.SirioButton.Ghost.Text.state)
}

