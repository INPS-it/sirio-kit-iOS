//
// SirioActionItem.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

public struct SirioActionItem: Identifiable {
    public var id = UUID()
    let value: String
    let iconData: SirioIconData?
    let action: (() -> Void)?
    
    public init(value: String, action: (() -> Void)?) {
        self.value = value
        self.iconData = nil
        self.action = action
    }
    
    public init(value: String, iconData: SirioIconData?, action: (() -> Void)?) {
        self.value = value
        self.iconData = iconData
        self.action = action
    }
}
