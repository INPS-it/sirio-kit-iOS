//
// SirioMenuSpallaItemStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioMenuSpallaItemStyle: ButtonStyle {
    @ObservedObject var item: SirioMenuSpallaItemData
    @Binding var isSelected: Bool
    @State var isHover = false
    @State var isPressed: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(spacing: Size.zero) {
            Rectangle()
                .frame(height: Size.MenuSpalla.Item.frameLineHorizontal)
                .foregroundStyle(hLineColor)
            
            HStack(spacing: Size.zero) {
                Rectangle()
                    .frame(width: Size.MenuSpalla.Item.frameLineVertical)
                    .frame(maxHeight: .infinity)
                    .foregroundStyle(vLineColor)
                
                SirioText(text: item.value, typography: Typography.MenuSpalla.Item.text)
                    .foregroundStyle(textColor)
                    .padding(.leading, paddingLeading)
                
                Spacer()
                
                if let tagText = item.tagText, item.level == .first {
                    SirioTag(type: item.isDisabled ? .gray : .green, text: tagText)
                        .padding(.trailing, Size.MenuSpalla.Item.paddingTrailing)
                } else if item.hasSubItems && item.level != .third {
                    SirioIcon(data: isSelected ? .init(icon: .angleUp) : .init(icon: .angleDown))
                        .foregroundStyle(iconColor)
                        .frame(width: Size.MenuSpalla.Item.iconFrame, height: Size.MenuSpalla.Item.iconFrame)
                        .padding(.trailing, Size.MenuSpalla.Item.paddingTrailing)
                }
            }
        }
        .frame(height: Size.MenuSpalla.Item.height)
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .background(backgroundColor)
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private var paddingLeading: CGFloat {
        switch item.level {
        case .first:
            return Size.MenuSpalla.Item.paddingLeadingFirstLevel
        case .second:
            return Size.MenuSpalla.Item.paddingLeadingSecondLevel
        case .third:
            return Size.MenuSpalla.Item.paddingLeadingThirdLevel
        case .unknown: // Never
            return Size.MenuSpalla.Item.paddingLeadingThirdLevel
        }
        
    }
    
    private var style: SirioMenuSpallaItemLevelStyle {
        switch item.level {
        case .first:
            return .first
        case .second:
            return .second
        case .third:
            return .third
        case .unknown: // Never
            return .third
        }
    }
    
    private var textColor: Color {
        let colorDefault = style.text.default
        let colorDisabled = style.text.disabled
        let colorPressed = style.text.pressed
        let colorHover = style.text.hover
        
        
        if item.isDisabled {
            return colorDisabled
        }
        
        if isHover {
            return colorHover
        }
        
        if isSelected {
            return colorPressed
        }
        
        if !item.hasSubItems {
            return isPressed ? colorPressed : colorDefault
        }
        
        return colorDefault
    }
    
    private var backgroundColor: Color {
        let colorDefault = style.background.default
        let colorDisabled = style.background.disabled
        let colorPressed = style.background.pressed
        let colorHover = style.background.hover
        
        
        if item.isDisabled {
            return colorDisabled
        }
        
        if isHover {
            return colorHover
        }
        
        if isSelected {
            return colorPressed
        }
        
        if !item.hasSubItems {
            return isPressed ? colorPressed : colorDefault
        }
        
        return colorDefault
    }
    
    private var vLineColor: Color {
        let colorDefault = style.vLine.default
        let colorDisabled = style.vLine.disabled
        let colorPressed = style.vLine.pressed
        let colorHover = style.vLine.hover
        
        if item.isDisabled {
            return colorDisabled
        }
        
        if isHover {
            return colorHover
        }
        
        if isSelected {
            if item.hasSubItems {
                return StyleDictionaryColor.aliasTextColorPrimaryLight50.color
            }
            return colorPressed
        }
        
        if !item.hasSubItems {
            return isPressed ? colorPressed : colorDefault
        }
        
        return colorDefault
    }
    
    
    private var hLineColor: Color {
        let colorDefault = style.hLine.default
        let colorDisabled = style.hLine.disabled
        
        return item.isDisabled ? colorDisabled : colorDefault
    }
    
    private var iconColor: Color {
        guard let iconStyle = style.icon else {
            return Color.clear
        }
        let colorDefault = iconStyle.default
        let colorDisabled = iconStyle.disabled
        let colorPressed = iconStyle.pressed
        let colorHover = iconStyle.hover
        
        if item.isDisabled {
            return colorDisabled
        }
        
        if isHover {
            return colorHover
        }
        
        if isSelected {
            return colorPressed
        }
        
        if !item.hasSubItems {
            return isPressed ? colorPressed : colorDefault
        }
        
        return colorDefault
    }
}
