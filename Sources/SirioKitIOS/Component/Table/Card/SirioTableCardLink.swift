//
// SirioTableCardLink.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCardLink: View {
    var header: String
    var text: String
    var parity: SirioTableCellParity
    var onTapLinkAction: (() -> Void)?
    var showSeparator: Bool
    
    public init(header: String,
                text: String = "Link",
                parity: SirioTableCellParity,
                onTapLinkAction: (() -> Void)? = nil,
                showSeparator: Bool = true){
        self.header = header
        self.text = text
        self.parity = parity
        self.onTapLinkAction = onTapLinkAction
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
            if !text.isEmpty && !header.isEmpty {
                Spacer(minLength: Size.s8)
            }
            
            if !text.isEmpty {
                Button(action: {
                    onTapLinkAction?()
                }, label: {
                    SirioText(text: text, typography: Typography.Table.Cell.link, isUnderlined: true)
                        .foregroundStyle(textColor)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, Size.zero)
        .padding(.vertical, Size.s12)
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
    
    private var textColor: Color {
        return Color.Table.Cell.link
    }
}



#Preview {
    VStack {
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            HStack {
                SirioTableCardLink(header: "Header",
                                    text: "Link",
                                    parity: parity)
            }
            
            
            SirioTableCardLink(header: "Header lungo su due righe",
                                text: "Link molto molto lungo",
                                parity: parity)
        }
    }.padding()
}
