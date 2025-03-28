//
// SirioTableCellMultiIcons.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellMultiIcons: View {
    var size: SirioTableSize
    var scroll: Bool
    var iconsData: [SirioIconData]
    
    public init(size: SirioTableSize,
                scroll: Bool = false,
                iconsData: [SirioIconData]){
        self.size = size
        self.scroll = scroll
        self.iconsData = Array(iconsData.prefix(3))
        
        if iconsData.count > 3 {
            print("The items should be a maximum of 3.")
        }
    }
    
    public var body: some View {
        
        HStack(spacing: Size.zero) {
            VStack(spacing: Size.zero) {
                
                HStack(spacing: Size.Table.Cell.Icons.spacing) {
                    Spacer()
                    ForEach(iconsData) { data in
                        SirioIcon(data: data)
                            .foregroundStyle(iconsColor)
                            .frame(width: Size.Table.Cell.Icons.frame, height: Size.Table.Cell.Icons.frame)
                            .padding(.vertical, Size.Table.Cell.Icons.paddingVertical)
                            .padding(.horizontal, Size.Table.Cell.Icons.paddingHorizontal)
                            .onTapGesture {
                                data.action()
                            }
                    }
                }
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
    
    private var iconsColor: Color {
        return Color.Table.Cell.icon
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
                SirioTableCellMultiIcons(size: size, iconsData: [.previewPdf, .previewDownload, .previewTrash])
            }
        }.padding()
        
        VStack{
            ForEach(SirioTableSize.allCases, id: \.self) { size in
                SirioTableCellMultiIcons(size: size, scroll: true, iconsData: [.previewPdf, .previewDownload, .previewTrash])
            }
        }.padding()
    }
}
