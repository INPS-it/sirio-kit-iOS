//
// SirioProcessCard.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioProcessCardCTA {
    case inline, block
}


/// A custom process card view designed to display information with optional elements such as an icon, category, subtitle, body text, and action buttons.
///
/// - Parameters:
///   - schemeColor: Defines the color scheme of the card, either light or dark.
///   - title: The title of the card.
///   - iconData: Optional data for an icon to display near the title.
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
    var title: String
    var iconData: SirioIconData?
    var subtitle: String?
    var text: String?

    var itemData: SirioProcessCardItemData
    var cta: SirioProcessCardCTA = .inline

    var onTapCardAction: (() -> Void)?
    
    @State var isOpenMoreAction: Bool = false
    
    public init(schemeColor: SchemeColor,
                title: String,
                iconData: SirioIconData? = nil,
                subtitle: String? = nil,
                text: String?,
                itemData: SirioProcessCardItemData,
                cta: SirioProcessCardCTA = .inline,
                onTapCardAction: (() -> Void)? = nil) {
        self.schemeColor = schemeColor
        self.title = title
        self.iconData = iconData
        self.subtitle = subtitle
        self.text = text
        self.itemData = itemData
        self.cta = cta
        self.onTapCardAction = onTapCardAction
    }
    //    // Costruttore base (1 bottone)
    //    public init(schemeColor: SchemeColor,
    //                title: String,
    //                iconData: SirioIconData? = nil,
    //                subtitle: String? = nil,
    //                text: String?,
    //                textFirstButton: String,
    //                onTapFirstButtonAction: @escaping () -> Void,
    //                onTapCardAction: (() -> Void)? = nil) {
    //        self.schemeColor = schemeColor
    //        self.title = title
    //        self.iconData = iconData
    //        self.subtitle = subtitle
    //        self.text = text
    //        self.textFirstButton = textFirstButton
    //        self.onTapFirstButtonAction = onTapFirstButtonAction
    //        self.onTapCardAction = onTapCardAction
    //    }
    //
    //    // Costruttore secondario (2 bottoni + axis)
    //    public init(schemeColor: SchemeColor,
    //                title: String,
    //                iconData: SirioIconData? = nil,
    //                subtitle: String? = nil,
    //                text: String?,
    //                textFirstButton: String,
    //                onTapFirstButtonAction: @escaping () -> Void,
    //                textSecondButton: String,
    //                onTapSecondButtonAction: @escaping () -> Void,
    //                buttonsAxis: Axis = .horizontal,
    //                onTapCardAction: (() -> Void)? = nil) {
    //        self.schemeColor = schemeColor
    //        self.title = title
    //        self.iconData = iconData
    //        self.subtitle = subtitle
    //        self.text = text
    //        self.textFirstButton = textFirstButton
    //        self.onTapFirstButtonAction = onTapFirstButtonAction
    //        self.textSecondButton = textSecondButton
    //        self.onTapSecondButtonAction = onTapSecondButtonAction
    //        self.buttonsAxis = buttonsAxis
    //        self.onTapCardAction = onTapCardAction
    //    }
    //
    //    // Costruttore terziario (1 bottone + Dropdown menu)
    //    public init(schemeColor: SchemeColor,
    //                title: String,
    //                iconData: SirioIconData? = nil,
    //                subtitle: String? = nil,
    //                text: String?,
    //                textFirstButton: String,
    //                onTapFirstButtonAction: @escaping () -> Void,
    //                menuItems: [SirioDropdownMenuItem],
    //                onTapCardAction: (() -> Void)? = nil) {
    //        self.schemeColor = schemeColor
    //        self.title = title
    //        self.iconData = iconData
    //        self.subtitle = subtitle
    //        self.text = text
    //        self.textFirstButton = textFirstButton
    //        self.onTapFirstButtonAction = onTapFirstButtonAction
    //        self.menuItems = menuItems
    //        self.onTapCardAction = onTapCardAction
    //    }
    
    
    private var isCTA: Bool {
        return itemData.secondButtonText?.isEmpty == false
    }
    
    private var isMoreAction: Bool {
        return itemData.menuItems?.isEmpty == false
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.s4) {
            
            HStack(alignment: .firstTextBaseline) {
                SirioText(text: title, typography: Typography.Card.Process.title)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Title.light : Color.Card.Process.Text.Title.dark)
                    .lineLimit(subtitle == nil ? 2 : 1)
                
                if let data = iconData {
                    SirioIcon(data: data)
                        .frame(width: Size.Card.Process.Icon.width,
                               height: Size.Card.Process.Icon.height)
                        .foregroundStyle(schemeColor == .light ? Color.Card.Process.Icon.light : Color.Card.Process.Icon.dark)
                        .alignmentGuide(.firstTextBaseline) { d in
                            d[.bottom] - 2
                        }
                }
            }
            
            if let subtitle = subtitle {
                SirioText(text: subtitle, typography: Typography.Card.Process.subtitle)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Subtitle.light : Color.Card.Process.Text.Subtitle.dark)
                    .lineLimit(1)
            }
            
            if let text = text {
                SirioText(text: text, typography: Typography.Card.Process.body)
                    .foregroundColor(schemeColor == .light ? Color.Card.Process.Text.Body.light : Color.Card.Process.Text.Body.dark)
                    .truncationMode(.tail)
                //                    .lineLimit(3)
            }
            
            if isCTA {
                if cta == .inline {
                    HStack(spacing: Size.s4) {
                        SirioButton(hierarchy: .ghost,
                                    size: .medium,
                                    text: itemData.firstButtonText,
                                    isFullSize: true,
                                    action: {
                            itemData.onTapFirstButtonAction()
                        }, accessibilityLabel: itemData.firstButtonText)
                        
                        Spacer()
                        
                        SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                    size: .medium,
                                    text: itemData.secondButtonText ?? "",
                                    isFullSize: true,
                                    action: {
                            itemData.onTapSecondButtonAction?()
                        }, accessibilityLabel: itemData.secondButtonText ?? "")
                    }
                    .padding(.top, Size.p12)
                } else if cta == .block {
                    VStack(spacing: Size.s4) {
                        SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                    size: .medium,
                                    text: itemData.firstButtonText,
                                    isFullSize: true,
                                    action: {
                            self.itemData.onTapFirstButtonAction()
                        }, accessibilityLabel: itemData.firstButtonText)
                        
                        Spacer()
                        
                        SirioButton(hierarchy: .ghost,
                                    size: .medium,
                                    text: itemData.secondButtonText ?? "",
                                    isFullSize: true,
                                    action: {
                            self.itemData.onTapSecondButtonAction?()
                        }, accessibilityLabel: itemData.secondButtonText ?? "")
                    }
                    .padding(.top, Size.p12)
                }
            } else if isMoreAction {
                HStack(spacing: Size.s4) {
                    SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                size: .medium,
                                text: itemData.firstButtonText,
                                action: {
                        self.itemData.onTapFirstButtonAction()
                    }, accessibilityLabel: itemData.firstButtonText)
                    
                    Spacer()
                    if let menuItems = itemData.menuItems, !menuItems.isEmpty {
                        SirioMoreAction(items: menuItems, positionToOpen: .topLeft, isOpen: $isOpenMoreAction)
                    }
                }
                .padding(.top, Size.p12)
            } else {
                HStack(spacing: Size.s4) {
                    SirioButton(hierarchy: schemeColor == .light ? .tertiaryLight : .tertiaryDark,
                                size: .medium,
                                text: itemData.firstButtonText,
                                action: {
                        self.itemData.onTapFirstButtonAction()
                    }, accessibilityLabel: itemData.firstButtonText)
                    
                    Spacer()
                }
                .padding(.top, Size.p12)
            }
        }
        
        .padding(.horizontal, Size.p12)
        .padding(.vertical, Size.p16)
        
        .background(schemeColor == .light ? Color.Card.Process.Background.light : Color.Card.Process.Background.dark)
        .cornerRadius(Size.Card.Process.cornerRadius)
        .if(schemeColor == .light, transform: { view in
            view.shadow(color: StyleDictionaryBoxShadow.elevation01.0.color,
                        radius: StyleDictionaryBoxShadow.elevation01.3.cgFloat,
                        x: StyleDictionaryBoxShadow.elevation01.1.cgFloat,
                        y: StyleDictionaryBoxShadow.elevation01.2.cgFloat)
        })
        .onTapGesture {
            self.onTapCardAction?()
        }
    }
}


#Preview("Standard") {
    ScrollView {
        SirioProcessCard(schemeColor: .light, title: "Titolo della card molto molto molto molto lungo", iconData: .init(icon: .infoCircle), subtitle: "Subtitle", text: .loremIpsum, itemData: .init(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
   
        SirioProcessCard(schemeColor: .light, title: "Titolo della card", iconData: .init(icon: .infoCircle), subtitle: "Subtitle", text: .loremIpsum, itemData: .init(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark, title: "Titolo della card", iconData: .init(icon: .infoCircle), subtitle: "Subtitle", text: .loremIpsum, itemData: .init(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("CTA Inline") {
    ScrollView {
        
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         secondButtonText: "Text",
                                         onTapSecondButtonAction: {}),
                         cta: .inline,
                         onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         secondButtonText: "Text",
                                         onTapSecondButtonAction: {}),
                         cta: .inline,
                         onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("CTA Block") {
    ScrollView {
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         secondButtonText: "Text",
                                         onTapSecondButtonAction: {}),
                         cta: .block,
                         onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         secondButtonText: "Text",
                                         onTapSecondButtonAction: {}),
                         cta: .block,
                         onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("CTA More Action") {
    ScrollView {
        
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
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
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Subtitle",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
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
