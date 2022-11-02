//
// ChipsStyleLabelIcon.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Chips with label and icon style
struct ChipsLabelIconStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    var icon: AwesomeIcon
    var isActive: Bool
    @Binding var isDisabled: Bool
    
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 8) {
            SirioIcon(icon: icon)
                .frame(width: Size.Chips.Icon.frame, height: Size.Chips.Icon.frame)
                .foregroundColor(getTextAndIconColor(configuration: configuration))
            SirioText(text: text, typography: Typography.Chips.style)
                .foregroundColor(getTextAndIconColor(configuration: configuration))
                .lineLimit(1)
        }
        .padding(.horizontal, Size.Chips.paddingHorizontal)
        .padding(.vertical, Size.Chips.paddingVertical * 2)
        .background(getBackgroundColor(configuration: configuration))
        .overlay(content: {
            if !self.isActive && !isDisabled {
                RoundedRectangle(cornerRadius: Size.Chips.cornerRadiusOverlay)
                    .stroke(getBorderColor(configuration: configuration), lineWidth: Size.Chips.borderWidth)
            }
        })
        .cornerRadius(Size.Chips.cornerRadius)
        .frame(height: Size.Chips.height)
        .onHover { isHover in
            self.isHover = isHover
        }
    }
        
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.Chips.Background.disabled
        } else if isHover {
            return isActive ? Color.Chips.Background.activeHover : Color.Chips.Background.disactive
        } else if configuration.isPressed {
            return isActive ? Color.Chips.Background.activePressed : Color.Chips.Background.disactive
        }
        return isActive ? Color.Chips.Background.activeDefault : Color.Chips.Background.disactive
    }
    
    // Used only for disactive state
    private func getBorderColor(configuration: Self.Configuration) -> Color {
        if isHover {
            return Color.Chips.Border.disactiveHover
        } else if configuration.isPressed {
            return Color.Chips.Border.disactivePressed
        }
        return Color.Chips.Border.disactiveDefault
    }
    
    private func getTextAndIconColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.Chips.Text.disabled
        } else if isActive {
            return Color.Chips.Text.active
        } else { // Disactive state
            if isHover {
                return Color.Chips.Text.disactiveHover
            } else if configuration.isPressed {
                return Color.Chips.Text.disactivePressed
            }
            return Color.Chips.Text.disactiveDefault
        }
    }
}
