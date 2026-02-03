//
// SirioTableCard.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCard: View {
    
    // MARK: - Row
    public struct Row: Identifiable {
        public enum Content {
            case text(header: String, text: String)
            case number(header: String, text: String)
            case tag(header: String, text: String, type: SirioTagType? = nil)
            case link(header: String, text: String, onTap: (() -> Void)? = nil)
            case multiIcons(icons: [SirioIconData])
        }
        public let id = UUID()
        public let content: Content
        
        public init(content: Content) {
            self.content = content
        }
        
        // Equatable su Row per animazioni/refresh più stabili
        public static func == (lhs: Row, rhs: Row) -> Bool {
            lhs.id == rhs.id
        }
    }
    
    // MARK: - API
    public let rows: [Row]
    public var parity: SirioTableCellParity
    
    // MARK: - Init
    public init(
        rows: [Row],
        parity: SirioTableCellParity
    ) {
        self.rows = rows
        self.parity = parity
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.zero) {
            VStack(spacing: Size.zero) {
                ForEach(Array(rows.enumerated()), id: \.element.id) { index, row in
                    rowView(row, showSeparator: index < rows.count - 1)
                        .padding(.horizontal, Size.p12)

                }
            }
            .padding(.vertical, Size.p4)
            .background(backgroundColor)
            .overlay(
                Rectangle()
                    .stroke(borderColor, lineWidth: 1)
            )
        }
    }
    
    private var backgroundColor: Color {
        switch parity {
        case .even:
            return Color.aliasTextColorPrimaryLight40
        case .odd:
            return Color.aliasTextColorPrimaryLight0
        }
    }
    
    private var borderColor: Color {
        return Color.globalLightPrimary60
    }
    
    // MARK: - Row builder
    @ViewBuilder
    private func rowView(_ row: Row, showSeparator: Bool) -> some View {
        switch row.content {
        case let .text(header, text):
            SirioTableCardText(header: header, text: text, parity: parity, showSeparator: showSeparator)
            
        case let .number(header, text):
            SirioTableCardNumber(header: header, text: text, parity: parity, showSeparator: showSeparator)
            
        case let .tag(header, text, type):
            SirioTableCardTag(header: header, text: text, type: type, parity: parity, showSeparator: showSeparator)
            
        case let .link(header, text, onTap):
            SirioTableCardLink(
                header: header,
                text: text,
                parity: parity,
                onTapLinkAction: {
                    onTap?()
                }, showSeparator: showSeparator)
        case let .multiIcons(icons):
            SirioTableCardMultiIcons(icons: icons, parity: parity, showSeparator: showSeparator)
        }
    }
}

// MARK: - Preview di esempio (rimuovi o adatta in produzione)
#Preview {
    ScrollView {
        VStack(spacing: 16) {
            SirioTableCard(
                rows: [
                    .init(content: .text(header: "Header", text: "Label")),
                    .init(content: .number(header: "Header", text: "02")),
                    .init(content: .tag(header: "Header", text: "Label Tag")),
                    .init(content: .link(header: "Header", text: "Link", onTap: {
                    })),
                    .init(content: .multiIcons(
                        icons: [
                            .init(icon: .filePdf, action: {}),
                            .init(icon: .download, action: {}),
                            .init(icon: .trash, action: {})
                        ]
                    ))
                ], parity: .even
            )
            
            SirioTableCard(
                rows: [
                    .init(content: .text(header: "Header", text: "email@example.com")),
                    .init(content: .tag(header: "Header", text: "ON"))
                ],
                parity: .odd
            )
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}


public struct SirioTableCards: View {
    
    public var title: String?
    public var actions: [SirioActionItem]?
    public var cards: [[SirioTableCard.Row]]
    public var alternateRowColors: Bool
    @State var isOpen: Bool = false
    
    // MARK: - Init
    public init(
        title: String,
        actions: [SirioActionItem]? = nil,
        cards: [[SirioTableCard.Row]],
        alternateRowColors: Bool = true
    ) {
        self.title = title
        self.actions = actions
        self.cards = cards
        self.alternateRowColors = alternateRowColors
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: Size.zero) {
            if let title = title, !title.isEmpty {
                HStack {
                    SirioText(text: title, typography: .headlineSmHeavy)
                        .foregroundStyle(Color.aliasTextColorPrimaryDark110)
                        .padding(.horizontal, Size.p16)
                        .padding(.top, Size.p24)
                        .padding(.bottom, Size.p8)
                    Spacer()
                }
            }
            
            if let actions, !actions.isEmpty {
                if actions.count <= 2 {
                    HStack {
                        Spacer()
                        ForEach(actions) { action in
                            SirioButton(hierarchy: .ghostLight,
                                        size: .small,
                                        text: action.value,
                                        iconData: action.iconData ?? nil,
                                        action: {})
                        }
                    }
                    .frame(height: 40)
                    .padding(.horizontal, Size.p16)
                    .padding(.bottom, Size.p12)
                } else {
                    HStack {
                        Spacer()
                        SirioMoreAction(size: .small,
                                        items: actions,
                                        positionToOpen: .bottomLeft,
                                        isOpen: $isOpen)
                    }
                    .frame(height: 40)
                    .padding(.horizontal, Size.p16)
                    .padding(.bottom, Size.p12)
                }
            }
            ScrollView {
                ForEach(Array(cards.enumerated()), id: \.offset) { index, rows in
                    SirioTableCard(
                        rows: rows,
                        parity: alternateRowColors ? index.isMultiple(of: 2) ? .odd : .even : .odd
                    )
                }
            }
        }
    }
}

#Preview {
    SirioTableCards(title: "Titolo tabella",
               actions: [
                .init(value: "Label",iconData: .previewCube, action: {}),
                .init(value: "Label",iconData: .previewCube, action: {})
    ], cards: [
        [
            .init(content: .text(header: "Header 1", text: "Label molto molto lunga")),
            .init(content: .number(header: "Header lungo su due righe", text: "02")),
            .init(content: .tag(header: "Header", text: "Attivo")),
            .init(content: .link(header: "Header", text: "Link", onTap: {
            })),
            .init(content: .multiIcons(
                icons: [
                    .init(icon: .filePdf, action: {}),
                    .init(icon: .download, action: {}),
                    .init(icon: .trash, action: {})
                ]
            ))
        ],
        [
            .init(content: .text(header: "Header", text: "Label")),
            .init(content: .number(header: "Header lungo su due righe", text: "02")),
            .init(content: .tag(header: "Header", text: "Attivo")),
            .init(content: .link(header: "Header", text: "Link", onTap: {
            })),
            .init(content: .multiIcons(
                icons: [
                    .init(icon: .filePdf, action: {}),
                    .init(icon: .download, action: {}),
                    .init(icon: .trash, action: {})
                ]
            ))
        ]
    ],
    alternateRowColors: true)
    .padding()
    
}
