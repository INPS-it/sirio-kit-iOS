//
// SirioTableCardText.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCardText: View {
    var header: String
    var text: String
    var parity: SirioTableCellParity
    var showSeparator: Bool

    public init(header: String,
                text: String,
                parity: SirioTableCellParity,
                showSeparator: Bool = true){
        self.header = header
        self.text = text
        self.parity = parity
        self.showSeparator = showSeparator
    }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            if !header.isEmpty {
                SirioText(text: header, typography: .labelMdHeavy)
                    .foregroundStyle(Color.specificDataEntryLabelColorDefault)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(100)
                    .multilineTextAlignment(.leading)
            }
            
            if !text.isEmpty && !header.isEmpty == false {
                Spacer(minLength: Size.s8)
            }
            
            if !text.isEmpty {
                SirioText(text: text, typography: .labelMdRegular)
                    .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(100)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.horizontal, Size.zero)
        .padding(.vertical, Size.p12)
        .frame(maxWidth: .infinity)
        .frame(minHeight: 38)
        .background(backgroundColor)
        .if(showSeparator, transform: { view in
            view.overlay(
                VStack(spacing: Size.zero) {
                    Spacer()
                    Rectangle()
                        .frame(height: 1) // bottom
                        .foregroundColor(borderColor)
                        .padding(.horizontal, Size.zero)
                },
                alignment: .bottom
            )
        })
    }
    
    private var backgroundColor: Color {
        switch parity {
        case .even:
            return Color.aliasTextColorPrimaryLight40
        case .odd:
            return Color.aliasTextColorPrimaryLight0
        }
    }
    
    private var borderColor: Color {
        return Color.aliasTextColorPrimaryLight50
    }
}



#Preview {
    VStack {
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCardText(header: "Header molto molto molto lungo",
                               text: .loremIpsum,
                                parity: parity)
        }
    }.padding()
}
