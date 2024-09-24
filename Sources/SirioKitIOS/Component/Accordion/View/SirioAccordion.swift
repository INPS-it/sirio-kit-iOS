//
// SirioAccordion.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Displays collapsible content panels for presenting information in a limited amount of space
/// - Parameters:
///   - data: The content of the component

public struct SirioAccordion: View {
    private var data: SirioAccordionData
    
    public init(data: SirioAccordionData) {
        self.data = data
    }
    
    public var body: some View {
        SirioBaseAccordion(data: data)
    }
}

#Preview {
    SirioAccordion(data: .init(text: "Accordion Item #1", content: {
        SirioText(text: .loremIpsum, typography: .label_md_700)
            .foregroundColor(.black)
    }))
    .colorScheme(.dark)
}
