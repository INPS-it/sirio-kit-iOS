//
// SirioCardItemData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

/// The model used for representation of an app navigation item
/// - Parameters:
///   - icon: The icon of the item
///   - action: Callback that is executed when the item is tapped
public struct SirioCardItemData: Identifiable {
    public var id = UUID()
    var icon: AwesomeIcon
    var action: () -> Void
    
    public init(icon: AwesomeIcon, action: @escaping () -> Void){
        self.icon = icon
        self.action = action
    }
    
    public static let previewEllipsis = SirioCardItemData(icon: .ellipsisH, action: {})
    public static let previewHeart = SirioCardItemData(icon: .heart, action: {})

}

extension SirioCardItemData: Equatable {
    public static func == (lhs: SirioCardItemData, rhs: SirioCardItemData) -> Bool {
        return lhs.icon == rhs.icon
    }
}
