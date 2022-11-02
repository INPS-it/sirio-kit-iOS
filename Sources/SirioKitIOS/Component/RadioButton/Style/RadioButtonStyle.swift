//
// RadioButtonStyle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage RadioButton style
struct RadioButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var text: String?
    var isChecked: Bool
    @Binding var isDisabled: Bool
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(alignment: .center, spacing: Size.RadioButton.padding) {

            VStack {
                Circle()
                    .strokeBorder(colorCircle, lineWidth: Size.RadioButton.border)
                    .frame(width: Size.RadioButton.circleDefault, height: Size.RadioButton.circleDefault)
                    .overlay(isChecked ? checkedCircle : nil, alignment: .center)
            }
            .frame(width: Size.RadioButton.touchArea, height: Size.RadioButton.touchArea)

            if let text = text {
                SirioText(text: text, typography: Typography.RadioButton.style)
                    .foregroundColor(colorText)
            }
        }
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private var checkedCircle: some View {
        Circle()
            .frame(width: Size.RadioButton.circleChecked, height: Size.RadioButton.circleChecked, alignment: .center)
            .foregroundColor(colorCircle)
    }
    
    private var colorText: Color {
        if isDisabled {
            return Color.RadioButton.Text.disabled
        } else if isHover {
            return Color.RadioButton.Text.hover
        } else if isChecked {
            return Color.RadioButton.Text.checked
        }
        return Color.RadioButton.Text.default
    }
    
    private var colorCircle: Color {
        if isDisabled {
            return Color.RadioButton.Circle.disabled
        } else if isHover {
            return Color.RadioButton.Circle.hover
        } else if isChecked {
            return Color.RadioButton.Circle.checked
        }
        return Color.RadioButton.Circle.default
    }
}
