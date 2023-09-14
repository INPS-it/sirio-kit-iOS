//
// PaginationTileStyle.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage single Tile style
struct PaginationTileStyle: ButtonStyle {
    var number: Int
    var isSelected: Bool
    var isDisabled: Bool
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        SirioText(text: "\(number)", typography: Typography.Pagination.number)
            .frame(width: Size.Pagination.Button.width, height: Size.Pagination.Button.height)
            .lineLimit(1)
            .foregroundColor(getTextColor(configuration: configuration))
            .background(getBackgroundColor(configuration: configuration))
            .cornerRadius(Size.Pagination.Button.cornerRadius)
            .onHover { isHover in
                self.isHover = isHover
            }
    }
    
    func getBackgroundColor(configuration: Self.Configuration) -> Color {
        let `default` = Color.Pagination.Button.Background.default
        let disabled = Color.Pagination.Button.Background.disabled
        let hover = Color.Pagination.Button.Background.hover
        let active = Color.Pagination.Button.Background.active
        
        if isDisabled {
            return disabled
        }
        
        if isSelected {
            return active
        }
        
        let backgroundColor: Color = configuration.isPressed ? active : `default`
        
        return isHover ? hover : backgroundColor
    }
    
    func getTextColor(configuration: Self.Configuration) -> Color {
        let `default` = Color.Pagination.Button.Text.default
        let disabled = Color.Pagination.Button.Text.disabled
        let hover = Color.Pagination.Button.Text.hover
        let active = Color.Pagination.Button.Text.active
        
        if isDisabled {
            return disabled
        }
        
        if isSelected {
            return active
        }
        
        let backgroundColor: Color = configuration.isPressed ? active : `default`
        
        return isHover ? hover : backgroundColor
    }
}
