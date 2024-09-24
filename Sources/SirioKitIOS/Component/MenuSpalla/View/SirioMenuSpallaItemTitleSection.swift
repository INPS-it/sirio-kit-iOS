//
// SirioMenuSpallaItemTitleSection.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioMenuSpallaItemTitleSection: View {
    private var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.MenuSpalla.TitleSection.spacingVertical) {
            SirioText(text: title, typography: Typography.MenuSpalla.TitleSection.title)
                .foregroundStyle(Color.MenuSpalla.TitleSection.text)
                .padding(.top, Size.MenuSpalla.TitleSection.paddingTop)
                .padding(.bottom, Size.MenuSpalla.TitleSection.paddingBottom)
                .padding(.horizontal, Size.MenuSpalla.TitleSection.paddingHorizontal)

            Rectangle()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: Size.MenuSpalla.TitleSection.heightLine)
                .foregroundStyle(Color.MenuSpalla.TitleSection.line)
        }
    }
}

#Preview {
    SirioMenuSpallaItemTitleSection(title: "Label menu")
}
