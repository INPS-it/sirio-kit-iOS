//
// SirioAccordionGroup.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A group of collapsible accordion panels displayed in a vertical stack.
/// This view allows you to present multiple accordion panels, each containing its own content. The accordions are displayed in a column with optional separators between them.
///
/// - Parameters:
///   - data: A list of `SirioAccordionData`, where each item represents the content for one individual accordion panel.
///
public struct SirioAccordionGroup: View {
    @Environment(\.colorScheme) var colorScheme

    let data: [SirioAccordionData]
    
    public init(data: [SirioAccordionData]){
        self.data = data
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(data.indices, id: \.self) { i in
                VStack(spacing: 0) {
                    SirioBaseAccordion(data: data[i], withBorder: false)
                    
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

extension SirioAccordionGroup {
    var borderColor: Color {
        colorScheme == .dark ? Color.clear : Color.Accordion.Border.light
    }
}

#Preview {
    VStack {
        SirioAccordionGroup(data: [
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
