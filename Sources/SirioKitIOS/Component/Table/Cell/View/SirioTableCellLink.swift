//
// SirioTableCellLink.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellLink: View {
    var size: SirioTableSize
    var text: String
    var scroll: Bool
    var onTapLinkAction: () -> Void
    
    public init(size: SirioTableSize,
                text: String,
                scroll: Bool = false,
                onTapLinkAction: @escaping () -> Void){
        self.size = size
        self.text = text
        self.scroll = scroll
        self.onTapLinkAction = onTapLinkAction
    }
    
    public var body: some View {
        
        HStack(spacing: Size.Table.Cell.spacing) {
            VStack(alignment: .leading, spacing: Size.Table.Cell.spacing) {
                
                SirioText(text: text, typography: Typography.Table.Cell.link, isUnderlined: true)
                    .foregroundStyle(textColor)
                    .padding(.horizontal, padding)
                    .frame(height: height - Size.Table.Cell.line)
                
                Rectangle()
                    .fill(borderColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: Size.Table.Cell.line)
            }
            
            Rectangle()
                .fill(scroll ? scrollColor : borderColor)
                .frame(maxHeight: .infinity)
                .frame(width: scroll ? Size.Table.Cell.scrollWidth : Size.Table.Cell.line)
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(backgroundColor)
    }
    
    private var padding: CGFloat {
        switch size {
        case .xsmall:
            Size.Table.Cell.Padding.xsmall
        case .small:
            Size.Table.Cell.Padding.small
        case .medium:
            Size.Table.Cell.Padding.medium
        case .large:
            Size.Table.Cell.Padding.large
        }
    }
    
    private var textColor: Color {
        return Color.Table.Cell.link
    }
    
    private var backgroundColor: Color {
        return Color.Table.Cell.background
    }
    
    private var borderColor: Color {
        return Color.Table.Cell.border
    }
    
    private var scrollColor: Color {
        return Color.Table.Cell.scroll
    }
    
    private var height: CGFloat {
        switch size {
        case .xsmall:
            return Size.Table.Cell.Height.xsmall
        case .small:
            return Size.Table.Cell.Height.small
        case .medium:
            return Size.Table.Cell.Height.medium
        case .large:
            return Size.Table.Cell.Height.large
        }
    }
}

#Preview {
    HStack {
        VStack{
            ForEach(SirioTableSize.allCases, id: \.self) { size in
                SirioTableCellLink(size: size, text: "Lorem ipsum", onTapLinkAction: {})
            }
        }.padding()
        
        VStack{
            ForEach(SirioTableSize.allCases, id: \.self) { size in
                SirioTableCellLink(size: size, text: "Lorem ipsum", scroll: true, onTapLinkAction: {})
            }
        }.padding()
    }
}
