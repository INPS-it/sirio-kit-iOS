//
// SirioBaseAccordion.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
        VStack(spacing: 0){
            Button(action: {
                if !self.data.isDisabled {
                    withAnimation(Animation.interactiveSpring()){
                        self.data.isOpen.toggle()
                        self.data.onTapAccordion?(self.data.isOpen)
                    }
                }
            }, label: {
                // Inside style
            }).buttonStyle(SirioAccordionStyle(text: data.text,
                                          isOpen: data.isOpen,
                                          isDisabled: $data.isDisabled,
                                          withBorder: withBorder))
            .setAccessibilityLabel(data.accessibilityLabel)
            
            if data.isOpen {
                self.data.content
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity)
                    .padding(Size.Accordion.paddingContent)
                    .border(Color.Accordion.Border.content, width: 1)
                    .background(Color.white)
            }
        }
    }
}

#Preview {
    VStack {
        SirioBaseAccordion(data: .init(text: "Accordion Item #1", content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
        }, onTapAccordion: { isOpen in
            
        }))
        
        SirioBaseAccordion(data: .init(text: "Accordion Item con testo molto molto molto molto molto molto molto molto molto molto molto molto lungo ", content: {
            SirioText(text: "Lorem ipsum", typography: .label_md_700)
                .foregroundColor(.black)
            
        }))
        
        Spacer()
    }
}
