//
// SirioTableDrawerItemData.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation

public struct SirioTableDrawerItemData: Identifiable {
    public var id = UUID()
    var title: String
    var subtitle: String
    var type: SirioTableDrawerType
    var onTap: (() -> Void)?
    
    public init(id: UUID = UUID(), title: String, subtitle: String, type: SirioTableDrawerType, onTap: (() -> Void)? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.onTap = onTap
    }
}

public enum SirioTableDrawerType {
    case text, number, date, link
}
