//
// SirioProcessCard.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom process card view designed to display information with an optional icon, category, date, title, body text, and a button.
///
/// - Parameters:
///   - schemeColor: Defines the color scheme of the card, either light or dark.
///   - category: The category of the process, displayed at the top of the card (optional).
///   - icon: An optional icon displayed next to the category or date.
///   - date: The date associated with the process, displayed at the top of the card (optional).
///   - title: The title of the process, displayed prominently in the card.
///   - text: The body text describing the process (optional).
///   - textButton: The text of the button at the bottom of the card.
///   - onTapButtonAction: The callback action triggered when the button is tapped.
///   - iconData: Optional data for an icon that can trigger an action when tapped.
///   - onTapCardAction: A callback action triggered when the card itself is tapped.

public struct SirioProcessCard: View {
    var schemeColor: SchemeColor
    var category: String?
    var icon: AwesomeIcon?
    var date: String?
    var title: String
    var text: String?
    var textButton: String
    var onTapButtonAction: () -> Void
    var iconData: SirioIconData?
    var onTapCardAction: (() -> Void)?
    
    public init(schemeColor: SchemeColor,
                category: String? = nil,
                icon: AwesomeIcon? = nil,
                date: String? = nil,
                title: String,
                text: String?,
                textButton: String,
                onTapButtonAction: @escaping () -> Void,
                iconData: SirioIconData? = nil,
                onTapCardAction: (() -> Void)? = nil) {
        self.schemeColor = schemeColor
        self.category = category
        self.icon = icon
        self.date = date
        self.title = title
        self.text = text
        self.textButton = textButton
        self.onTapButtonAction = onTapButtonAction
        self.iconData = iconData
        self.onTapCardAction = onTapCardAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.Card.Process.spacing) {
            if date != nil || category != nil || icon != nil {
                firstSection
            }
            
            SirioText(text: title, typography: Typography.Card.Process.title)
                .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Title.light : Color.Card.Process.Text.Title.dark)
                .lineLimit(2)
            
            if let text = text {
                SirioText(text: text, typography: Typography.Card.Process.body)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Body.light : Color.Card.Process.Text.Body.dark)
                    .lineLimit(4)
                    .frame(height: Size.Card.Process.bodyHeight)
            }
            
            
            HStack(spacing: Size.Card.Process.spacing) {
                SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                            size: .medium,
                            text: textButton,
                            action: {
                    self.onTapButtonAction()
                }, accessibilityLabel: text)
                
                Spacer()
                
                if let iconData = iconData {
                    Button(action: {
                        iconData.action()
                    }, label: {
                        SirioIcon(data: iconData)
                            .padding(Size.Card.Process.Item.padding)
                            .frame(width: Size.Card.Process.Item.width,
                                   height: Size.Card.Process.Item.height)
                            .foregroundColor(schemeColor == .light ? Color.Card.Process.Item.light : Color.Card.Process.Item.dark)
                    })
                }
            }
        }
        .padding(.horizontal, Size.Card.Process.paddingHorizontal)
        .padding(.vertical, Size.Card.Process.paddingVertical)
        .background(schemeColor == .light ? Color.Card.Process.Background.light : Color.Card.Process.Background.dark)
        .cornerRadius(Size.Card.Process.cornerRadius)
        .shadow(color: StyleDictionaryBoxShadow.elevation01.0.color,
                radius: StyleDictionaryBoxShadow.elevation01.3.cgFloat,
                x: StyleDictionaryBoxShadow.elevation01.1.cgFloat,
                y: StyleDictionaryBoxShadow.elevation01.2.cgFloat)
        .onTapGesture {
            self.onTapCardAction?()
        }
    }
    
    var firstSection: some View {
        return VStack(spacing: Size.Card.Process.spacing) {
            if let category = category {
                categoryView(with: category)
            } else if let icon = icon {
                iconView(with: icon)
            } else {
                dateView()
            }
        }
    }
}

extension SirioProcessCard {
    @ViewBuilder
    private func categoryView(with category: String) -> some View {
        HStack {
            SirioTag(type: schemeColor == .light ? .gray : .white, text: category)
            Spacer()
            SirioText(text: date ?? "", typography: Typography.Card.date)
                .foregroundColor(schemeColor == .light ?  Color.Card.Process.Text.Date.light : Color.Card.Process.Text.Date.dark)
        }
    }
    
    @ViewBuilder
    private func iconView(with icon: AwesomeIcon) -> some View {
        HStack {
            SirioIcon(data: .init(icon: icon))
                .foregroundColor(schemeColor == .light ? Color.Card.Process.Icon.light : Color.Card.Process.Icon.dark)
                .frame(width: Size.Card.Process.Icon.width, height: Size.Card.Process.Icon.width)
            Spacer()
            SirioText(text: date ?? "", typography: Typography.Card.date)
                .foregroundColor(schemeColor == .light ?  Color.Card.Process.Text.Date.light : Color.Card.Process.Text.Date.dark)
        }
    }
    
    @ViewBuilder
    private func dateView() -> some View {
        HStack {
            Spacer()
            
            SirioText(text: date ?? "", typography: Typography.Card.date)
                .foregroundColor(schemeColor == .light ?  Color.Card.Process.Text.Date.light : Color.Card.Process.Text.Date.dark)
            
        }
    }
}

#Preview {
    ScrollView {
        SirioProcessCard(schemeColor: .light, category: nil, icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, iconData: .previewHeart)
        
        SirioProcessCard(schemeColor: .dark, category: "Categoria", icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, iconData: nil)
        
        SirioProcessCard(schemeColor: .dark, category: nil, icon: nil, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, iconData: nil)
    }
    .padding()
}
