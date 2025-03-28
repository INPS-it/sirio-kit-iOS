//
// SirioTableCell.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioTableCellType {
    case header(schemeColor: SchemeColor = .dark,
                alignment: SirioAlignment,
                size: SirioTableSize,
                title: String,
                scroll: Bool = false,
                hasCheckBox: Bool = false,
                isChecked: Binding<Bool> = .constant(false),
                withSort: Bool = false,
                onTapCheckBoxAction: (() -> Void)? = nil,
                onTapButtonAction: (() -> Void)? = nil)
    
    case avatar(size: SirioTableSize,
                title: String,
                subtitle: String,
                iconData: SirioIconData,
                scroll: Bool = false)
    
    case link(size: SirioTableSize,
              text: String,
              scroll: Bool = false,
              onTapLinkAction: () -> Void)
    
    case multiIcons(size: SirioTableSize,
                    scroll: Bool = false,
                    iconsData: [SirioIconData])
    
    case number(size: SirioTableSize,
                text: String,
                scroll: Bool = false,
                isChecked: Binding<Bool>,
                onTapCheckBoxAction: (() -> Void)? = nil)
    
    case numberOnly(size: SirioTableSize,
                    text: String,
                    scroll: Bool = false)
    
    case tag(size: SirioTableSize,
             tagType: SirioTagType,
             text: String,
             scroll: Bool = false)
    
    case text(size: SirioTableSize,
              text: String,
              scroll: Bool = false,
              isChecked: Binding<Bool>,
              onTapCheckBoxAction: (() -> Void)? = nil)
    
    case textOnly(size: SirioTableSize,
                  text: String,
                  scroll: Bool = false)
    
}

public struct SirioTable: View {
    var schemeColor: SchemeColor
    var title: String?
    var items: [SirioTitleBarItemData]?
    var headers: SirioTableRowData
    var columns: [SirioTableColumnData]
    
    public init(schemeColor: SchemeColor = .dark, title: String?, items: [SirioTitleBarItemData]? = nil, headers: SirioTableRowData, columns: [SirioTableColumnData]) {
        self.schemeColor = schemeColor
        self.title = title
        self.items = items
        self.headers = headers
        self.columns = columns
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            if let title = title, !title.isEmpty {
                SirioTitleBar(title: title, items: items)
            }
            VStack(spacing: 0){
                Rectangle()
                    .fill(borderColor)
                    .frame(height: Size.Table.Cell.line)
                    .frame(maxWidth: .infinity)

                HStack(spacing: Size.zero) {
                    
                    ForEach(headers.cells.indices, id: \.self) { index in
                        cellView(cell: headers.cells[index])
                    }
                }
                HStack(spacing: Size.zero) {
                    ForEach(columns.indices, id: \.self) { rowIndex in
                        VStack(spacing: Size.zero) {
                            ForEach(columns[rowIndex].cells.indices, id: \.self) { cellIndex in
                                cellView(cell: columns[rowIndex].cells[cellIndex])
                            }
                        }
                    }
                }
            }.overlay(
                Rectangle()
                    .fill(borderColor)
                    .frame(width: Size.Table.Cell.line),
                alignment: .leading 
            )
        }
    }
    
    private var borderColor: Color {
        Color.Table.Header.border
    }
    
    @ViewBuilder
    private func cellView(cell: SirioTableCellType) -> some View {
        switch cell {
        case let .header(schemeColor, alignment, size, title, scroll, hasCheckBox, isChecked, withSort, onTapCheckBoxAction, onTapButtonAction):
            SirioTableHeader(schemeColor: schemeColor,
                             alignment: alignment,
                             size: size,
                             title: title,
                             scroll: scroll,
                             hasCheckBox: hasCheckBox,
                             isChecked: isChecked,
                             withSort: withSort,
                             onTapCheckBoxAction: onTapCheckBoxAction,
                             onTapButtonAction: onTapButtonAction)
            
        case .avatar(size: let size, title: let title, subtitle: let subtitle, iconData: let iconData, scroll: let scroll):
            SirioTableCellAvatar(size: size,
                                 title: title,
                                 subtitle: subtitle,
                                 iconData: iconData,
                                 scroll: scroll)
            
        case .link(size: let size, text: let text, scroll: let scroll, onTapLinkAction: let onTapLinkAction):
            SirioTableCellLink(size: size,
                               text: text,
                               scroll: scroll,
                               onTapLinkAction: onTapLinkAction)
            
        case .multiIcons(size: let size, scroll: let scroll, iconsData: let iconsData):
            SirioTableCellMultiIcons(size: size,
                                     scroll: scroll,
                                     iconsData: iconsData)
            
        case .number(size: let size, text: let text, scroll: let scroll, isChecked: let isChecked, onTapCheckBoxAction: let onTapCheckBoxAction):
            SirioTableCellNumber(size: size,
                                 text: text,
                                 scroll: scroll,
                                 isChecked: isChecked,
                                 onTapCheckBoxAction: onTapCheckBoxAction)
            
        case .numberOnly(size: let size, text: let text, scroll: let scroll):
            SirioTableCellNumberOnly(size: size,
                                     text: text,
                                     scroll: scroll)
            
        case .tag(size: let size, tagType: let tagType, text: let text, scroll: let scroll):
            SirioTableCellTag(size: size,
                              tagType: tagType,
                              text: text,
                              scroll: scroll)
            
        case .text(size: let size, text: let text, scroll: let scroll, isChecked: let isChecked, onTapCheckBoxAction: let onTapCheckBoxAction):
            SirioTableCellText(size: size,
                               text: text,
                               scroll: scroll,
                               isChecked: isChecked,
                               onTapCheckBoxAction: onTapCheckBoxAction)
            
        case .textOnly(size: let size, text: let text, scroll: let scroll):
            SirioTableCellTextOnly(size: size,
                                   text: text,
                                   scroll: scroll)
        }
    }
}

#Preview {
    SirioTable(
        title: "Title",
        headers: SirioTableRowData(cells: [
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 0", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 1", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 2", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
            
        ]),
        columns: [
            
            SirioTableColumnData(cells: [
                .textOnly(size: .medium, text: "Text 0", scroll: false),
                .textOnly(size: .medium, text: "Text 1", scroll: false),
                .textOnly(size: .medium, text: "Text 2", scroll: false)
            ]),
            
            SirioTableColumnData(cells: [
                .numberOnly(size: .medium, text: "0", scroll: false),
                .numberOnly(size: .medium, text: "1", scroll: false),
                .numberOnly(size: .medium, text: "2", scroll: false)
            ]),
            
            SirioTableColumnData(cells: [
                .textOnly(size: .medium, text: "Text 0", scroll: false),
                .textOnly(size: .medium, text: "Text 1", scroll: false),
                .textOnly(size: .medium, text: "Text 2", scroll: false)
            ]),
        ]
    )
}


#Preview {
    SirioTable(
        title: "Title",
        headers: SirioTableRowData(cells: [
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 0", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 1", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 2", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
            
        ]),
        columns: [
            
            
            SirioTableColumnData(cells: [
                .link(size: .medium, text: "Link 0", scroll: false, onTapLinkAction: {}),
                .link(size: .medium, text: "Link 1", scroll: false, onTapLinkAction: {}),
                .link(size: .medium, text: "Link 2", scroll: false, onTapLinkAction: {})
            ]),
            
            SirioTableColumnData(cells: [
                .avatar(size: .medium, title: "Avatar 0", subtitle: "Subtitle", iconData: .init(icon: .addressBook)),
                
                    .avatar(size: .medium, title: "Avatar 1", subtitle: "Subtitle", iconData: .init(icon: .addressBook)),
                
                    .avatar(size: .medium, title: "Avatar 2", subtitle: "Subtitle", iconData: .init(icon: .addressBook)),
            ]),
            
            SirioTableColumnData(cells: [
                .tag(size: .medium, tagType: .gray, text: "Tag 0", scroll: false),
                .tag(size: .medium, tagType: .gray, text: "Tag 1", scroll: false),
                .tag(size: .medium, tagType: .gray, text: "Tag 2", scroll: false)
            ]),
            
        ]
    )
}


#Preview {
    SirioTable(
        title: "Title",
        headers: SirioTableRowData(cells: [
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 0", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 1", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
            .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 2", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
            
        ]),
        columns: [
            SirioTableColumnData(cells: [
                .textOnly(size: .medium, text: "Text 0", scroll: false),
                .textOnly(size: .medium, text: "Text 1", scroll: false),
                .textOnly(size: .medium, text: "Text 2", scroll: false)
            ]),
            
            SirioTableColumnData(cells: [
                .link(size: .medium, text: "Link 0", scroll: false, onTapLinkAction: {}),
                .link(size: .medium, text: "Link 1", scroll: false, onTapLinkAction: {}),
                .link(size: .medium, text: "Link 2", scroll: false, onTapLinkAction: {})
            ]),
            
            SirioTableColumnData(cells: [
                .multiIcons(size: .medium, scroll: false, iconsData: [.init(icon: .filePdf), .init(icon: .download)]),
                .multiIcons(size: .medium, scroll: false, iconsData: [.init(icon: .filePdf), .init(icon: .download)]),
                .multiIcons(size: .medium, scroll: false, iconsData: [.init(icon: .filePdf), .init(icon: .download)])
            ]),
        ]
    )
}


#Preview {
    SirioTable(
                                title: "Richieste",
                                headers: SirioTableRowData(cells: [
                                    .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Stato", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                                    .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Oggetto", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                                    .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "creazione", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                                    .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "azioni", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
                                ]),
                                columns:  []
                            )
}
