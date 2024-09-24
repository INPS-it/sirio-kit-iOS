//
// SirioTableVerticalCellData.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation

public struct SirioTableVerticalCellData: Identifiable {
    public var id = UUID()
    var title: String
    var subtitle: String
    var type: SirioTableCellExpandedType
    
    public init(id: UUID = UUID(), title: String, subtitle: String, type: SirioTableCellExpandedType) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}

public enum SirioTableCellExpandedType {
    case text, number, date, link, tag
}
