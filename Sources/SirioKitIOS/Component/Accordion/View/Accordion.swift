//
// Accordion.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Displays collapsible content panels for presenting information in a limited amount of space
/// - Parameters:
///   - data: The content of the component
public struct Accordion: View {
    private var data: AccordionData
    
    public init(data: AccordionData) {
        self.data = data
    }
    
    public var body: some View {
        BaseAccordion(data: data)
    }
}

struct Accordion_Previews: PreviewProvider {
    static var previews: some View {
        Accordion(data: .init(text: "Accordion Item #1", content: {
            SirioText(text: .loremIpsum, typography: .label_md_700)
                .foregroundColor(.black)
        }))
        .colorScheme(.dark)
    }
}
