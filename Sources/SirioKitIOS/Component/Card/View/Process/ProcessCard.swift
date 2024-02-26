//
// ProcessCard.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio Process Card
/// - Parameters:
///   - schemeColor: The schemeColor of the component
///   - category: The name of category
///   - icon: The icon's name
///   - date: The date
///   - title: The card's title
///   - text: The card's body
///   - textButton: The card's button text
///   - onTapButtonAction: The card's button action
///   - item: The card's right item
///   - onTapCardAction: The card's action
///
public struct ProcessCard: View {
    var schemeColor: SchemeColor
    var category: String?
    var icon: AwesomeIcon?
    var date: String
    var title: String
    var text: String
    var textButton: String
    var onTapButtonAction: () -> Void
    var item: CardItemData?
    var onTapCardAction: (() -> Void)?
    
    public init(schemeColor: SchemeColor, category: String? = nil, icon: AwesomeIcon? = nil, date: String, title: String, text: String, textButton: String, onTapButtonAction: @escaping () -> Void, item: CardItemData? = nil, onTapCardAction: (() -> Void)? = nil) {
        self.schemeColor = schemeColor
        self.category = category
        self.icon = icon
        self.date = date
        self.title = title
        self.text = text
        self.textButton = textButton
        self.onTapButtonAction = onTapButtonAction
        self.item = item
        self.onTapCardAction = onTapCardAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.Card.Process.spacing) {
            firstSection
            
            SirioText(text: title, typography: Typography.Card.Process.title)
                .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Title.light : Color.Card.Process.Text.Title.dark)
                .lineLimit(2)
                .frame(height: Size.Card.Process.titleHeight)
            
            SirioText(text: text, typography: Typography.Card.Process.body)
                .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Body.light : Color.Card.Process.Text.Body.dark)
                .lineLimit(4)
                .frame(height: Size.Card.Process.bodyHeight)
            
            HStack(spacing: Size.Card.Process.spacing) {
                ButtonTextOnly(style: schemeColor == .light ? .tertiaryLight : .tertiaryDark, size: .large, text: textButton, action: {
                    self.onTapButtonAction()
                })
                
                Spacer()
                
                if let item = item {
                    SirioIcon(data: .init(icon: item.icon))
                        .frame(width: Size.Card.Process.Item.width,
                               height: Size.Card.Process.Item.height)
                        .foregroundColor(schemeColor == .light ? Color.Card.Process.Item.light : Color.Card.Process.Item.dark)
                        .onTapGesture{
                            item.action()
                        }
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

struct ProcessCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            ProcessCard(schemeColor: .light, category: nil, icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, item: .previewHeart)
            
            ProcessCard(schemeColor: .dark, category: "Categoria", icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, item: nil)
        }
        .padding()
    }
}

extension ProcessCard {
    @ViewBuilder
    private func categoryView(with category: String) -> some View {
        HStack {
            Tag(type: schemeColor == .light ? .gray : .white, text: category)
            Spacer()
            SirioText(text: date, typography: Typography.Card.date)
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
            SirioText(text: date, typography: Typography.Card.date)
                .foregroundColor(schemeColor == .light ?  Color.Card.Process.Text.Date.light : Color.Card.Process.Text.Date.dark)
        }
    }
    
    @ViewBuilder
    private func dateView() -> some View {
        HStack {
            SirioText(text: date, typography: Typography.Card.date)
                .foregroundColor(schemeColor == .light ?  Color.Card.Process.Text.Date.light : Color.Card.Process.Text.Date.dark)
            Spacer()
        }
    }
}
