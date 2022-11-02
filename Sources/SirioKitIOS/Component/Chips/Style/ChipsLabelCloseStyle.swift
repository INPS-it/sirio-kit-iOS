//
// ChipsStyleLabelClose.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Chips with label and button close style
struct ChipsLabelCloseStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    @Binding var isDisabled: Bool
    var onTapClose: (() -> Void)?

    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 8) {
            SirioText(text: text, typography: Typography.Chips.style)
                .foregroundColor(getTextColor(configuration: configuration))
                .lineLimit(1)
            
            ChipsButtonClose(isDisabled: $isDisabled, action: {
                onTapClose?()
            })
            .frame(width: Size.Chips.Close.Button.frame, height: Size.Chips.Close.Button.frame)
        }
        .padding(.leading, Size.Chips.paddingLeading)
        .padding(.trailing, Size.Chips.paddingTrailing)
        .padding(.vertical, Size.Chips.paddingVertical)
        .background(getBackgroundColor(configuration: configuration))
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
            return Color.Chips.WithClose.Background.hover
        } else if configuration.isPressed {
            return Color.Chips.WithClose.Background.pressed
        }
        return Color.Chips.WithClose.Background.default
    }
    
    private func getTextColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.Chips.Text.disabled
        }
        return Color.Chips.WithClose.Text.default
    }
}
