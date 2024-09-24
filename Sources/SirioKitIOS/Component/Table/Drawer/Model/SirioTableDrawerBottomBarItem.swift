//
// SirioTableDrawerBottomBarItem.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation

public struct SirioTableDrawerBottomBarItem: Identifiable {
    public var id = UUID()
    public var icon: AwesomeIcon
    public var text: String?
    public var action: (() -> Void)?
}
