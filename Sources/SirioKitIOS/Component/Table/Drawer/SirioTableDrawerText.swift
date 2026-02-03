//
// SirioTableDrawerText.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableDrawerText: View {
    var header: String
    var text: String
    
    public init(header: String,
                text: String){
        self.header = header
        self.text = text
    }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            SirioText(text: header, typography: .labelMdHeavy)
                .foregroundStyle(Color.specificDataEntryLabelColorDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer(minLength: Size.Table.Drawer.spacer)
            
            SirioText(text: text, typography: .labelMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, Size.p24)
        .padding(.vertical, Size.p12)
        .frame(maxWidth: .infinity)
        .frame(height: Size.Table.Drawer.frame)
        .background(Color.aliasTextColorPrimaryLight0)
        .overlay(
            VStack(spacing: Size.zero) {
                Spacer()
                Rectangle()
                    .frame(height: Size.Table.Drawer.line)
                    .foregroundColor(borderColor)
                    .padding(.horizontal, Size.p24)
            },
            alignment: .bottom
        )
    }
    
    private var borderColor: Color {
        return Color.aliasTextColorPrimaryLight50
    }
}



#Preview {
    SirioTableDrawerText(header: "Header",
                         text: "Lorem ipsum")
    .padding()
}
