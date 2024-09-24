//
// Avviso.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view representing an alert with an icon, title, text, and a button.
///
/// - Parameters:
///   - title: The title of the alert.
///   - text: The subtitle of the alert.
///   - iconData: The icon data displayed in the alert.
///   - textButton: The text displayed on the button.
///   - onTapButtonAction: A callback executed when the button is tapped.

public struct SirioAvviso: View {
    var schemeColor: SchemeColor
    var title: String
    var text: String
    var iconData: SirioIconData
    var textButton: String
    var onTapButtonAction: (() -> Void)
    
    public init(schemeColor: SchemeColor = .dark,
                title: String,
                text: String,
                iconData: SirioIconData = .init(icon: .infoCircle),
                textButton: String,
                onTapButtonAction: @escaping () -> Void){
        self.schemeColor = schemeColor
        self.title = title
        self.text = text
        self.iconData = iconData
        self.textButton = textButton
        self.onTapButtonAction = onTapButtonAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.Avviso.spacingVertical){
            HStack(spacing: Size.Avviso.spacingHorizontal) {
                SirioIcon(data: iconData)
                    .frame(width: Size.Avviso.Icon.frame, height: Size.Avviso.Icon.frame)
                    .foregroundColor(iconColor)
                
                SirioText(text: title, typography: Typography.Avviso.title)
                    .foregroundColor(titleColor)
                    .lineLimit(Size.Avviso.lineLimitTitle)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: Size.Avviso.spacingVertical2){
                SirioText(text: text, typography: Typography.Avviso.text)
                    .foregroundColor(textColor)
                    .lineLimit(Size.Avviso.lineLimitText)
                
                SirioButtonTextOnly(style: buttonStyle,
                               size: .large,
                               text: textButton,
                               action: {
                    onTapButtonAction()
                })
                .padding(.top, Size.Avviso.paddingTopButton)
            }
            .padding(.leading, Size.Avviso.paddingLeading)
        }
        .padding(.horizontal, Size.Avviso.paddingHorizontal)
        .padding(.top, Size.Avviso.paddingTop)
        .padding(.bottom, Size.Avviso.paddingBottom)
        .background(Rectangle().fill(backgroundColor))
        .border(Color.Avviso.Border.default, width: Size.Avviso.borderWidth)
    }
    
    private var buttonStyle: SirioButtonStyle {
        return schemeColor == .dark ? .tertiaryDark : .tertiaryLight
    }
    
    private var iconColor: Color {
        return schemeColor == .dark ? Color.Avviso.Icon.dark : Color.Avviso.Icon.light
    }
    
    private var titleColor: Color {
        return schemeColor == .dark ? Color.Avviso.Title.dark : Color.Avviso.Title.light
    }
    
    private var textColor: Color {
        return schemeColor == .dark ? Color.Avviso.Text.dark : Color.Avviso.Text.light
    }
    
    private var backgroundColor: Color {
        return schemeColor == .dark ? Color.Avviso.Background.dark : Color.Avviso.Background.light
    }
}

#Preview {
    ScrollView {
        SirioAvviso(title: "Titolo avviso", text: .loremIpsum, textButton: "Text", onTapButtonAction: {
            
        })
        
        SirioAvviso(schemeColor: .light, title: "Titolo avviso", text: .loremIpsum, textButton: "Text", onTapButtonAction: {
            
        })
    }
}

