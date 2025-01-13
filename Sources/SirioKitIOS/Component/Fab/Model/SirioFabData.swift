//
// SirioFabData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

/// A representation of a Fab item
/// - Parameters:
///   - text: The text of the item
///   - icon: The  icon of the item
///   - action: Callback that is executed when the fab is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioFabData {
    var text: String?
    var icon: AwesomeIcon
    var action: (() -> Void)?
    var accessibilityLabel: String?
    
    public init(text: String? = nil, icon: AwesomeIcon, action: (() -> Void)?, accessibilityLabel: String? = nil){
        self.text = text
        self.icon = icon
        self.action = action
        self.accessibilityLabel = accessibilityLabel
    }
}
