//
// AccordionGroup.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

///  A group of accordions in column
/// - Parameters:
///   - data: A list of [AccordionData] each with the content of one accordion
public struct AccordionGroup: View {
    @Environment(\.colorScheme) var colorScheme

    let data: [AccordionData]
    
    public init(data: [AccordionData]){
        self.data = data
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(data.indices, id: \.self) { i in
                VStack(spacing: 0) {
                    BaseAccordion(data: data[i], withBorder: false)
                    
                    if i < data.count - 1 { // The separator is shown only if it isn't the last item
                        Rectangle()
                            .fill(borderColor)
                            .frame(height: Size.Accordion.borderWidth)
                    }
                }
            }
        }
        .border(borderColor, width: Size.Accordion.borderWidth)
    }
}

extension AccordionGroup {
    var borderColor: Color {
        colorScheme == .dark ? Color.clear : Color.Accordion.Border.light
    }
}

struct AccordionGroup_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            AccordionGroup(data: [
                .init(text: "Accordion #1", content: {
                    SirioText(text: .loremIpsum, typography: .label_md_700)
                        .foregroundColor(.black)
                }),
                .init(text: "Accordion #2", content: {
                    SirioText(text: .loremIpsum, typography: .label_md_700)
                        .foregroundColor(.black)
                }),
                .init(text: "Accordion #3", content: {
                    SirioText(text: .loremIpsum, typography: .label_md_700)
                        .foregroundColor(.black)
                }, isDisabled: true)
            ])
            Spacer()
        }
    }
}
