//
// SirioMenuSpallaItemData.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit

public class SirioMenuSpallaItemData: Identifiable, ObservableObject {
    public let id = UUID()
    public var value: String
    public var tagText: String?
    @Published public var isDisabled: Bool
    public var onTapAction: () -> Void
    public var children: [SirioMenuSpallaItemData]
    public weak var parent: SirioMenuSpallaItemData? = nil
    public var accessibilityLabel: String? = nil
    
    // Livello del nodo, calcolato al momento della richiesta
    public var level: SirioMenuSpallaItemLevel {
        return calculateLevel()
    }
    
    public init(value: String,
                children: [SirioMenuSpallaItemData] = [],
                tagText: String? = nil,
                isDisabled: Bool = false,
                onTapAction: @escaping () -> Void = {},
                accessibilityLabel: String? = nil) {
        self.value = value
        self.children = children
        self.tagText = tagText
        self.isDisabled = isDisabled
        self.onTapAction = onTapAction
        self.accessibilityLabel = accessibilityLabel
        
        // Imposta i genitori dei figli
        self.children.forEach { child in
            child.parent = self
        }
    }
    
    var hasSubItems: Bool {
        return !children.isEmpty
    }
    
    func hasChild(childId: UUID) -> Bool {
        return id == childId || children.contains { $0.hasChild(childId: childId) }
    }
    
    // Funzione per calcolare il livello del nodo
    private func calculateLevel() -> SirioMenuSpallaItemLevel {
        var level = 0
        var currentNode = self
        while let parent = currentNode.parent {
            level += 1
            currentNode = parent
        }
        return SirioMenuSpallaItemLevel(rawValue: level) ?? .unknown
    }
    
    @discardableResult
    func hasInvalidDepth(currentDepth: Int = 0, maxDepth: Int = 2) -> Bool {
        if currentDepth > maxDepth {
            return true
        }
        
        return children.contains { $0.hasInvalidDepth(currentDepth: currentDepth + 1, maxDepth: maxDepth) }
    }
}

extension SirioMenuSpallaItemData: Equatable {
    public static func == (lhs: SirioMenuSpallaItemData, rhs: SirioMenuSpallaItemData) -> Bool {
        return lhs.value == rhs.value && lhs.children == rhs.children
    }
}
