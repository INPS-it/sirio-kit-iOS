//
// SirioTabData.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
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

public class SirioTabData: ObservableObject {
    @Published var icon: AwesomeIcon?
    @Published var text: String
    @Published var isDisabled: Bool
    var accessibilityLabel: String?
    
    public init(icon: AwesomeIcon? = nil, text: String, isDisabled: Bool = false, accessibilityLabel: String? = nil){
        self.icon = icon
        self.text = text
        self.isDisabled = isDisabled
        self.accessibilityLabel = accessibilityLabel
    }
        
    static func previewInps() -> [SirioTabData] {
        return [SirioTabData.init(icon: .home, text: "Label tab"),
                 SirioTabData.init(icon: .facebook, text: "Label tab"),
                 SirioTabData.init(icon: .twitter, text: "Label tab", isDisabled: true),
                 SirioTabData.init(icon: .youtube, text: "Label tab"),
                 SirioTabData.init(icon: .infoCircle, text: "Label tab")
        ]
    }
}
