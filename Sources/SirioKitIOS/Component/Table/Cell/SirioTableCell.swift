//
// SirioTableCell.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - SirioTableCell
/// A table cell view used inside `SirioTable`.
///
/// Supports multiple content types (text, number, tag, link, action).
/// Each type applies its own style and layout rules.
///
/// - Parameters:
///   - content: Defines the cell's content type:
///       - `.text`: text with an optional checkbox.
///       - `.textOnly`: plain text.
///       - `.numberOnly`: numeric text, usually right-aligned.
///       - `.tag`: highlighted tag label.
///       - `.link`: tappable text link with optional action.
///       - `.action`: a set of actions (e.g. buttons).
///   - size: The table size variant (`small`, `medium`, `large`).
///   - parity: The row parity (`even` or `odd`), used to alternate background colors.
///   - width: Cell width, dynamically calculated at runtime
///            based on content and table layout.
///   - height: Cell height, dynamically calculated at runtime
///             based on the tallest element in the row.
///

public struct SirioTableCell: View {
    
    // MARK: - Content
    public enum Content {
        /// Text + Checkbox
        case text(text: String,
                  isChecked: Binding<Bool>,
                  onTapCheckBoxAction: (() -> Void)? = nil)
        
        /// Text only
        case textOnly(text: String)
        
        /// Number only
        case numberOnly(text: String)
        
        /// Tag
        case tag(text: String, type: SirioTagType? = nil)
        
        /// Link
        case link(text: String,
                  onTap: (() -> Void)? = nil)
        
        /// Action
        case action(items: [SirioActionItem])
    }
    
    public let id = UUID()
    public let content: Content
    public var size: SirioTableSize
    public var parity: SirioTableCellParity
    public var width: CGFloat
    public var height: CGFloat
    
    // MARK: - Init
    public init(content: Content,
                size: SirioTableSize,
                parity: SirioTableCellParity,
                width: CGFloat,
                height: CGFloat) {
        self.content = content
        self.size = size
        self.parity = parity
        self.width = width
        self.height = height
    }
    
    // MARK: - Body
    public var body: some View {
        cellView(content)
    }
    
    // MARK: - Builder
    @ViewBuilder
    private func cellView(_ content: Content) -> some View {
        switch content {
        case let .text(text, isChecked, onTapCheckBoxAction):
            SirioTableCellText(
                size: size,
                text: text,
                isChecked: isChecked,
                parity: parity,
                onTapCheckBoxAction: onTapCheckBoxAction,
                width: width, height: height
            )
            
        case let .textOnly(text):
            SirioTableCellTextOnly(
                size: size,
                text: text,
                parity: parity,
                width: width, height: height
            )
            
        case let .numberOnly(text):
            SirioTableCellNumberOnly(
                size: size,
                text: text,
                parity: parity,
                width: width, height: height
            )
            
        case let .tag(text, type):
            SirioTableCellTag(
                size: size,
                text: text,
                type: type,
                parity: parity,
                width: width, height: height
            )
            
        case let .link(text, onTap):
            SirioTableCellLink(
                size: size,
                text: text,
                parity: parity,
                onTapLinkAction: {
                    onTap?()
                },
                width: width, height: height
            )
            
        case let .action(items):
            SirioTableCellAction(
                size: size, parity: parity, items: items,
                width: width, height: height
            )
        }
    }
}

