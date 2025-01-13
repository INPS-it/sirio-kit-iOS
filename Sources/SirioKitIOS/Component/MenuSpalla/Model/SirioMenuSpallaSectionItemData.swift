//
// SirioMenuSpallaSectionItemData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation


public struct SirioMenuSpallaSectionItemData: Identifiable {
    public var id = UUID()
    public var titleSection: String?
    public var items: [SirioMenuSpallaItemData]
    
    public init(titleSection: String? = nil, items: [SirioMenuSpallaItemData]) {
        self.titleSection = titleSection
        self.items = items
    }
}
