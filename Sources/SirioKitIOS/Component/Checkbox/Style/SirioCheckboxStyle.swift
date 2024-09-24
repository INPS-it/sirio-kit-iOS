//
// SirioCheckboxStyle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for Checkbox component
struct SirioCheckboxStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var text: String?
    var isChecked: Bool
    @Binding var isDisabled: Bool
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.Checkbox.padding) {
            VStack {
                RoundedRectangle(cornerRadius: Size.Checkbox.cornerRadius)
                    .strokeBorder(getColor(for: .border), lineWidth: Size.Checkbox.border)
                    .background(getColor(for: .background).cornerRadius(Size.Checkbox.cornerRadius))
                    .frame(width: Size.Checkbox.frameDefault, height: Size.Checkbox.frameDefault)
                    .overlay(isChecked ? checked : nil, alignment: .center)
            }
            
            if let text = text {
                SirioText(text: text, typography: Typography.CheckBox.style)
                    .foregroundColor(getColor(for: .text))
            }
        }
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private var checked: some View {
        SirioIcon(data: .init(icon: .check))
            .frame(width: Size.Checkbox.frameChecked, height: Size.Checkbox.frameChecked, alignment: .center)
            .foregroundColor(getColor(for: .icon))
    }
    
    private func getColor(for component: CheckboxComponent) -> Color {
        switch component {
        case .text:
            if isDisabled {
                return Color.Checkbox.Text.disabled
            } else if isHover {
                return Color.Checkbox.Text.hover
            } else if isChecked {
                return Color.Checkbox.Text.checked
            }
            return Color.Checkbox.Text.default
            
        case .icon:
            return Color.Checkbox.Icon.default
            
        case .border:
            if isDisabled {
                return Color.Checkbox.Border.disabled
            } else if isHover {
                return Color.Checkbox.Border.hover
            } else if isChecked {
                return Color.Checkbox.Border.checked
            }
            return Color.Checkbox.Border.default
                        
        case .background:
            if isDisabled {
                return Color.Checkbox.Background.disabled
            } else {
                return Color.Checkbox.Background.default
            }
        }
    }
    
    enum CheckboxComponent {
        case text, border, background, icon
    }
}
