//
// SirioTableColumnData.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableRowData: Identifiable {
    public var id = UUID()
    public var cells: [SirioTableCell.Content]

    public init(cells: [SirioTableCell.Content]) {
        self.cells = cells
    }

    public static func textOnly(_ texts: [String]) -> SirioTableRowData {
        .init(cells: texts.map { .textOnly(text: $0) })
    }

    public static func numberOnly(_ numbers: [String]) -> SirioTableRowData {
        .init(cells: numbers.map { .numberOnly(text: $0) })
    }

    public static func tag(_ tags: [String]) -> SirioTableRowData {
        .init(cells: tags.map { .tag(text: $0, type: .gray) })
    }

    public static func tag(
        _ tags: [(text: String, type: SirioTagType?)],
        defaultType: SirioTagType = .gray
    ) -> SirioTableRowData {
        .init(cells: tags.map { .tag(text: $0.text, type: $0.type ?? defaultType) })
    }
    
    public static func link(_ links: [(text: String, onTap: (() -> Void)?)]) -> SirioTableRowData {
        .init(cells: links.map { .link(text: $0.text, onTap: $0.onTap) })
    }

    public static func text(_ texts: [(text: String, isChecked: Binding<Bool>, onTapCheckBoxAction: (() -> Void)?)]) -> SirioTableRowData {
        .init(cells: texts.map { .text(text: $0.text, isChecked: $0.isChecked, onTapCheckBoxAction: $0.onTapCheckBoxAction) })
    }
}

