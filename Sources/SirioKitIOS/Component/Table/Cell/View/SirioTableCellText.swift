//
// SirioTableCellText.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellText: View {
    var size: SirioTableSize
    var text: String
    var scroll: Bool
    @Binding var isChecked: Bool
    var onTapCheckBoxAction: (() -> Void)?
    
    public init(size: SirioTableSize,
                text: String,
                scroll: Bool = false,
                isChecked: Binding<Bool>,
                onTapCheckBoxAction: (() -> Void)? = nil){
        self.size = size
        self.text = text
        self.scroll = scroll
        self._isChecked = isChecked
        self.onTapCheckBoxAction = onTapCheckBoxAction
    }
    
    public var body: some View {
        
        HStack(spacing: Size.zero) {
            VStack(alignment: .leading, spacing: Size.zero) {
                
                HStack(spacing: Size.zero) {
                    SirioCheckbox(text: text, isChecked: $isChecked, callback: { _ in
                        // Azione di callback
                        self.onTapCheckBoxAction?()
                    })
                }
                .padding(.leading, padding)
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
                SirioTableCellText(size: size, text: "Title", isChecked: .constant(false), onTapCheckBoxAction: {})
            }
        }.padding()
        
        VStack{
            ForEach(SirioTableSize.allCases, id: \.self) { size in
                SirioTableCellText(size: size, text: "Title", scroll: true, isChecked: .constant(false), onTapCheckBoxAction: {})
            }
        }.padding()
    }
}
