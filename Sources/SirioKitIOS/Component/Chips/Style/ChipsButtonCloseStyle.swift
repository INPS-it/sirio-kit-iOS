//
// ChipsStyleButtonClose.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Chips with button close style
struct ChipsButtonCloseStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var icon: AwesomeIcon
    @Binding var isDisabled: Bool
    
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        SirioIcon(data: .init(icon: icon))
            .frame(width: Size.Chips.Close.Icon.frame, height: Size.Chips.Close.Icon.frame)
            .padding(Size.Chips.Close.Icon.padding)
            .foregroundColor(getIconColor(configuration: configuration))
            .background(getCircleBackgroundColor(configuration: configuration))
            .clipShape(Circle())
            .overlay(Circle().stroke(circleBorderColor, lineWidth: Size.Chips.borderWidth))
            .onHover { isHover in
                self.isHover = isHover
            }
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.Chips.Background.disabled
        } else if isHover {
            return Color.Chips.WithClose.Background.hover
        } else if configuration.isPressed {
            return Color.Chips.WithClose.Background.pressed
        }
        return Color.Chips.WithClose.Background.default
    }
    
    private func getIconColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.Chips.Text.disabled
        }
        return Color.Chips.WithClose.Icon.default
    }
    
    private func getCircleBackgroundColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.clear
        } else if configuration.isPressed {
            return Color.Chips.WithClose.Circle.Background.pressed
        }
        return Color.Chips.WithClose.Circle.Background.default
    }
    
    private var circleBorderColor: Color {
        isDisabled ? Color.clear : Color.Chips.WithClose.Circle.Border.default
    }
}
