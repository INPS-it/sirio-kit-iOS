//
// SirioAccordionStyle.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for Accordion component
struct SirioAccordionStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var iconData: SirioIconData?
    var title: String
    var text: String?
    var tag: String?
    var isOpen: Bool
    var withBorder: Bool = true
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            HStack(spacing: Size.s0) {
                if let iconData = iconData {
                    SirioIcon(data: iconData)
                        .frame(width: Size.Accordion.Icon.frame,
                               height: Size.Accordion.Icon.frame)
                        .foregroundColor(iconColor)
                        .padding(.trailing, Size.p16)

                }
                SirioText(text: title, typography: Typography.Accordion.title)
                    .foregroundColor(textColor)
                    .lineLimit(2)
                    .if(text == nil || tag == nil) { view in
                        view.padding(.trailing, Size.p24)
                    }
                
                Spacer()
                
                if let tag = tag, !tag.isEmpty {
                    SirioTag(type: colorScheme == .dark ? .white : .gray, text: tag)
                        .padding(.horizontal, Size.p12)
                } else if let text = text, !text.isEmpty {
                    SirioText(text: "( \(text) )", typography: Typography.Accordion.text)
                        .foregroundColor(textColor)
                        .padding(.horizontal, Size.p12)
                }
                
                SirioIcon(data: .init(icon: isOpen ? .angleUp : .angleDown))
                    .frame(width: Size.Accordion.Arrow.frame,
                           height: Size.Accordion.Arrow.frame)
                    .foregroundColor(iconColor)
            }
            .frame(height: Size.Accordion.sectionHeight)
            .padding(.horizontal, Size.p16)
            .border(borderColor, width: Size.Accordion.borderWidth)
        }
        .background(backgroundColor)
    }
    
    private var borderColor: Color {
        if withBorder {
            return colorScheme == .dark ? Color.Accordion.Border.dark : Color.Accordion.Border.light
        }
        return Color.clear
    }
    
    private var backgroundColor: Color {
        let defaultColor: Color = colorScheme == .dark ? Color.Accordion.Background.Default.dark : Color.Accordion.Background.Default.light
        let activeColor: Color = colorScheme == .dark ? Color.Accordion.Background.Active.dark : Color.Accordion.Background.Active.light

        if isOpen {
            return activeColor
        } else {
            return defaultColor
        }
    }
    
    private var textColor: Color {
        return colorScheme == .dark ? Color.Accordion.Text.dark : Color.Accordion.Text.light
    }
    
    private var iconColor: Color {
        return colorScheme == .dark ? Color.Accordion.Icon.dark : Color.Accordion.Icon.light
    }
}

#Preview {
    VStack {
        SirioBaseAccordion(data: .init(title: "Accordion Item #1", content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
        }, onTapAccordion: { isOpen in
            
        }))
        
        
        // Icon
        SirioBaseAccordion(data: .init(iconData: SirioIconData(icon: .cube),
                                       title: "Accordion Item #1",
                                       content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
        }, onTapAccordion: { isOpen in
            
        }))
        
        // Tag
        SirioBaseAccordion(data: .init(title: "Accordion Item #1",
                                       tag: "Tag",
                                       content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
        }, onTapAccordion: { isOpen in
            
        }))
        
        // Text
        SirioBaseAccordion(data: .init(title: "Accordion Item #1", text: "Text", content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
        }, onTapAccordion: { isOpen in
            
        }))
        
        SirioBaseAccordion(data: .init(title: "Accordion Item con testo molto molto molto molto molto molto molto molto molto molto molto molto lungo ", content: {
            SirioText(text: "Lorem ipsum", typography: .label_md_700)
                .foregroundColor(.black)
            
        }))
        
        Spacer()
    }
}
