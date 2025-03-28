//
// SirioFloatingActionButtonStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A struct that defines the style for the FloatingActionButton component.
struct SirioFloatingActionButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var colorScheme
    var data: SirioFloatingActionButtonData
    
    private var isExtended: Bool {
        data.text != nil
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        Group {
            if isExtended {
                extendedButton(configuration: configuration)
            } else {
                compressedButton(configuration: configuration)
            }
        }
    }
    
    private func extendedButton(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.zero) {
            SirioIcon(data: .init(icon: data.icon))
                .foregroundColor(iconColor)
                .frame(width: Size.Fab.IconLabel.frame, height: Size.Fab.IconLabel.frame)
            
            SirioText(text: data.text ?? "", typography: Typography.Fab.style)
                .foregroundColor(iconColor)
                .padding(.leading, Size.Fab.IconLabel.paddingLeading)
        }
        .padding(.horizontal, Size.Fab.IconLabel.paddingHorizontal)
        .padding(.vertical, Size.Fab.IconLabel.paddingVertical)
        .background(getBackgroundColor(configuration: configuration))
        .cornerRadius(Size.Fab.IconLabel.cornerRadius)
        .shadow(color: SirioFoundationBoxShadow.elevation01.0.color,
                radius: SirioFoundationBoxShadow.elevation01.3.cgFloat,
                x: SirioFoundationBoxShadow.elevation01.1.cgFloat,
                y: SirioFoundationBoxShadow.elevation01.2.cgFloat)
    }
    
    private func compressedButton(configuration: Self.Configuration) -> some View {
        VStack {
            SirioIcon(data: .init(icon: data.icon))
                .foregroundColor(iconColor)
                .frame(width: Size.Fab.OnlyIcon.frame, height: Size.Fab.OnlyIcon.frame)
            
            configuration.label
        }
        .frame(width: buttonSize, height: buttonSize)
        .background(getBackgroundColor(configuration: configuration))
        .cornerRadius(Size.Fab.OnlyIcon.cornerRadius)
        .shadow(color: SirioFoundationBoxShadow.elevation01.0.color,
                radius: SirioFoundationBoxShadow.elevation01.3.cgFloat,
                x: SirioFoundationBoxShadow.elevation01.1.cgFloat,
                y: SirioFoundationBoxShadow.elevation01.2.cgFloat)
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        let defaultColor: Color = colorScheme == .dark ? Color.Fab.Background.Default.dark : Color.Fab.Background.Default.light
        let pressedColor: Color = colorScheme == .dark ? Color.Fab.Background.Pressed.dark : Color.Fab.Background.Pressed.light
        return configuration.isPressed ? pressedColor : defaultColor
    }
    
    private var iconColor: Color {
        colorScheme == .dark ? Color.Fab.Icon.Default.dark : Color.Fab.Icon.Default.light
    }
    
    private var textColor: Color {
        colorScheme == .dark ? Color.Fab.Text.Default.dark : Color.Fab.Text.Default.light
    }
    
    private var buttonSize: CGFloat {
        
        switch data.size {
        case .small: return 40
        case .regular: return 56
        default:
            return 40
        }
    }
}
