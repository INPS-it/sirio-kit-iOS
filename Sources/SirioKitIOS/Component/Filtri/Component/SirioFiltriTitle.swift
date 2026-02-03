//
// SirioFiltriTitle.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
/// A header view with a title and subtitle.
///
/// - Parameters:
///   - title: Main title text.
///   - subtitle: Subtitle text shown below the title.

public struct SirioFiltriTitle: View {
    var title: String
    var subtitle: String?
    
    public init(title: String, subtitle: String?) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.s4) {
            HStack {
                SirioText(text: title, typography: .labelMdHeavy)
                    .foregroundStyle(Color.specificDataEntryLabelColorDefault)
                Spacer()
            }
            if let subtitle = subtitle, !subtitle.isEmpty{
                HStack {
                    SirioText(text: subtitle, typography: .bodyMdRegular)
                        .foregroundStyle(Color.specificDataEntryLabelColorDefault)
                }
            }
        }
        .padding(.horizontal, Size.p24)
        .padding(.vertical, Size.p8)
        .background(Color.aliasBackgroundColorPrimaryLight0)
        
    }
    
}

#Preview {
    VStack {
        SirioFiltriTitle(title: "Section Title", subtitle: .loremIpsum)
    }
}
