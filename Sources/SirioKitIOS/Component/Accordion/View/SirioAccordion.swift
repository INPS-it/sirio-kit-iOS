//
// SirioAccordion.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view that displays collapsible content panels for presenting information in a limited amount of space.
/// This component allows for the expansion and collapse of content panels, enabling the user to toggle visibility of additional information.
///
/// - Parameters:
///   - data: An instance of `SirioAccordionData` that contains the content to be displayed within the accordion panel.


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
