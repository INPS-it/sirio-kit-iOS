//
// PaginationTile.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Internal representation of a single tile
/// - Parameters:
///   - number: The number of pages in pagination component
///   - isSelected: A boolean for selection
///   - isDisabled: Whether the tile is disabled
///   - action: Callback that is executed when the tile is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

struct PaginationTile: View {
    var number: Int
    var isSelected: Bool
    var isDisabled: Bool = false
    var action: (() -> Void)?
    var accessibilityLabel: String?
    
    var body: some View {
        Button(action: {
            if !isDisabled {
                action?()
            }
        }, label: {
            // Inside style
        })
        .disabled(isDisabled)
        .buttonStyle(PaginationTileStyle(number: number,
                                           isSelected: isSelected,
                                           isDisabled: isDisabled && isSelected)) // If is disabled and not selected it is blocked
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct PaginationTile_Previews: PreviewProvider {
    static var previews: some View {
        PaginationTile(number: 1, isSelected: true, isDisabled: false, action: nil)
    }
}
