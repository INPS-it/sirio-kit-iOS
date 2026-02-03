//
// SirioTableDrawerLink.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableDrawerLink: View {
    var header: String
    var text: String
    var onTapLinkAction: () -> Void
    
    public init(header: String,
                text: String = "Link",
                onTapLinkAction: @escaping () -> Void){
        self.header = header
        self.text = text
        self.onTapLinkAction = onTapLinkAction
        
        let isValidURL: Bool = {
            if let url = URL(string: text),
               url.scheme != nil,
               url.host != nil {
                return true
            }
            return false
        }()
        
    }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            SirioText(text: header, typography: .labelMdHeavy)
                .foregroundStyle(Color.specificDataEntryLabelColorDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer(minLength: Size.Table.Drawer.spacer)
            
            Button(action: {
                onTapLinkAction()
            }, label: {
                SirioText(text: text, typography: Typography.Table.Cell.link, isUnderlined: true)
                    .foregroundStyle(textColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            })
            
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
                    .frame(height: Size.Table.Drawer.line) // bottom
                    .foregroundColor(borderColor)
                    .padding(.horizontal, Size.p24)
            },
            alignment: .bottom
        )
    }
    
    private var borderColor: Color {
        return Color.aliasTextColorPrimaryLight50
    }
    
    private var textColor: Color {
        return Color.Table.Cell.link
    }
}


#Preview {
    SirioTableDrawerLink(header: "Header",
                         text: "Link",
                         onTapLinkAction: {})
    .padding()
}
