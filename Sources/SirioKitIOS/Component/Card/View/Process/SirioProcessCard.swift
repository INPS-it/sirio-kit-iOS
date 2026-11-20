//
// SirioProcessCard.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioProcessCardType {
    case standard(SirioProcessCardItemDataStandard)
    case inline(SirioProcessCardItemDataCTAInline)
    case block(SirioProcessCardItemDataCTABlock)
    case moreAction(SirioProcessCardItemDataMoreAction)
    
    public static func standard(
        hierarchy: SirioButtonHierarchy? = nil,
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void,
        isFullWidth: Bool = false
    ) -> Self {
        .standard(SirioProcessCardItemDataStandard(firstButtonText: firstButtonText, onTapFirstButtonAction: onTapFirstButtonAction, isFullWidth: isFullWidth))
    }
    
    public static func inline(
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void,
        secondButtonText: String,
        onTapSecondButtonAction: @escaping () -> Void
    ) -> Self {
        .inline(SirioProcessCardItemDataCTAInline(firstButtonText: firstButtonText,
                                                  onTapFirstButtonAction: onTapFirstButtonAction,
                                                  secondButtonText: secondButtonText,
                                                  onTapSecondButtonAction: onTapSecondButtonAction))
    }
    
    public static func block(
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void,
        secondButtonText: String,
        onTapSecondButtonAction: @escaping () -> Void
    ) -> Self {
        .block(SirioProcessCardItemDataCTABlock(firstButtonText: firstButtonText,
                                                onTapFirstButtonAction: onTapFirstButtonAction,
                                                secondButtonText: secondButtonText,
                                                onTapSecondButtonAction: onTapSecondButtonAction))
    }
    
    public static func moreAction(
        iconData: SirioIconData? = nil,
        color: Color? = nil,
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void,
        menuItems: [SirioActionItem]
    ) -> Self {
        .moreAction(SirioProcessCardItemDataMoreAction(firstButtonText: firstButtonText,
                                                       onTapFirstButtonAction: onTapFirstButtonAction,
                                                       menuItems: menuItems))
    }
}

/// A custom process card view designed to display information with optional elements such as an icon, category, subtitle, body text, and action buttons.
///
/// - Parameters:
///   - schemeColor: Defines the color scheme of the card, either light or dark.
///   - iconData: The icon of the card.
///   - color: The color of the icon.
///   - title: The title of the card.
///   - subtitle: An optional subtitle displayed above the title.
///   - text: An optional body text describing the process.
///   - itemData: The item describing the call-to-action area at the bottom of the card.
///   - onTapFirstButtonAction: The callback triggered when the first button is tapped.
///   - textSecondButton: The text for the optional second button.
///   - onTapSecondButtonAction: The callback triggered when the optional second button is tapped.
///   - buttonsAxis: The axis layout for the buttons (horizontal or vertical). Defaults to horizontal.
///   - onTapCardAction: An optional callback triggered when the card itself is tapped.
///   - menuItems: An optional array of dropdown menu items to display.
///   - cta: Defines how to arrange the two buttons (`.inline` for horizontal or `.block` for vertical arrangement). Default is `.inline`.

public struct SirioProcessCard: View {
    var schemeColor: SchemeColor
    var iconData: SirioIconData?
    var color: Color?
    var title: String
    var subtitle: String?
    var text: String?
    var type: SirioProcessCardType
    
    var onTapCardAction: (() -> Void)?
    
    @State var isOpenMoreAction: Bool = false
    
    public init(schemeColor: SchemeColor,
                iconData: SirioIconData? = nil,
                color: Color? = nil,
                title: String,
                subtitle: String? = nil,
                text: String?,
                type: SirioProcessCardType,
                onTapCardAction: (() -> Void)? = nil) {
        self.schemeColor = schemeColor
        self.iconData = iconData
        self.color = color
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.type = type
        self.onTapCardAction = onTapCardAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.s4) {
            // MARK: - Icon
            if let iconData = iconData, let color {
                HStack(alignment: .firstTextBaseline) {
                    SirioIcon(data: iconData)
                        .frame(width: Size.s24, height: Size.s24)
                        .foregroundStyle(color)
                }
                .padding(.bottom, Size.p4)
            }
            
            // MARK: - Title
            HStack(alignment: .firstTextBaseline) {
                SirioText(text: title, typography: Typography.Card.Process.title)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Title.light : Color.Card.Process.Text.Title.dark)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - Subtitle
            if let subtitle = subtitle {
                SirioText(text: subtitle, typography: Typography.Card.Process.subtitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Subtitle.light : Color.Card.Process.Text.Subtitle.dark)
                    .lineLimit(1)
            }
            
            // MARK: - Body Text
            if let text = text {
                SirioText(text: text, typography: Typography.Card.Process.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Body.light : Color.Card.Process.Text.Body.dark)
            }
            
            // MARK: - CTA Area
            switch type {
            case .standard(let data):
                HStack(spacing: Size.s4) {
                    SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                size: .medium,
                                text: data.firstButtonText ?? "",
                                isFullSize: data.isFullWidth,
                                action: {
                        data.onTapFirstButtonAction?()
                    }, accessibilityLabel: data.firstButtonText)
                }
                .padding(.top, Size.p12)
                
            case .inline(let data):
                HStack(spacing: Size.s4) {
                    SirioButton(hierarchy: schemeColor == .light ? .ghostLight : .ghostDark,
                                size: .medium,
                                text: data.firstButtonText ?? "",
                                isFullSize: true,
                                action: {
                        data.onTapFirstButtonAction?()
                    }, accessibilityLabel: data.firstButtonText)
                    
                    Spacer()
                    
                    SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                size: .medium,
                                text: data.secondButtonText,
                                isFullSize: true,
                                action: {
                        data.onTapSecondButtonAction()
                    }, accessibilityLabel: data.secondButtonText)
                }
                .padding(.top, Size.p12)
                
            case .block(let data):
                VStack(spacing: Size.s4) {
                    SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                size: .medium,
                                text: data.firstButtonText ?? "",
                                isFullSize: true,
                                action: {
                        data.onTapFirstButtonAction?()
                    }, accessibilityLabel: data.firstButtonText)
                    Spacer()
                    
                    SirioButton(hierarchy: schemeColor == .light ? .ghostLight : .ghostDark,
                                size: .medium,
                                text: data.secondButtonText,
                                isFullSize: true,
                                action: {
                        data.onTapSecondButtonAction()
                    }, accessibilityLabel: data.secondButtonText)
                    
                }
                .padding(.top, Size.p12)
                
            case .moreAction(let data):
                
                HStack(spacing: Size.s4) {
                    if let text = data.firstButtonText, !text.isEmpty {
                        SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                    size: .medium,
                                    text: text,
                                    action: {
                            data.onTapFirstButtonAction?()
                        }, accessibilityLabel: data.firstButtonText)
                        
                    }
                    Spacer()
                    
                    SirioMoreAction(hierarchy: schemeColor == .light ? .ghostLight : .ghostDark,
                                    items: data.menuItems,
                                    positionToOpen: .topLeft,
                                    isOpen: $isOpenMoreAction)
                }
                .padding(.top, Size.p12)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, Size.p12)
        .padding(.vertical, Size.p16)
        .background(schemeColor == .light ? Color.Card.Process.Background.light : Color.Card.Process.Background.dark)
        .cornerRadius(Size.Card.Process.cornerRadius)
        .if(schemeColor == .light, transform: { view in
            view.shadow(color: StyleDictionaryBoxShadow.elevation01.0.color,
                        radius: 4,
                        x: StyleDictionaryBoxShadow.elevation01.1.cgFloat,
                        y: StyleDictionaryBoxShadow.elevation01.2.cgFloat)
        })
        .onTapGesture {
            isOpenMoreAction = false
            self.onTapCardAction?()
        }
    }}


#Preview("Standard") {
    ScrollView {
        SirioProcessCard(schemeColor: .light,
                         iconData: .previewInfo,
                         color: Color.globalSemanticWarning90,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .standard(hierarchy: .ghostDark,
                                         firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         isFullWidth: false))
        
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .standard(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .standard(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}


#Preview("CTA Inline") {
    ScrollView {
        
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .inline(firstButtonText: "Text",
                                       onTapFirstButtonAction: {},
                                       secondButtonText: "Text",
                                       onTapSecondButtonAction: {}),
                         onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .inline(firstButtonText: "Text",
                                       onTapFirstButtonAction: {},
                                       secondButtonText: "Text",
                                       onTapSecondButtonAction: {}),
                         onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("CTA Block") {
    ScrollView {
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .block(firstButtonText: "Text",
                                      onTapFirstButtonAction: {},
                                      secondButtonText: "Text",
                                      onTapSecondButtonAction: {}),
                         onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .block(firstButtonText: "Text",
                                      onTapFirstButtonAction: {},
                                      secondButtonText: "Text",
                                      onTapSecondButtonAction: {}),
                         onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("CTA More Action") {
    ScrollView {
        
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .moreAction(firstButtonText: "Text",
                                           onTapFirstButtonAction: {},
                                           menuItems: [
                                            .init(value: "Action #1", action: {}),
                                            .init(value: "Action #2", action: {}),
                                            .init(value: "Action #3", action: {}),
                                            
                                           ]),
                         onTapCardAction: {},
        )
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card molto molto molto molto lungo",
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         type: .moreAction(firstButtonText: "Text",
                                           onTapFirstButtonAction: {},
                                           menuItems: [
                                            .init(value: "Action #1", action: {}),
                                            .init(value: "Action #2", action: {}),
                                            .init(value: "Action #3", action: {}),
                                            
                                           ]),
                         onTapCardAction: {},
        )
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
