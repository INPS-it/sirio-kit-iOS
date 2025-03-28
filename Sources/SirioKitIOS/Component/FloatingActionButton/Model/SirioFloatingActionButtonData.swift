//
// SirioFloatingActionButtonData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

/// A representation of a SirioFloatingActionButton item.
///
/// - Parameters:
///   - text: The text displayed alongside the icon, if provided. This parameter is optional and is only used in the second initializer.
///   - icon: The icon representing the button, specified using the `AwesomeIcon` type.
///   - size: The size of the button, which can only be `.medium` or `.small`. If an unsupported size is provided, it will be set to `nil`.
///   - action: The callback function that is executed when the floating action button is tapped. This parameter is optional.
///   - accessibilityLabel: An optional string that serves as the accessibility identifier for the button, enhancing accessibility support.

public struct SirioFloatingActionButtonData {
    var text: String?
    var icon: AwesomeIcon
    var size: SirioFloatingActionButtonSize?
    var action: (() -> Void)?
    var accessibilityLabel: String?
    
    public init(icon: AwesomeIcon, size: SirioFloatingActionButtonSize, action: (() -> Void)?, accessibilityLabel: String? = nil){
        self.icon = icon
        self.size = size
        self.action = action
        self.accessibilityLabel = accessibilityLabel
    }
    
    public init(text: String, icon: AwesomeIcon, action: (() -> Void)?, accessibilityLabel: String? = nil){
        self.text = text
        self.icon = icon
        self.action = action
        self.accessibilityLabel = accessibilityLabel
    }
}
