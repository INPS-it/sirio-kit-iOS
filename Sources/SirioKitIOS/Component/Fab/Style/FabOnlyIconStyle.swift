//
// FabOnlyIconStyle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Fab with icon
struct FabOnlyIconStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var data: FabData
    var size: CGFloat
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            SirioIcon(icon: data.icon)
                .foregroundColor(iconColor)
                .frame(width: Size.Fab.OnlyIcon.frame, height: Size.Fab.OnlyIcon.frame)
            
            configuration.label
        }
        .frame(width: size, height: size)
        .background(getBackgroundColor(configuration: configuration))
        .cornerRadius(Size.Fab.OnlyIcon.cornerRadius)
        .shadow(color: StyleDictionaryBoxShadow.elevation01.0.color,
                radius: StyleDictionaryBoxShadow.elevation01.3.cgFloat,
                x: StyleDictionaryBoxShadow.elevation01.1.cgFloat,
                y: StyleDictionaryBoxShadow.elevation01.2.cgFloat)
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        let colorDefault: Color = colorScheme == .dark ? Color.Fab.Background.Default.dark : Color.Fab.Background.Default.light
        let colorPressed: Color = colorScheme == .dark ? Color.Fab.Background.Pressed.dark : Color.Fab.Background.Pressed.light

        let backgroundColor: Color = configuration.isPressed ? colorPressed : colorDefault
        let isHoverColor: Color = colorScheme == .dark ? Color.Fab.Background.Hover.dark : Color.Fab.Background.Hover.light
        return isHover ? isHoverColor : backgroundColor
    }
    
    private var iconColor: Color {
        colorScheme == .dark ? Color.Fab.Icon.Default.dark : Color.Fab.Icon.Default.light
    }
}
