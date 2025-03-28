//
// SirioChipsStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom view component that represents a "chip" element, commonly used to display small pieces of information
/// with optional icon and a close button for removal or interaction.
///
/// - Parameters:
///   - text: The main text content displayed within the chip.
///   - iconData: An optional `SirioIconData` model representing the icon to display alongside the text.
///   - isDisabled: A `Binding` boolean indicating whether the chip is disabled. When `true`, the chip and close button are not interactive.
///   - onTapClose: A closure that is executed when the close button (X icon) is tapped, typically used to remove or dismiss the chip.
///   - accessibilityLabelText: An optional accessibility label for the chip's text content, helping screen readers interpret the content.
///   - accessibilityLabelClose: An optional accessibility label for the close button, making the action clearer for screen readers.

public struct SirioChips: View {
    var text: String
    var iconData: SirioIconData?
    @Binding var isDisabled: Bool
    var onTapClose: (() -> Void)?
    var accessibilityLabelText: String?
    var accessibilityLabelClose: String?
    
    @State private var isClosePressed = false
    
    public init(text: String,
                iconData: SirioIconData?,
                isDisabled: Binding<Bool> = .constant(false),
                onTapClose: (() -> Void)? = nil,
                accessibilityLabelText: String? = nil,
                accessibilityLabelClose: String? = nil) {
        self.text = text
        self.iconData = iconData
        self._isDisabled = isDisabled
        self.onTapClose = onTapClose
        self.accessibilityLabelText = accessibilityLabelText
        self.accessibilityLabelClose = accessibilityLabelClose
    }
    
    public init(text: String,
                isDisabled: Binding<Bool> = .constant(false),
                onTapClose: (() -> Void)? = nil,
                accessibilityLabelText: String? = nil,
                accessibilityLabelClose: String? = nil) {
        self.text = text
        self.iconData = nil
        self._isDisabled = isDisabled
        self.onTapClose = onTapClose
        self.accessibilityLabelText = accessibilityLabelText
        self.accessibilityLabelClose = accessibilityLabelClose
    }
    
    public var body: some View {
        HStack(spacing: Size.NewChips.spacing) {
            if let iconData = iconData {
                SirioIcon(data: iconData)
                    .frame(width: Size.NewChips.icon, height: Size.NewChips.icon)
                    .foregroundColor(getIconColor())
            }
            
            SirioText(text: text, typography: Typography.Chips.style)
                .foregroundColor(getTextColor())
                .lineLimit(Size.NewChips.lineLimit)
                .setAccessibilityLabel(accessibilityLabelText)
            
            closeButton
                .setAccessibilityLabel(accessibilityLabelClose)
        }
        .padding(.leading, Size.NewChips.paddingLeading)
        .padding(.trailing, Size.NewChips.paddingTrailing)
        .padding(.vertical, Size.NewChips.paddingVertical)
        .background(getBackgroundColor())
        .cornerRadius(Size.NewChips.cornerRadius)
        .frame(height: Size.NewChips.height)
        .contentShape(Rectangle())
    }
    
    private var closeButton: some View {
        Button(action: {
            onTapClose?()
        }) {
            SirioIcon(data: .init(icon: .times))
                .frame(width: Size.NewChips.iconClose,
                       height: Size.NewChips.iconClose)
                .padding(Size.NewChips.paddingClose)
                .foregroundColor(getCloseIconColor())
                .background(getCloseBackgroundColor())
                .clipShape(Circle())
                .overlay(Circle().stroke(getCloseBorderColor(),
                                         lineWidth: Size.NewChips.borderWidth))
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(isDisabled)
        .pressAction(
            onPress: { isClosePressed = true },
            onRelease: { isClosePressed = false }
        )
    }
    
    private func getBackgroundColor() -> Color {
        if isDisabled {
            return Color.NewChips.Background.disabled
        } else if isClosePressed {
            return Color.NewChips.Background.pressed
        }
        return Color.NewChips.Background.default
    }
    
    private func getCloseBackgroundColor() -> Color {
        if isDisabled {
            return Color.NewChips.Close.Background.disabled
        } else if isClosePressed {
            return Color.NewChips.Close.Background.pressed
        } else {
            return Color.NewChips.Close.Background.default
        }
    }
    
    private func getCloseIconColor() -> Color {
        if isDisabled {
            return Color.NewChips.Close.Icon.disabled
        } else if isClosePressed {
            return Color.NewChips.Close.Icon.pressed
        } else {
            return Color.NewChips.Close.Icon.default
        }
    }
    
    private func getCloseBorderColor() -> Color {
        if isDisabled {
            return Color.NewChips.Close.Border.disabled
        } else if isClosePressed {
            return Color.NewChips.Close.Border.pressed
        } else {
            return Color.NewChips.Close.Border.default
        }
    }
    
    private func getTextColor() -> Color {
        if isDisabled {
            return Color.NewChips.Text.disabled
        } else if isClosePressed {
            return Color.NewChips.Text.pressed
        } else {
            return Color.NewChips.Text.default
        }
    }
    
    private func getIconColor() -> Color {
        if isDisabled {
            return Color.NewChips.Icon.disabled
        } else if isClosePressed {
            return Color.NewChips.Icon.pressed
        } else {
            return Color.NewChips.Icon.default
        }
    }
}

#Preview {
    SirioChips(text: "Chips", iconData: .init(icon: .user), isDisabled: .constant(false))
    SirioChips(text: "Chips", iconData: .init(icon: .user), isDisabled: .constant(true))
}
