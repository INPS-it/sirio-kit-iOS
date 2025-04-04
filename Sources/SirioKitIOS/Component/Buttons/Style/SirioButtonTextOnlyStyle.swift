//
// ButtonTextOnlyStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for ButtonTextOnly component
struct SirioButtonTextOnlyStyle: ButtonStyle {
    var hierarchy: SirioButtonHierarchy
    var size: SirioSize
    var text: String
    @Binding var isDisabled: Bool
    var isFullSize: Bool
    @State var isHover = false
    @State var isPressed: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            if isFullSize {
                Spacer()
            }
            
            SirioText(text: text, typography: .label_md_700)
                .foregroundColor(getSirioButtonTextColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed))
                .lineLimit(1)
            
            if isFullSize {
                Spacer()
            }
        }
        .padding(.horizontal, paddingHorizontal)
        //.padding(.vertical, paddingVertical)
        .frame(height: height)
        .contentShape(Rectangle())
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
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.Text.paddingHorizontal
        case .medium:
            return Size.Button.Medium.Text.paddingHorizontal
        case .small:
            return Size.Button.Small.Text.paddingHorizontal
        }
    }
    
    private var paddingVertical: CGFloat {
        switch size {
        case .large:
            return  Size.Button.Large.Text.paddingVertical
        case .medium:
            return Size.Button.Medium.Text.paddingVertical
        case .small:
            return Size.Button.Small.Text.paddingVertical
        }
    }
    
    private var height: CGFloat {
        switch size {
        case .large:
            return Size.Button.Large.frame
        case .medium:
            return Size.Button.Medium.frame
        case .small:
            return Size.Button.Small.frame
        }
    }
}

