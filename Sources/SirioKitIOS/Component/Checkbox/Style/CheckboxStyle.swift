//
// CheckboxStyle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage the Checkbox style
struct CheckboxStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var text: String?
    var isChecked: Bool
    @Binding var isDisabled: Bool
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.Checkbox.padding) {
            VStack {
                RoundedRectangle(cornerRadius: Size.Checkbox.cornerRadius)
                    .strokeBorder(colorShape, lineWidth: Size.Checkbox.border)
                    .frame(width: Size.Checkbox.frameDefault, height: Size.Checkbox.frameDefault)
                    .overlay(isChecked ? checked : nil, alignment: .center)
            }
            .frame(width: Size.Checkbox.touchArea, height: Size.Checkbox.touchArea)
            
            if let text = text {
                SirioText(text: text, typography: Typography.CheckBox.style)
                    .foregroundColor(colorText)
            }
        }
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private var checked: some View {
        SirioIcon(data: .init(icon: .check))
            .frame(width: Size.Checkbox.frameChecked, height: Size.Checkbox.frameChecked, alignment: .center)
            .foregroundColor(colorShape)
    }
    
    private var colorText: Color {
        if isDisabled {
            return Color.Checkbox.Text.disabled
        } else if isHover {
            return Color.Checkbox.Text.hover
        } else if isChecked {
            return Color.Checkbox.Text.checked
        }
        return Color.Checkbox.Text.default
    }
    
    private var colorShape: Color {
        if isDisabled {
            return Color.Checkbox.Check.disabled
        } else if isHover {
            return Color.Checkbox.Check.hover
        } else if isChecked {
            return Color.Checkbox.Check.checked
        }
        return Color.Checkbox.Check.default
    }
}
