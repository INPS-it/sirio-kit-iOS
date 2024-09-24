//
// SirioTabItemData.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

/// A representation of a tab bar item
/// - Parameters:
///   - icon: The icon of the tab
///   - name: The text of the tab
///   - hasBadge: A boolean to manage badge visibility
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioTabItemData {
    public let icon: AwesomeIcon
    public let name: String
    public let hasBadge: Bool
    public let accessibilityLabel: String?
    
    public init(icon: AwesomeIcon, name: String, hasBadge: Bool = false, accessibilityLabel: String? = nil){
        self.icon = icon
        self.name = name
        self.hasBadge = hasBadge
        self.accessibilityLabel = accessibilityLabel
    }
    
    static let preview = SirioTabItemData(icon: .bell, name: "Notifications", hasBadge: true)
    
    static func previewInps1() -> [Self] {
        return [ SirioTabItemData(icon: .home, name: "Home", hasBadge: false),
                 SirioTabItemData(icon: .facebook, name: "Facebook", hasBadge: false),
                 SirioTabItemData(icon: .twitter, name: "Twitter", hasBadge: false),
                 SirioTabItemData(icon: .youtube, name: "Youtube", hasBadge: false),
                 SirioTabItemData(icon: .infoCircle, name: "Info", hasBadge: false)
        ]
    }
    
    static func previewInps2() -> [Self] {
        return [SirioTabItemData(icon: .home, name: "Home", hasBadge: false),
        SirioTabItemData(icon: .bell, name: "News", hasBadge: true),
        SirioTabItemData(icon: .globeEurope, name: "Map", hasBadge: false),
        SirioTabItemData(icon: .headphones, name: "Contacts", hasBadge: false),
        SirioTabItemData(icon: .piggyBank, name: "Services", hasBadge: false)]
    }
    
    public static func previewInps3() -> [Self] {
        return [SirioTabItemData(icon: .home, name: "Home", hasBadge: false),
        SirioTabItemData(icon: .newspaper, name: "News", hasBadge: false),
        SirioTabItemData(icon: .piggyBank, name: "Services", hasBadge: false),
        SirioTabItemData(icon: .headphones, name: "Contacts", hasBadge: false),
        SirioTabItemData(icon: .user, name: "Profile", hasBadge: false)]
    }
}

