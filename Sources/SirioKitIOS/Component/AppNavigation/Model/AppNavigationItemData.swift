//
// AppNavigationItemData.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

/// The model used for representation of an app navigation item
/// - Parameters:
///   - icon: The icon of the item
///   - textProfile: A short text of the profile. Generally they are the initials of the first name and last name
///   - action: Callback that is executed when the item is tapped
///   - hasBadge: A boolean to manage the badge
public struct AppNavigationItemData {    
    var icon: AwesomeIcon
    var textProfile: String
    var action: () -> Void
    var hasBadge: Bool
    
    var isUserLogged: Bool {
        return !textProfile.isEmpty
    }
    
    public init(icon: AwesomeIcon, textProfile: String = "", hasBadge: Bool = false, action: @escaping () -> Void){
        self.icon = icon
        self.textProfile = textProfile
        self.hasBadge = hasBadge
        self.action = action
    }
    
    public static let preview = AppNavigationItemData(icon: .ellipsisV, action: {})
    public static let previewBack = AppNavigationItemData(icon: AwesomeIcon.angleLeft, action: {})
    public static let previewUser = AppNavigationItemData(icon: AwesomeIcon.user, action: {})
    public static let previewUserLogged = AppNavigationItemData(icon: AwesomeIcon.user, textProfile: "MC", action: {})
    public static let previewSearch = AppNavigationItemData(icon: AwesomeIcon.search, action: {})
    public static let previewBell = AppNavigationItemData(icon: AwesomeIcon.bell, hasBadge: true, action: {})
    public static let previewTrash = AppNavigationItemData(icon: AwesomeIcon.trash, hasBadge: true, action: {})
    public static let previewDownload = AppNavigationItemData(icon: AwesomeIcon.download, hasBadge: true, action: {})

}

extension AppNavigationItemData: Equatable {
    public static func == (lhs: AppNavigationItemData, rhs: AppNavigationItemData) -> Bool {
        return lhs.icon == rhs.icon
    }
}
