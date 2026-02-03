//
// SirioTableHeaderData.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioTableOrder: CaseIterable {
    case ascending
    case descending
    case none
    
    // Ciclo: none -> ascending -> descending -> none
    public func next() -> SirioTableOrder {
        switch self {
        case .none: return .ascending
        case .ascending: return .descending
        case .descending: return .none
        }
    }
}

public struct SirioTableSort: Equatable {
    public var columnIndex: Int
    public var order: SirioTableOrder
    
    public init(columnIndex: Int = 0, order: SirioTableOrder = .none) {
        self.columnIndex = columnIndex
        self.order = order
    }
}

    
public extension SirioTableSort {
    static func ascending(_ column: Int) -> Self {
        .init(columnIndex: column, order: .ascending)
    }

    static func descending(_ column: Int) -> Self {
        .init(columnIndex: column, order: .descending)
    }
}

public class SirioTableHeaderData: Identifiable, ObservableObject {
    public var id = UUID()
    public var title: String
    public var hasCheck: Bool
    public var isSortable: Bool
    //public var onTapOrder: ((SirioTableHeaderData) -> Void)?
    public var textAlignment: SirioAlignment
    @Published public var isChecked: Bool
    
    public init(
        title: String,
        hasCheck: Bool = false,
        isSortable: Bool = false,
        order: SirioTableOrder = .none,
        textAlignment: SirioAlignment = .leading,
        isChecked: Bool = false,
        //onTapOrder: ((SirioTableHeaderData) -> Void)? = nil
    ) {
        self.title = title
        self.hasCheck = hasCheck
        self.isSortable = isSortable
        self.textAlignment = textAlignment
        self.isChecked = isChecked
        //self.onTapOrder = onTapOrder
    }
}
