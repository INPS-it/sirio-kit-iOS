//
// SirioListItemType.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - Enum
/// Tipi di List Item disponibili
public enum SirioListItemType {
    case `default`
    case icon
    case info
    
    /// Colore associato all’icona, in base al tipo
    var iconColor: Color {
        switch self {
        case .default:
            return .clear
        case .icon:
            return .aliasTextColorSecondaryDark100
        case .info:
            return .globalSemanticInfo100
        }
    }
}
