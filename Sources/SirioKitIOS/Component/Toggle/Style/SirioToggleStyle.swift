//
// SirioToggleStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for a custom toggle button
struct SirioToggleStyle: ButtonStyle {
    var text: String?
    var isOn: Bool
    @Binding var isDisabled: Bool
    @State var isHover = false
    
    private let defaultBorderColor: Color = .Toggle.Off.Border.default
    private let defaultCircleColor: Color = .Toggle.Off.Circle.default
    private let defaultTextColor: Color = .Toggle.Off.Text.default
    private let defaultBackgroundColor: Color = .Toggle.Off.Background.default
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.Toggle.spacing) {
            
            VStack {
                RoundedRectangle(cornerRadius: Size.Toggle.cornerRadius, style: .circular)
                    .stroke(getColor(for: .border), lineWidth: Size.Toggle.border)
                    .frame(width: Size.Toggle.width, height: Size.Toggle.height)
                    .overlay(
                        Circle()
                            .fill(getColor(for: .circle))
                            .frame(width: Size.Toggle.circle, height: Size.Toggle.circle)
                            .offset(x: isOn ? Size.Toggle.circleOffset : -Size.Toggle.circleOffset))
                    .background(getColor(for: .background).cornerRadius(Size.Toggle.cornerRadius))
            }

            if let text = text {
                SirioText(text: text, typography: Typography.Toggle.style)
                    .foregroundColor(getColor(for: .text))
            }
        }
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private func getColor(for component: ToggleComponent) -> Color {
        switch component {
        case .border:
            if isDisabled {
                return isOn ? .Toggle.On.Border.disabled : .Toggle.Off.Border.disabled
            } else if isHover {
                return isOn ? .Toggle.On.Border.hover : .Toggle.Off.Border.hover
            }
            return isOn ? .Toggle.On.Border.default : .Toggle.Off.Border.default
            
        case .circle:
            if isDisabled {
                return isOn ? .Toggle.On.Circle.disabled : .Toggle.Off.Circle.disabled
            } else if isHover {
                return isOn ? .Toggle.On.Circle.hover : .Toggle.Off.Circle.hover
            }
            return isOn ? .Toggle.On.Circle.default : .Toggle.Off.Circle.default
            
        case .text:
            if isDisabled {
                return isOn ? .Toggle.On.Text.disabled : .Toggle.Off.Text.disabled
            } else if isHover {
                return isOn ? .Toggle.On.Text.hover : .Toggle.Off.Text.hover
            }
            return isOn ? .Toggle.On.Text.default : .Toggle.Off.Text.default
            
        case .background:
            if isDisabled {
                return isOn ? .Toggle.On.Background.disabled : .Toggle.Off.Background.disabled
            }
            return isOn ? .Toggle.On.Background.default : .Toggle.Off.Background.default
        }
    }
    
    enum ToggleComponent {
        case border, circle, text, background
    }
}
