//
// BaseAccordion.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Base Accordion implementation
/// - Parameters:
///   - data: AccordionData model
///   - withBorder: A boolean to manage the borders

struct BaseAccordion: View {
    @ObservedObject private var data: AccordionData
    private var withBorder: Bool
    
    init(data: AccordionData, withBorder: Bool = true){
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
            }).buttonStyle(AccordionStyle(text: data.text,
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
        BaseAccordion(data: .init(text: "Accordion Item #1", content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
        }, onTapAccordion: { isOpen in
            
        }))
        
        BaseAccordion(data: .init(text: "Accordion Item #1", content: {
            SirioText(text: "Lorem ipsum", typography: .label_md_700)
                .foregroundColor(.black)
            
        }))
        
        Spacer()
    }
}
