//
// SirioMenuSpallaData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation

public struct SirioMenuSpallaData {
    public var titleDrawer: String
    public var subtitle: String?
    public var titleSection: String?
    public var items: [SirioMenuSpallaItemData]
    public var onTapDrawer: ((Bool) -> Void)?
    
    public init(titleDrawer: String, subtitle: String? = nil, titleSection: String? = nil, items: [SirioMenuSpallaItemData], onTapDrawer: ((Bool) -> Void)? = nil) {
        self.titleDrawer = titleDrawer
        self.subtitle = subtitle
        self.titleSection = titleSection
        self.items = items
        self.onTapDrawer = onTapDrawer
    }
}
