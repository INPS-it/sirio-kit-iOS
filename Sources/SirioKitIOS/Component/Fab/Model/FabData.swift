//
// FabData.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

/// A representation of a Fab item
/// - Parameters:
///   - text: The text of the item
///   - icon: The  icon of the item
///   - action: Callback that is executed when the fab is tapped
public struct FabData {
    var text: String?
    var icon: AwesomeIcon
    var action: (() -> Void)?
    
    public init(text: String? = nil, icon: AwesomeIcon, action: (() -> Void)?){
        self.text = text
        self.icon = icon
        self.action = action
    }
}
