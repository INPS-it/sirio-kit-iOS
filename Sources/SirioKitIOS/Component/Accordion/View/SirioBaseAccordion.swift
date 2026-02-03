//
// SirioBaseAccordion.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The base implementation of an accordion component that toggles between expanded and collapsed states.
/// This view represents an individual accordion panel, with the ability to expand or collapse its content when tapped.
///
/// - Parameters:
///   - data: An instance of `SirioAccordionData` that provides the content and state for the accordion.
///   - withBorder: A boolean value that determines if the accordion content should have a border. Defaults to `true`.
///

struct SirioBaseAccordion: View {
    @ObservedObject private var data: SirioAccordionData
    private var withBorder: Bool
    
    init(data: SirioAccordionData, withBorder: Bool = true){
        self.data = data
        self.withBorder = withBorder
    }
    
    var body: some View {
        VStack(spacing: Size.zero){
            Button(action: {
                withAnimation(Animation.interactiveSpring()){
                    self.data.isOpen.toggle()
                    self.data.onTapAccordion?(self.data.isOpen)
                }
            }, label: {
                // Inside style
            }).buttonStyle(SirioAccordionStyle(iconData: data.iconData,
                                               title: data.title,
                                               text: data.text,
                                               tag: data.tag,
                                               isOpen: data.isOpen,
                                               withBorder: withBorder))
            .setAccessibilityLabel(data.accessibilityLabel)
            
            if data.isOpen {
                self.data.content
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity)
                    .padding(Size.p16)
                    .border(Color.Accordion.Border.content, width: 1)
                    .background(Color.white)
            }
        }
    }
}

#Preview {
    VStack {
        SirioBaseAccordion(data: .init(title: "Accordion Item #1", content: {
            SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
        }, onTapAccordion: { isOpen in
            
        }))
        
        // Icon
        SirioBaseAccordion(data: .init(iconData: SirioIconData(icon: .cube),
                                       title: "Accordion Item #1",
                                       content: {
            SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
        }, onTapAccordion: { isOpen in
            
        }))
        
        // Tag
        SirioBaseAccordion(data: .init(title: "Accordion Item #1",
                                       tag: "Tag",
                                       content: {
            SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
        }, onTapAccordion: { isOpen in
            
        }))
        
        // Text
        SirioBaseAccordion(data: .init(title: "Accordion Item #1", text: "Text", content: {
            SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
        }, onTapAccordion: { isOpen in
            
        }))
        
        SirioBaseAccordion(data: .init(title: "Accordion Item con testo molto molto molto molto molto molto molto molto molto molto molto molto lungo ", content: {
            SirioText(text: "Lorem ipsum", typography: .bodyMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
            
        }))
        
        Spacer()
    }
}
