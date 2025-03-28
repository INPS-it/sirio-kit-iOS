//
// SirioChipsSelectionStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioChipsSelectionStyle: ButtonStyle {
    var text: String
    @Binding var isSelected: Bool
    @Binding var isDisabled: Bool
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.NewChips.Selection.spacing) {
            if isSelected {
                SirioIcon(data: .init(icon: .check))
                    .frame(width: Size.NewChips.Selection.icon, height: Size.NewChips.Selection.icon)
                    .foregroundStyle(getIconColor(configuration: configuration))
            }
            
            SirioText(text: text, typography: Typography.labelMdHeavy)
                .foregroundColor(getTextColor(configuration: configuration))
                .lineLimit(Size.NewChips.Selection.lineLimit)
            
        }
        .padding(.horizontal, Size.NewChips.Selection.paddingHorizontal)
        .padding(.vertical, Size.NewChips.Selection.paddingVertical)
        .background(getBackgroundColor(configuration: configuration))
        .if(!isSelected, transform: { view in
            view.overlay(
                RoundedRectangle(cornerRadius: Size.NewChips.Selection.cornerRadius)
                    .stroke(getBorderColor(configuration: configuration), lineWidth: Size.NewChips.Selection.lineWidth)
            )
        })
        .cornerRadius(Size.NewChips.Selection.cornerRadius)
        .frame(height: Size.NewChips.Selection.height)
        .setAccessibilityLabel(text)
    }
    
    
    private func getIconColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.NewChips.Selection.Icon.disabled
        } else if configuration.isPressed {
            return Color.NewChips.Selection.Icon.pressed
        } else {
            return Color.NewChips.Selection.Icon.default
        }
    }
    
    private func getTextColor(configuration: Self.Configuration) -> Color {
        if isSelected {
            if isDisabled {
                return Color.NewChips.Selection.Text.Selected.disabled
            } else if configuration.isPressed {
                return Color.NewChips.Selection.Text.Selected.pressed
            } else {
                return Color.NewChips.Selection.Text.Selected.default
            }
        } else {
            if isDisabled {
                return Color.NewChips.Selection.Text.Unselected.disabled
            } else if configuration.isPressed {
                return Color.NewChips.Selection.Text.Unselected.pressed
            } else {
                return Color.NewChips.Selection.Text.Unselected.default
            }
        }
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        if isSelected {
            if isDisabled {
                return Color.NewChips.Selection.Background.Selected.disabled
            } else if configuration.isPressed {
                return Color.NewChips.Selection.Background.Selected.pressed
            } else {
                return Color.NewChips.Selection.Background.Selected.default
            }
        } else {
            return Color.NewChips.Selection.Background.Unselected.default
            
        }
    }
    
    private func getBorderColor(configuration: Self.Configuration) -> Color {
        if isDisabled {
            return Color.NewChips.Selection.Border.disabled
        } else if configuration.isPressed {
            return Color.NewChips.Selection.Border.pressed
        } else {
            return Color.NewChips.Selection.Border.default
        }
    }
}
