//
// SirioTitleBarItemData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation

public struct SirioTitleBarItemData: Identifiable {
    public var id = UUID()
    public var data: SirioIconData
    public var action: () -> Void
    
    public init(data: SirioIconData, action: @escaping () -> Void) {
        self.data = data
        self.action = action
    }
}
