//
// SirioAppNavigationItemData.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit
/// The model used for representation of an app navigation item
/// - Parameters:
///   - icon: The icon of the item
///   - textProfile: A short text of the profile. Generally they are the initials of the first name and last name
///   - action: Callback that is executed when the item is tapped
///   - hasBadge: A boolean to manage the badge
public struct SirioAppNavigationItemData: Identifiable {
    public var id = UUID()
    var icon: AwesomeIcon
    var textProfile: String
    var action: () -> Void
    var hasBadge: Bool
    var accessibilityLabel: String?

    var isUserLogged: Bool {
        return !textProfile.isEmpty
    }
    
    public init(icon: AwesomeIcon, textProfile: String = "", hasBadge: Bool = false, action: @escaping () -> Void, accessibilityLabel: String? = nil){
        self.icon = icon
        self.textProfile = textProfile
        self.hasBadge = hasBadge
        self.action = action
        self.accessibilityLabel = accessibilityLabel
    }
    
    public static let preview = SirioAppNavigationItemData(icon: .ellipsisV, action: {})
    public static let previewBack = SirioAppNavigationItemData(icon: AwesomeIcon.angleLeft, action: {})
    public static let previewUser = SirioAppNavigationItemData(icon: AwesomeIcon.user, action: {})
    public static let previewUserLogged = SirioAppNavigationItemData(icon: AwesomeIcon.user, textProfile: "MC", action: {})
    public static let previewSearch = SirioAppNavigationItemData(icon: AwesomeIcon.search, action: {})
    public static let previewBell = SirioAppNavigationItemData(icon: AwesomeIcon.bell, hasBadge: true, action: {})
    public static let previewTrash = SirioAppNavigationItemData(icon: AwesomeIcon.trash, hasBadge: true, action: {})
    public static let previewDownload = SirioAppNavigationItemData(icon: AwesomeIcon.download, hasBadge: true, action: {})

}

extension SirioAppNavigationItemData: Equatable {
    public static func == (lhs: SirioAppNavigationItemData, rhs: SirioAppNavigationItemData) -> Bool {
        return lhs.icon == rhs.icon
    }
}
