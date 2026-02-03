//
// SirioTableCellTextOnly.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellTextOnly: View {
    var size: SirioTableSize
    var text: String
    var parity: SirioTableCellParity
    var width: CGFloat
    var height: CGFloat
    
    public init(size: SirioTableSize,
                text: String,
                parity: SirioTableCellParity,
                width: CGFloat = 0,
                height: CGFloat = 0){
        self.size = size
        self.text = text
        self.parity = parity
        self.width = width
        self.height = height
        
    }
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            SirioText(text: text, typography: .labelMdRegular)
        }
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .frame(minWidth: width, minHeight: minHeight, alignment: .leading)
        .background(backgroundColor)
        .overlay(
            VStack(spacing: Size.zero) {
                Spacer()
                Rectangle()
                    .frame(height: Size.Table.borderWidth) // bottom
                    .foregroundColor(borderColor)
            },
            alignment: .bottom
        )
        .overlay(
            HStack(spacing: Size.zero) {
                Spacer()
                Rectangle()
                    .frame(width: Size.Table.borderWidth) // trailing
                    .foregroundColor(borderColor)
            },
            alignment: .trailing
        )
    }

    private var paddingVertical: CGFloat {
        switch size {
        case .small: Size.Table.Padding.Vertical.small
        case .large: Size.Table.Padding.Vertical.large
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .small: Size.Table.Padding.Horizontal.small
        case .large: Size.Table.Padding.Horizontal.large
        }
    }
    
    private var minHeight: CGFloat {
        switch size {
        case .small:
            return max(height, Size.Table.Cell.Height.small)
        case .large:
            return max(height, Size.Table.Cell.Height.large)
        }
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
    VStack{
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCellTextOnly(size: .small,
                                text: "Title knodnw onopwnviown ipvnwpiv npwinvpwnvpewnponwpbnwponbpwnopbnwponbopwnbopwn vpiwn pivnwpn",
                                parity: parity)
            
        }
        
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCellTextOnly(size: .large,
                                text: "Title",
                                parity: parity)
            
        }
    }.padding()
}
