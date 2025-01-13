//
// SirioAccordionStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for Accordion component
struct SirioAccordionStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    var isOpen: Bool
    @Binding var isDisabled: Bool
    var withBorder: Bool = true
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            HStack {
                SirioText(text: text, typography: Typography.Accordion.style)
                    .foregroundColor(textColor)
                    .lineLimit(1)
                
                Spacer()
                
                SirioIcon(data: .init(icon: isOpen ? .angleUp : .angleDown))
                    .frame(width: Size.Accordion.Icon.frame,
                           height: Size.Accordion.Icon.frame)
                    .foregroundColor(iconColor)
            }
            .frame(height: Size.Accordion.sectionHeight)
            .padding(.horizontal, Size.Accordion.paddingHorizontal)
            .border(borderColor, width: Size.Accordion.borderWidth)
        }
        .background(backgroundColor)
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private var borderColor: Color {
        if withBorder {
            return colorScheme == .dark ? Color.Accordion.Border.dark : Color.Accordion.Border.light
        }
        return Color.clear
    }
    
    private var backgroundColor: Color {
        let hoverColor: Color = colorScheme == .dark ? Color.Accordion.Background.Hover.dark : Color.Accordion.Background.Hover.light
        let defaultColor: Color = colorScheme == .dark ? Color.Accordion.Background.Default.dark : Color.Accordion.Background.Default.light
        let activeColor: Color = colorScheme == .dark ? Color.Accordion.Background.Active.dark : Color.Accordion.Background.Active.light

        if isDisabled {
            return Color.Accordion.Background.disabled
        } else if isOpen {
            return isHover ? hoverColor : activeColor
        } else {
            return isHover ? hoverColor : defaultColor
        }
    }
    
    private var textColor: Color {
        if isDisabled {
            return Color.Accordion.Text.disabled
        } else {
            return colorScheme == .dark ? Color.Accordion.Text.dark : Color.Accordion.Text.light
        }
        
    }
    
    private var iconColor: Color {
        if isDisabled {
            return Color.Accordion.Icon.disabled
        } else {
            return colorScheme == .dark ? Color.Accordion.Icon.dark : Color.Accordion.Icon.light
        }
    }
}
