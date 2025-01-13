//
// SirioTableVerticalCell.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableVerticalCell: View, Identifiable {
    public var id = UUID()
    public var schemeColor: SchemeColor
    public var data: [SirioTableVerticalCellData]
    public var icons: [SirioIconData]
    
    public init(schemeColor: SchemeColor, data: [SirioTableVerticalCellData], icons: [SirioIconData]) {
        self.schemeColor = schemeColor
        self.data = data
        self.icons = icons
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ForEach(data) { item in
                HStack {
                    SirioText(text: item.title, typography: .label_md_700)
                        .foregroundStyle(Color.Table.Cell.text)
                    Spacer()
                }
                
                HStack {
                    if item.type == .tag {
                        SirioTag(type: .gray, text: item.subtitle)
                    } else {
                        SirioText(text: item.subtitle, typography: getSubtitleTypography(data: item), isUnderlined: item.type == .link)
                            .foregroundStyle(getSubtitleColor(data: item))
                    }
                    Spacer()
                }
            }
            
            HStack(spacing: Size.Table.Expanded.spacing) {
                Spacer()
                
                ForEach(icons) { icon in
                    Button(action: {
                        icon.action()
                    }, label: {
                        SirioIcon(data: icon)
                            .frame(width: Size.Table.Expanded.iconFrame, height: Size.Table.Expanded.iconFrame)
                            .foregroundStyle(StyleDictionaryColor.globalPrimary100.color)
                    })
                    .frame(width: Size.Table.Expanded.buttonFrame, height: Size.Table.Expanded.buttonFrame)

                }
            }
        }
        .padding(.horizontal, Size.Table.Expanded.paddingHorizontal)
        .padding(.vertical, Size.Table.Expanded.paddingVertical)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .overlay(
            Rectangle()
                .stroke(borderColor, lineWidth: Size.Table.Expanded.lineWidth)
        )
    }
    
    private func getSubtitleTypography(data: SirioTableVerticalCellData) -> Typography {
        switch data.type {
        case .text:
            return Typography.Table.Cell.text
        case .date:
            return Typography.Table.Cell.date
        case .number:
            return Typography.Table.Cell.number
        case .link:
            return Typography.Table.Cell.link
        default:
            return Typography.Table.Cell.text
        }
    }
    
    private func getSubtitleColor(data: SirioTableVerticalCellData) -> Color {
        if data.type == .link {
            return Color.Table.Cell.link
        }
        return Color.Table.Cell.text
    }
    
    private var backgroundColor: Color {
        switch schemeColor {
        case .light:
            return StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        case .dark:
            return StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
        }
    }
    
    private var borderColor: Color {
        return StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color
        
    }
}

#Preview {
    ScrollView {
        SirioTableVerticalCell(schemeColor: .light,
                               data: [
                                .init(title: "Header", subtitle: "Link", type: .link),
                                .init(title: "Header", subtitle: "23/11/2023", type: .date),
                                .init(title: "Header", subtitle: "00", type: .number),
                                .init(title: "Header", subtitle: "Lorem ipsum", type: .text),
                                .init(title: "Header", subtitle: "Label tag", type: .tag)],
                               icons: [.previewPdf, .previewDownload, .previewTrash])
        
        
        SirioTableVerticalCell(schemeColor: .dark,
                               data: [
                                .init(title: "Header", subtitle: "Link", type: .link),
                                .init(title: "Header", subtitle: "23/11/2023", type: .date),
                                .init(title: "Header", subtitle: "00", type: .number),
                                .init(title: "Header", subtitle: "Lorem ipsum", type: .text),
                                .init(title: "Header", subtitle: "Label tag", type: .tag)],
                               icons: [.previewPdf, .previewDownload, .previewTrash])
    }
    .padding()
}
