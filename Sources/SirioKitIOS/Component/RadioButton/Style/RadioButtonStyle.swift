//
// RadioButtonStyle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
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
        HStack(alignment: .center, spacing: Size.RadioButton.spacing) {
            Circle()
                .strokeBorder(getColor(for: .border), lineWidth: Size.RadioButton.border)
                .background(getColor(for: .background).cornerRadius(Size.RadioButton.radius))
                .frame(width: Size.RadioButton.circleDefault, height: Size.RadioButton.circleDefault)
                .foregroundColor(Color.red)
                .overlay(isChecked ? checkedCircle : nil, alignment: .center)
                .onHover { isHover in
                    self.isHover = isHover
                }
            
            if let text = text {
                SirioText(text: text, typography: Typography.RadioButton.style)
                    .foregroundColor(getColor(for: .text))
            }
        }
    }
    
    private var checkedCircle: some View {
        Circle()
            .frame(width: Size.RadioButton.circleChecked, height: Size.RadioButton.circleChecked, alignment: .center)
            .foregroundColor(getColor(for: .circle))
    }
    
    private func getColor(for component: RadioButtonComponent) -> Color {
        switch component {
        case .text:
            if isDisabled {
                return Color.RadioButton.Text.disabled
            } else if isHover {
                return Color.RadioButton.Text.hover
            } else if isChecked {
                return Color.RadioButton.Text.checked
            }
            return Color.RadioButton.Text.default
            
        case .circle:
            if isDisabled {
                return Color.RadioButton.Circle.disabled
            } else if isHover {
                return Color.RadioButton.Circle.hover
            } else if isChecked {
                return Color.RadioButton.Circle.checked
            }
            return Color.RadioButton.Circle.default
            
        case .background:
            return isDisabled ? Color.RadioButton.Background.disabled : Color.RadioButton.Background.default
            
        case .border:
            if isDisabled {
                return Color.RadioButton.Border.disabled
            } else if isHover {
                return Color.RadioButton.Border.hover
            } else if isChecked {
                return Color.RadioButton.Border.checked
            }
            return Color.RadioButton.Border.default
        }
    }
    
    enum RadioButtonComponent {
        case text, circle, background, border
    }
}
