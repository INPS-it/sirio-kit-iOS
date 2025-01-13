//
// SirioMenuSpallaDrawerItemStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioMenuSpallaDrawerItemStyle: ButtonStyle {
    var title: String
    var subtitle: String?
    @Binding var isOpen: Bool    
    @State var isHover = false
    @State var isPressed: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        HStack {
            VStack(alignment: .leading, spacing: Size.MenuSpalla.Drawer.Item.spacingHorizontal){
                SirioText(text: title, typography: Typography.MenuSpalla.Drawer.Item.title)
                    .foregroundStyle(textColor)
                if let subtitle = subtitle {
                    SirioText(text: subtitle, typography: Typography.MenuSpalla.Drawer.Item.subtitle)
                        .foregroundStyle(textColor)
                }
            }
            
            Spacer()
            
            SirioIcon(data: .init(icon: isOpen ? .times : .angleUp))
                .foregroundStyle(iconColor)
                .frame(width: Size.MenuSpalla.Drawer.Item.iconFrame, height: Size.MenuSpalla.Drawer.Item.iconFrame)
                .onTapGesture {
                    self.isOpen.toggle()
                }
        }
        .clipShape(Rectangle())
        .onTapGesture {
            self.isOpen.toggle()
        }
        .padding(.horizontal, Size.MenuSpalla.Drawer.Item.paddingHorizontal)
        .padding(.vertical, Size.MenuSpalla.Drawer.Item.paddingVertical)
        .background(backgroundColor)
        .onHover { isHover in
            self.isHover = isHover
        }
        .onChange(of: configuration.isPressed) { isPressed in
            self.isPressed = isPressed
        }
    }
    
    private var backgroundColor: Color {
        let colorDefault = Color.MenuSpalla.Drawer.Item.Background.default// Open
        let colorPressed = Color.MenuSpalla.Drawer.Item.Background.pressed
        let colorHover = Color.MenuSpalla.Drawer.Item.Background.hover

        if isHover {
            return colorHover
        }
        
        return isPressed ? colorPressed : colorDefault
    }
    
    private var textColor: Color {
        return Color.MenuSpalla.Drawer.Item.text
    }
    
    private var iconColor: Color {
        return Color.MenuSpalla.Drawer.Item.icon
    }
}
