//
// FabIconLabelStyle.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Fab with icon and label
struct FabIconLabelStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var data: FabData
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 0) {
            SirioIcon(data: .init(icon: data.icon))
                .foregroundColor(color)
                .frame(width: Size.Fab.IconLabel.frame, height: Size.Fab.IconLabel.frame)
            
            SirioText(text: data.text ?? "", typography: Typography.Fab.style)
                .foregroundColor(color)
                .padding(.leading, Size.Fab.IconLabel.paddingLeading)
            
        }
        .padding(.horizontal, Size.Fab.IconLabel.paddingHorizontal)
        .padding(.vertical, Size.Fab.IconLabel.paddingVertical)
        .background(getBackgroundColor(configuration: configuration))
        .cornerRadius(Size.Fab.IconLabel.cornerRadius)
        .shadow(color: StyleDictionaryBoxShadow.elevation01.0.color,
                radius: StyleDictionaryBoxShadow.elevation01.3.cgFloat,
                x: StyleDictionaryBoxShadow.elevation01.1.cgFloat,
                y: StyleDictionaryBoxShadow.elevation01.2.cgFloat)
        .onHover { isHover in
            self.isHover = isHover
        }
    }

    func getBackgroundColor(configuration: Self.Configuration) -> Color {
        
        let colorDefault: Color = colorScheme == .dark ? Color.Fab.Background.Default.dark : Color.Fab.Background.Default.light
        let colorPressed: Color = colorScheme == .dark ? Color.Fab.Background.Pressed.dark : Color.Fab.Background.Pressed.light

        let backgroundColor: Color = configuration.isPressed ? colorPressed : colorDefault
        let isHoverColor: Color = colorScheme == .dark ? Color.Fab.Background.Hover.dark : Color.Fab.Background.Hover.light
        return isHover ? isHoverColor : backgroundColor
    }
    
    private var color: Color {
        colorScheme == .dark ? Color.Fab.Icon.Default.dark : Color.Fab.Icon.Default.light
    }
    
}
