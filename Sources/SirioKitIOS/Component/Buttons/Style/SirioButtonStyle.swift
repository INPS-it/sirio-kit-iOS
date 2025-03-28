//
// SirioButtonStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for ButtonTextIcon component
struct SirioButtonStyle: ButtonStyle {
    var hierarchy: SirioButtonHierarchy
    var size: SirioSize
    var text: String?
    var iconData: SirioIconData?
    var iconAlignment: SirioAlignment?
    @Binding var isDisabled: Bool
    var isFullSize: Bool
    @State var isHover = false
    @State var isPressed = false
    
    @State var colorText: Color
    @State var colorIcon: Color
    @State var colorBackground: Color
    @State var colorBorder: Color
    
    init(hierarchy: SirioButtonHierarchy,
         size: SirioSize,
         text: String?,
         iconData: SirioIconData?,
         iconAlignment: SirioAlignment? = .trailing,
         isDisabled: Binding<Bool>,
         isFullSize: Bool){
        self.hierarchy = hierarchy
        self.size = size
        self.text = text
        self.iconData = iconData
        self.iconAlignment = iconAlignment
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        
        // Set default color by state
        self._colorText = State(initialValue: isDisabled.wrappedValue ? self.hierarchy.theme.text.disabled : self.hierarchy.theme.text.default)
        self._colorIcon = State(initialValue: isDisabled.wrappedValue ? self.hierarchy.theme.icon.disabled : self.hierarchy.theme.icon.default)
        self._colorBackground = State(initialValue: isDisabled.wrappedValue ? self.hierarchy.theme.background.disabled : self.hierarchy.theme.background.default)
        
        if let border = self.hierarchy.theme.border {
            self._colorBorder = State(initialValue: isDisabled.wrappedValue ? border.disabled : border.default)
        } else {
            self._colorBorder = State(initialValue: .clear)
        }
    }
    
    private var isOnlyIcon: Bool {
        return text == nil && iconData != nil || iconAlignment == .center
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: Size.SirioButton.padding) {
            if isFullSize {
                Spacer()
            }
            
            if let iconData = iconData, let iconAlignment = iconAlignment, iconAlignment == .leading {
                SirioIcon(data: iconData)
                    .frame(width: iconFrame, height: iconFrame)
                    .foregroundColor(colorIcon)
            }
            
            if let iconData = iconData, let iconAlignment = iconAlignment, iconAlignment == .center {
                SirioIcon(data: iconData)
                    .frame(width: iconFrame, height: iconFrame)
                    .foregroundColor(colorIcon)
            } else if let text = text {
                SirioText(text: text, typography: typography)
                    .lineLimit(1)
                    .foregroundColor(colorText)
            }
            
            if let iconData = iconData, let iconAlignment = iconAlignment, iconAlignment == .trailing {
                SirioIcon(data: iconData)
                    .frame(width: iconFrame, height: iconFrame)
                    .foregroundColor(colorIcon)
            }
            
            if isFullSize {
                Spacer()
            }
        }
        .padding(.horizontal, paddingHorizontal)
        //.padding(.vertical, paddingVertical)
        .frame(height: height)
        .if(!isOnlyIcon, transform: { view in
            view.frame(minWidth: minWidth)
        })
        .contentShape(Rectangle())
        .background(colorBackground)
        .cornerRadius(Size.SirioButton.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Size.SirioButton.cornerRadius)
                .stroke(colorBorder, lineWidth: Size.SirioButton.borderWidth)
        )
        .onHover { isHover in
            self.isHover = isHover
        }
        .onChange(of: configuration.isPressed) { isPressed in
            self.isPressed = isPressed
            self.colorText = getSirioButtonTextColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
            self.colorIcon = getSirioButtonIconColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
            self.colorBackground = getSirioButtonBackgroundColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
            self.colorBorder = getSirioButtonBorderColor(hierarchy: hierarchy, isDisabled: isDisabled, isHover: isHover, isPressed: isPressed)
        }
        .onChange(of: isDisabled) { isDisabled in
            self.setColor(isDisabled: isDisabled)
        }
    }
    
    private var typography: Typography {
        switch size {
        case .large:
            return Typography.labelMdHeavy
        case .medium:
            return Typography.labelMdHeavy
        case .small:
            return Typography.labelSmHeavy
        }
    }
    private func setColor(isDisabled: Bool) {
        // Set default color by state
        self.colorText = isDisabled ? self.hierarchy.theme.text.disabled : self.hierarchy.theme.text.default
        self.colorIcon = isDisabled ? self.hierarchy.theme.icon.disabled : self.hierarchy.theme.icon.default
        self.colorBackground = isDisabled ? self.hierarchy.theme.background.disabled : self.hierarchy.theme.background.default
        
        if let border = self.hierarchy.theme.border {
            self.colorBorder = isDisabled ? border.disabled : border.default
        } else {
            self.colorBorder = .clear
        }
    }
    
    private var iconFrame: CGFloat {
        switch size {
        case .large:
            return Size.SirioButton.Large.icon
        case .medium:
            return Size.SirioButton.Medium.icon
        case .small:
            return Size.SirioButton.Small.icon
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .large:
            return isOnlyIcon ? Size.SirioButton.Large.OnlyIcon.paddingHorizontal : Size.SirioButton.Large.paddingHorizontal
        case .medium:
            return isOnlyIcon ? Size.SirioButton.Medium.OnlyIcon.paddingHorizontal : Size.SirioButton.Medium.paddingHorizontal
        case .small:
            return isOnlyIcon ? Size.SirioButton.Small.OnlyIcon.paddingHorizontal : Size.SirioButton.Small.paddingHorizontal
        }
    }
    
    private var paddingVertical: CGFloat {
        switch size {
        case .large:
            return isOnlyIcon ? Size.SirioButton.Large.OnlyIcon.paddingVertical : Size.SirioButton.Large.paddingVertical
        case .medium:
            return isOnlyIcon ? Size.SirioButton.Medium.OnlyIcon.paddingVertical : Size.SirioButton.Medium.paddingVertical
        case .small:
            return isOnlyIcon ? Size.SirioButton.Small.OnlyIcon.paddingVertical : Size.SirioButton.Small.paddingVertical
        }
    }
    
    private var minWidth: CGFloat {
        switch size {
        case .large:
            return Size.SirioButton.Large.minWidth
        case .medium:
            return Size.SirioButton.Medium.minWidth
        case .small:
            return isOnlyIcon ? Size.SirioButton.Small.minWidthWithIcon : Size.SirioButton.Small.minWidth
        }
    }
    
    private var height: CGFloat {
        switch size {
        case .large:
            return Size.SirioButton.Large.height
        case .medium:
            return Size.SirioButton.Medium.height
        case .small:
            return Size.SirioButton.Small.height
        }
    }
}
