//
// SirioTableCellAvatar.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellAvatar: View {
    var size: SirioTableSize
    var title: String
    var subtitle: String
    var scroll: Bool
    var iconData: SirioIconData
    
    public init(size: SirioTableSize,
                title: String,
                subtitle: String,
                iconData: SirioIconData,
                scroll: Bool = false){
        self.size = size
        self.title = title
        self.subtitle = subtitle
        self.iconData = iconData
        self.scroll = scroll
    }
    
    public var body: some View {
        
        HStack(spacing: Size.zero) {
            VStack(alignment: .leading, spacing: Size.zero) {
                
                HStack(spacing: Size.Table.Cell.Avatar.spacing) {
                    
                    SirioIcon(data: iconData)
                        .foregroundStyle(iconsColor)
                        .frame(width: Size.Table.Cell.Icons.frame, height: Size.Table.Cell.Icons.frame)
                        .padding(.vertical, Size.Table.Cell.Icons.paddingVertical)
                        .padding(.horizontal, Size.Table.Cell.Icons.paddingHorizontal)
                        .clipShape(Circle())
                    
                    
                    VStack(alignment: .leading, spacing: Size.zero) {
                        SirioText(text: title, typography: .placeholder_md_400)
                            .foregroundStyle(textColor)
                            .lineLimit(1)
                        SirioText(text: subtitle, typography: .helper_text_xs_400)
                            .foregroundStyle(textColor)
                            .lineLimit(1)
                    }
                    
                    //Spacer()
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
    
    private var textColor: Color {
        return Color.Table.Cell.text
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
                SirioTableCellAvatar(size: size, title: "Avatar Name", subtitle: "email@mail.com", iconData: .previewDownload)
            }
        }.padding()
        
        VStack{
            ForEach(SirioTableSize.allCases, id: \.self) { size in
                SirioTableCellAvatar(size: size, title: "Avatar Name", subtitle: "email@mail.com", iconData: .previewDownload, scroll: true)
            }
        }.padding()
    }
}
