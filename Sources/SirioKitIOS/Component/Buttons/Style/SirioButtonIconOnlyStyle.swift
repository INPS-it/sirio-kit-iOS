//
// SirioButtonIconOnlyStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for ButtonIconOnly component
struct SirioButtonIconOnlyStyle: ButtonStyle {
    var hierarchy: SirioButtonHierarchy
    var size: SirioSize
    var iconData: SirioIconData
    @Binding var isDisabled: Bool
    @State var isHover = false
    @State var isPressed = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        VStack {
            SirioIcon(data: iconData)
                .frame(width: iconFrame, height: iconFrame)
                .foregroundColor(getSirioButtonIconColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed))
        }
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .background(getSirioButtonBackgroundColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed))
        .cornerRadius(Size.Button.Border.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Size.Button.Border.cornerRadius)
                .stroke(getSirioButtonBorderColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed), lineWidth: Size.Button.Border.width)
        )
        .onHover { isHover in
            self.isHover = isHover
        }
        .onChange(of: configuration.isPressed) { isPressed in
            self.isPressed = isPressed
        }
    }
    
    private var iconFrame: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.Icon.frame
        case .medium:
            return Size.Button.Medium.Icon.frame
        case .small:
            return Size.Button.Small.Icon.frame
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.Icon.paddingHorizontal
        case .medium:
            return Size.Button.Medium.Icon.paddingHorizontal
        case .small:
            return Size.Button.Small.Icon.paddingHorizontal
        }
    }
    
    private var paddingVertical: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.Icon.paddingVertical
        case .medium:
            return Size.Button.Medium.Icon.paddingVertical
        case .small:
            return Size.Button.Small.Icon.paddingVertical
        }
    }
}
