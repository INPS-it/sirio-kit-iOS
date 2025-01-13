//
// SirioMenuSpallaStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioMenuSpallaItemLevelStyle {
    public var text: ColorState
    public var background: ColorState
    public var vLine: ColorState
    public var hLine: ColorState
    public var icon: ColorState? = nil
    
    public static let first: SirioMenuSpallaItemLevelStyle = .init(text: Color.MenuSpalla.Item.PrimoLivello.Text.state,
                                                                   background:  Color.MenuSpalla.Item.PrimoLivello.Background.state,
                                                                   vLine: Color.MenuSpalla.Item.PrimoLivello.VLine.state,
                                                                   hLine: Color.MenuSpalla.Item.PrimoLivello.HLine.state,
                                                                   icon: Color.MenuSpalla.Item.PrimoLivello.Icon.state)
    
    
    public static let second: SirioMenuSpallaItemLevelStyle = .init(text: Color.MenuSpalla.Item.PrimoLivello.Text.state,
                                                                    background: Color.MenuSpalla.Item.SecondoLivello.Background.state,
                                                                    vLine: Color.MenuSpalla.Item.SecondoLivello.VLine.state,
                                                                    hLine: Color.MenuSpalla.Item.SecondoLivello.HLine.state,
                                                                    icon: Color.MenuSpalla.Item.SecondoLivello.Icon.state)
    
    
    public static let third: SirioMenuSpallaItemLevelStyle = .init(text: Color.MenuSpalla.Item.PrimoLivello.Text.state,
                                                                   background: Color.MenuSpalla.Item.TerzoLivello.Background.state,
                                                                   vLine: Color.MenuSpalla.Item.TerzoLivello.VLine.state,
                                                                   hLine: Color.MenuSpalla.Item.TerzoLivello.HLine.state)
}
