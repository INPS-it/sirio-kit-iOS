//
//  SirioDropdownMenuItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

/// A model representing an item in a dropdown menu, consisting of a value and an optional action.
///
/// Use this struct to define menu items that the user can select from a dropdown menu.
///
/// - Parameters:
///   - value: The string that will be displayed in the dropdown menu for this item.
///   - action: An optional closure that is executed when the menu item is selected.
///
/// Example usage:
/// ```swift
/// let item = SirioDropdownMenuItem(value: "Option 1", action: {
///     print("Option 1 selected")
/// })
/// ```
import UIKit

public struct SirioDropdownMenuItem: Identifiable {
    public var id = UUID()
    let value: String
    let action: (() -> Void)?
    
    public init(value: String, action: (() -> Void)?) {
        self.value = value
        self.action = action
    }
}
