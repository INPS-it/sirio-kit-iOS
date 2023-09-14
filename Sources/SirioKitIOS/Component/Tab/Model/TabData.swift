//
// TabData.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation

/// A representation of a tab item
/// - Parameters:
///   - icon: The icon of the item
///   - text: The label of the item
///   - isDisabled: Whether the tab is disabled
///   - accessibilityLabel: A string that identifies the accessibility element

public class TabData: ObservableObject {
    @Published var icon: AwesomeIcon?
    @Published var text: String
    @Published var isDisabled: Bool
    var accessibilityLabel: String?
    
    public init(icon: AwesomeIcon?, text: String, isDisabled: Bool = false, accessibilityLabel: String? = nil){
        self.icon = icon
        self.text = text
        self.isDisabled = isDisabled
        self.accessibilityLabel = accessibilityLabel
    }
        
    static func previewInps() -> [TabData] {
        return [TabData.init(icon: .home, text: "Label tab"),
                 TabData.init(icon: .facebook, text: "Label tab"),
                 TabData.init(icon: .twitter, text: "Label tab", isDisabled: true),
                 TabData.init(icon: .youtube, text: "Label tab"),
                 TabData.init(icon: .infoCircle, text: "Label tab")
        ]
    }
}
