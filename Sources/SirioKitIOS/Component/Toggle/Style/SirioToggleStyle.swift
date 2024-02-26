//
// SirioToggleStyle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage Toggle style
struct SirioToggleStyle: ButtonStyle {
    var text: String?
    var isOn: Bool
    @Binding var isDisabled: Bool
    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.Toggle.spacing) {
            
            VStack {
                RoundedRectangle(cornerRadius: Size.Toggle.cornerRadius, style: .circular)
                    .stroke(getColorBorder(), lineWidth: Size.Toggle.border)
                    .frame(width: Size.Toggle.width, height: Size.Toggle.height)
                    .overlay(
                        Circle()
                            .fill(getColorCircle())
                            .frame(width: Size.Toggle.circle, height: Size.Toggle.circle)
                            .offset(x: isOn ? Size.Toggle.circleOffset : -Size.Toggle.circleOffset))
                    .background(Color.white.cornerRadius(Size.Toggle.cornerRadius))
            }
            .frame(width: Size.Toggle.horizontalTouchArea, height: Size.Toggle.verticalTouchArea)

            if let text = text {
                SirioText(text: text, typography: Typography.Toggle.style)
                    .foregroundColor(getColorText())
            }
        }
        .padding(.horizontal)
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    private func getColorBorder() -> Color {
        if isDisabled {
            return isOn ? Color.Toggle.On.Border.disabled : Color.Toggle.Off.Border.disabled
        } else if isHover {
            return isOn ? Color.Toggle.On.Border.hover : Color.Toggle.Off.Border.hover
        }
        return isOn ? Color.Toggle.On.Border.default : Color.Toggle.Off.Border.default
    }
    
    private func getColorCircle() -> Color {
        if isDisabled {
            return isOn ? Color.Toggle.On.Circle.disabled : Color.Toggle.Off.Circle.disabled
        } else if isHover {
            return isOn ? Color.Toggle.On.Circle.hover : Color.Toggle.Off.Circle.hover
        }
        return isOn ? Color.Toggle.On.Circle.default : Color.Toggle.Off.Circle.default
    }
    
    private func getColorText() -> Color {
        if isDisabled {
            return isOn ? Color.Toggle.On.Text.disabled : Color.Toggle.Off.Text.disabled
        } else if isHover {
            return isOn ? Color.Toggle.On.Text.hover : Color.Toggle.Off.Text.hover
        }
        return isOn ? Color.Toggle.On.Text.default : Color.Toggle.Off.Text.default
    }
}
