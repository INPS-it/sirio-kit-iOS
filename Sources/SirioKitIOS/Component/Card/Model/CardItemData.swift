//
// CardItemData.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

/// The model used for representation of an app navigation item
/// - Parameters:
///   - icon: The icon of the item
///   - action: Callback that is executed when the item is tapped
public struct CardItemData: Identifiable {
    public var id = UUID()
    var icon: AwesomeIcon
    var action: () -> Void
    
    public init(icon: AwesomeIcon, action: @escaping () -> Void){
        self.icon = icon
        self.action = action
    }
    
    public static let previewEllipsis = CardItemData(icon: .ellipsisH, action: {})
    public static let previewHeart = CardItemData(icon: .heart, action: {})

}

extension CardItemData: Equatable {
    public static func == (lhs: CardItemData, rhs: CardItemData) -> Bool {
        return lhs.icon == rhs.icon
    }
}
