//
// SirioTableColumnData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableColumnData {
    var cells: [SirioTableCellType]
    
    public init(cells: [SirioTableCellType]) {
        self.cells = cells
    }
}
