//
// TabItemData.swift
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

public struct TabItemData {
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
    
    static let preview = TabItemData(icon: .bell, name: "Notifications", hasBadge: true)
    
    static func previewInps1() -> [Self] {
        return [ TabItemData(icon: .home, name: "Home", hasBadge: false),
                 TabItemData(icon: .facebook, name: "Facebook", hasBadge: false),
                 TabItemData(icon: .twitter, name: "Twitter", hasBadge: false),
                 TabItemData(icon: .youtube, name: "Youtube", hasBadge: false),
                 TabItemData(icon: .infoCircle, name: "Info", hasBadge: false)
        ]
    }
    
    static func previewInps2() -> [Self] {
        return [TabItemData(icon: .home, name: "Home", hasBadge: false),
        TabItemData(icon: .bell, name: "News", hasBadge: true),
        TabItemData(icon: .globeEurope, name: "Map", hasBadge: false),
        TabItemData(icon: .headphones, name: "Contacts", hasBadge: false),
        TabItemData(icon: .piggyBank, name: "Services", hasBadge: false)]
    }
    
    public static func previewInps3() -> [Self] {
        return [TabItemData(icon: .home, name: "Home", hasBadge: false),
        TabItemData(icon: .newspaper, name: "News", hasBadge: false),
        TabItemData(icon: .piggyBank, name: "Services", hasBadge: false),
        TabItemData(icon: .headphones, name: "Contacts", hasBadge: false),
        TabItemData(icon: .user, name: "Profile", hasBadge: false)]
    }
}

