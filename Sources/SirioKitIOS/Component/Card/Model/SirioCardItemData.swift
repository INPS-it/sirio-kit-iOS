//
// SirioCardItemData.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit
import SwiftUI

/// The model used for representing a navigation item with flexible button configurations.
/// - Parameters:
///   - firstButtonText: The text of the first button.
///   - onTapFirstButtonAction: Callback that is executed when the first button is tapped.
///   - secondButtonText: The optional text of the second button (for two-button configurations).
///   - onTapSecondButtonAction: Callback that is executed when the second button is tapped (for two-button configurations).
///   - menuItems: Optional array of dropdown menu items that will appear as a trailing action instead of a second button.

public struct SirioProcessCardItemData: Identifiable {
    public var id = UUID()

    public var firstButtonText: String
    public var onTapFirstButtonAction: () -> Void

    public var secondButtonText: String?
    public var onTapSecondButtonAction: (() -> Void)?

    public var menuItems: [SirioDropdownMenuItem]?

    // Caso 1: solo primo bottone
    public init(
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void
    ) {
        self.firstButtonText = firstButtonText
        self.onTapFirstButtonAction = onTapFirstButtonAction
    }

    // Caso 2: due bottoni (orizzontali o verticali)
    public init(
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void,
        secondButtonText: String,
        onTapSecondButtonAction: @escaping () -> Void
    ) {
        self.firstButtonText = firstButtonText
        self.onTapFirstButtonAction = onTapFirstButtonAction
        self.secondButtonText = secondButtonText
        self.onTapSecondButtonAction = onTapSecondButtonAction
    }

    // Caso 3: primo bottone e menu a destra
    public init(
        firstButtonText: String,
        onTapFirstButtonAction: @escaping () -> Void,
        menuItems: [SirioDropdownMenuItem]
    ) {
        self.firstButtonText = firstButtonText
        self.onTapFirstButtonAction = onTapFirstButtonAction
        self.menuItems = menuItems
    }
}


public protocol SirioProcessCardItemDataProtocol {
    var iconData: SirioIconData? { get }
    var color: Color? { get }
    var firstButtonText: String? { get }
    var onTapFirstButtonAction: (() -> Void)? { get }
}

public struct SirioProcessCardItemDataStandard: SirioProcessCardItemDataProtocol, Identifiable {
    public var id = UUID()
    public var iconData: SirioIconData? = nil
    public var color: Color? = nil
    public var firstButtonText: String?
    public var onTapFirstButtonAction: (() -> Void)?
    public var isFullWidth: Bool = false
}

public struct SirioProcessCardItemDataCTAInline: SirioProcessCardItemDataProtocol, Identifiable {
    public var id = UUID()
    public var iconData: SirioIconData? = nil
    public var color: Color? = nil
    public var firstButtonText: String?
    public var onTapFirstButtonAction: (() -> Void)?
    public var secondButtonText: String
    public var onTapSecondButtonAction: () -> Void
}

public struct SirioProcessCardItemDataCTABlock: SirioProcessCardItemDataProtocol, Identifiable {
    public var id = UUID()
    public var iconData: SirioIconData? = nil
    public var color: Color? = nil
    public var firstButtonText: String?
    public var onTapFirstButtonAction: (() -> Void)?
    public var secondButtonText: String
    public var onTapSecondButtonAction: () -> Void
}

public struct SirioProcessCardItemDataMoreAction: SirioProcessCardItemDataProtocol, Identifiable {
    public var id = UUID()
    public var iconData: SirioIconData? = nil
    public var color: Color? = nil
    public var firstButtonText: String?
    public var onTapFirstButtonAction: (() -> Void)?
    public var menuItems: [SirioActionItem]
}
