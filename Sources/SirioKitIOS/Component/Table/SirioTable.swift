//
// SirioTable.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioTableSortKey: Comparable {
    case number(Double)
    case string(String)

    public static func < (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.number(let a), .number(let b)):
            return a < b

        case (.string(let a), .string(let b)):
            return a.localizedCompare(b) == .orderedAscending

        // Ordine deterministico cross-type
        case (.number, .string):
            return true
        case (.string, .number):
            return false
        }
    }
}

public extension Array {

    func stableSortedForSirioTable(
        sort: SirioTableSort,
        locale: Locale = .current,
        keyForColumn: (Element, Int, Locale) -> SirioTableSortKey?
    ) -> [Element] {

        guard sort.order != .none else { return self }

        let ascending = sort.order == .ascending

        return self
            .enumerated()
            .sorted { lhs, rhs in
                let (i1, a) = lhs
                let (i2, b) = rhs

                let ka = keyForColumn(a, sort.columnIndex, locale)
                let kb = keyForColumn(b, sort.columnIndex, locale)

                // nulls last
                if ka == nil && kb == nil { return i1 < i2 }
                if ka == nil { return false }
                if kb == nil { return true }

                let base = ka! < kb!

                if ka! == kb! {
                    return i1 < i2
                }

                return ascending ? base : !base
            }
            .map(\.element)
    }
}

public struct SirioTable: View {
    var schemeColor: SchemeColor
    var title: String?
    var actions: [SirioActionItem]?
    var size: SirioTableSize
    var headersData: [SirioTableHeaderData]
    @Binding var rows: [SirioTableRowData]
    @State private var originalRows: [SirioTableRowData] = []
    @State private var colWidths: [Int: CGFloat] = [:]
    private var allowHorizontalScroll: Bool
    @State private var contentTableHeight: CGFloat = 0
    @State private var canScrollLeft: Bool = false
    @State private var canScrollRight: Bool = false
    @State private var contentSize: CGSize = .zero
    @State private var containerSize: CGSize = .zero
    private var alternateRowColors: Bool
    @State private var isOpen: Bool = false
        
    @State var currentSort: SirioTableSort = SirioTableSort(columnIndex: 0, order: .none)
    var onSortRequest: ((SirioTableSort) -> Void)?
    
    public init(schemeColor: SchemeColor = .dark,
                title: String?,
                actions: [SirioActionItem]?,
                size: SirioTableSize,
                headersData: [SirioTableHeaderData],
                rows: Binding<[SirioTableRowData]>,
                allowHorizontalScroll: Bool = false,
                alternateRowColors: Bool = false,
                sort: SirioTableSort = .init(columnIndex: 0, order: .none),
                onSortRequest: ((SirioTableSort) -> Void)? = nil) {
        self.schemeColor = schemeColor
        self.title = title
        self.actions = actions
        self.size = size
        self.headersData = headersData
        self._rows = rows
        self.allowHorizontalScroll = allowHorizontalScroll
        self.alternateRowColors = alternateRowColors
        self._currentSort = State(initialValue: sort)
        self.onSortRequest = onSortRequest
        guard rows.wrappedValue.allSatisfy({ $0.cells.count == headersData.count }) else {
            fatalError("SirioTable init failed: every row must have exactly \(headersData.count) cells.")
        }
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            if let title = title, !title.isEmpty {
                HStack {
                    SirioText(text: title, typography: .headlineSmHeavy)
                        .foregroundStyle(Color.aliasTextColorPrimaryDark110)
                        .padding(.top, Size.p24)
                        .padding(.bottom, Size.p8)
                    Spacer()
                }
            }
            if let actions, !actions.isEmpty {
                if actions.count <= 2 {
                    
                    HStack {
                        ForEach(actions) { action in
                            SirioButton(hierarchy: .ghostLight,
                                        size: .small,
                                        text: action.value,
                                        iconData: action.iconData ?? nil,
                                        iconAlignment: .leading,
                                        action: {})
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .frame(height: Size.Table.actionFrame)
                } else {
                    
                    HStack {
                        SirioMoreAction(size: .small,
                                        items: actions,
                                        positionToOpen: .bottomLeft,
                                        isOpen: $isOpen)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .frame(height: Size.Table.actionFrame)
                }
            }
            GeometryReader { proxy in
                let screenWidth = proxy.size.width
                let widths = adjustedWidths(screenWidth: screenWidth)
                
                Group {
                    if allowHorizontalScroll {
                        if #available(iOS 18.0, *) {
                            horizontalTable18(widths: widths, screenWidth: screenWidth, height: proxy.size.height)
                        } else {
                            horizontalTable16(widths: widths, screenWidth: screenWidth)
                        }
                    } else {
                        ScrollView(.vertical) {
                            measuredContentTable(widths: widths, screenWidth: screenWidth)
                        }
                        .frame(maxHeight: tableHeight)
                    }
                }
                .onPreferenceChange(ContentHeightKey.self) { newHeight in
                    if abs(newHeight - contentTableHeight) > 0.5 {
                        contentTableHeight = newHeight
                    }
                }
                .background(alignment: .topLeading) {
                    columnsMeasurer(screenWidth: screenWidth)
                }
            }
            .frame(idealHeight: tableHeight, maxHeight: tableHeight)
        }
    }
    
    @available(iOS 18.0, *)
    @ViewBuilder
    func horizontalTable18(widths: [Int: CGFloat], screenWidth: CGFloat, height: CGFloat) -> some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal) {
                ScrollView(.vertical) {
                    measuredContentTable(widths: widths, screenWidth: screenWidth)
                }
                // Senza un'altezza fissa lo scroll verticale diventa alto quanto il contenuto e non scorre
                .frame(height: height)
            }
            .onScrollGeometryChange(for: ScrollGeometry.self) { geometry in
                ScrollGeometry(
                    contentOffset: geometry.contentOffset,
                    contentSize: geometry.contentSize,
                    containerSize: geometry.containerSize
                )
            } action: { _, newValue in
                updateScrollState(
                    contentOffset: newValue.contentOffset,
                    contentSize: newValue.contentSize,
                    containerSize: newValue.containerSize
                )
            }
            
            if canScrollLeft {
                Rectangle()
                    .fill(Color.aliasInteractiveAccentDefault)
                    .frame(width: Size.Table.scrollingTableWidth,
                           height: height)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if canScrollRight {
                Rectangle()
                    .fill(Color.aliasInteractiveAccentDefault)
                    .frame(width: Size.Table.scrollingTableWidth,
                           height: height)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    @ViewBuilder
    func horizontalTable16(widths: [Int: CGFloat], screenWidth: CGFloat) -> some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                ScrollView(.horizontal, showsIndicators: false) {
                    measuredContentTable(widths: widths, screenWidth: screenWidth)
                }
                .coordinateSpace(name: "scrollView")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    updateScrollState(
                        contentOffset: CGPoint(x: -value.x, y: -value.y),
                        contentSize: contentSize,
                        containerSize: containerSize
                    )
                }
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                containerSize = proxy.size
                            }
                            .onChange(of: proxy.size.height) { _ in
                                containerSize = proxy.size
                            }
                    }
                )
            }
            // Overlay sinistro
            if canScrollLeft {
                Rectangle()
                    .fill(Color.aliasInteractiveAccentDefault)
                    .frame(width: Size.Table.scrollingTableWidth, height: contentTableHeight)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Overlay destro
            if canScrollRight {
                Rectangle()
                    .fill(Color.aliasInteractiveAccentDefault)
                    .frame(width: Size.Table.scrollingTableWidth, height: contentTableHeight)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    // Contenuto della tabella che comunica la propria altezza a `contentTableHeight`
    func measuredContentTable(widths: [Int: CGFloat], screenWidth: CGFloat) -> some View {
        contentTable(widths: widths, screenWidth: screenWidth)
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: ContentHeightKey.self,
                            value: proxy.size.height
                        )
                }
            )
    }
    
    @ViewBuilder
    func contentTable(widths: [Int: CGFloat], screenWidth: CGFloat) -> some View {
        // Le righe sono lazy: vengono create solo quelle visibili.
        // Le larghezze delle colonne arrivano da `columnsMeasurer`, l'altezza è gestita da ogni riga.
        LazyVStack(alignment: .leading, spacing: Size.zero) {
            if !widths.isEmpty {
                // Header row
                SirioTableRow(columns: headersData.count, widths: widths) { col, width, height in
                    let order = currentSort.columnIndex == col ? currentSort.order : .none
                    SirioTableHeader(
                        schemeColor: schemeColor,
                        size: size,
                        data: headersData[col],
                        order: order,
                        onSortRequest: { order in
                            let sort = SirioTableSort(columnIndex: col, order: order)
                            currentSort = sort
                            print(sort)
                            onSortRequest?(sort)
                        },
                        width: width,
                        height: height,
                        withSeparator: col != headersData.indices.last
                    )
                }
                // Data rows
                ForEach(Array(rows.enumerated()), id: \.element.id) { rowIndex, rowData in
                    SirioTableRow(columns: rowData.cells.count, widths: widths) { colIndex, width, height in
                        SirioTableCell(
                            content: rowData.cells[colIndex],
                            size: size,
                            parity: alternateRowColors ? rowIndex % 2 == 0 ? .even : .odd : .odd,
                            width: width,
                            height: height
                        )
                        .overlay(
                            Group {
                                if colIndex == 0 {
                                    HStack(spacing: Size.zero) {
                                        Rectangle()
                                            .frame(width: Size.Table.borderWidth)
                                            .foregroundColor(borderColor)
                                        Spacer()
                                    }
                                }
                            },
                            alignment: .leading
                        )
                    }
                }
            }
        }
        // Se cambiano le larghezze le righe vanno rimisurate da zero
        .id(widths)
        .frame(minWidth: screenWidth, alignment: .topLeading)
    }
    
    /// Griglia nascosta con l'header e le righe più significative (tutte, se sono poche):
    /// calcola le larghezze delle colonne senza dover costruire tutte le righe.
    @ViewBuilder
    func columnsMeasurer(screenWidth: CGFloat) -> some View {
        let measuredRows = measuredRows
        Grid(alignment: .topLeading, horizontalSpacing: Size.zero, verticalSpacing: Size.zero) {
            GridRow {
                ForEach(headersData.indices, id: \.self) { col in
                    SirioTableHeader(
                        schemeColor: schemeColor,
                        size: size,
                        data: headersData[col],
                        withSeparator: col != headersData.indices.last
                    )
                    .background(columnWidthReader(col))
                }
            }
            ForEach(measuredRows) { rowData in
                GridRow {
                    ForEach(Array(rowData.cells.enumerated()), id: \.offset) { col, cellContent in
                        SirioTableCell(
                            content: cellContent,
                            size: size,
                            parity: .odd,
                            width: Size.zero,
                            height: Size.zero
                        )
                        .background(columnWidthReader(col))
                    }
                }
            }
        }
        .fixedSize(horizontal: allowHorizontalScroll, vertical: true)
        .frame(width: allowHorizontalScroll ? nil : screenWidth, alignment: .topLeading)
        .hidden()
        .allowsHitTesting(false)
        .accessibilityHidden(true)
        .onPreferenceChange(ColumnWidthsKey.self) { newWidths in
            if newWidths != colWidths {
                colWidths = newWidths
            }
        }
    }
    
    private func columnWidthReader(_ col: Int) -> some View {
        GeometryReader { geo in
            Color.clear.preference(key: ColumnWidthsKey.self, value: [col: geo.size.width])
        }
    }
    
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}

extension SirioTable {
    private func adjustedWidths(screenWidth: CGFloat) -> [Int: CGFloat] {
        let totalCols = headersData.count
        guard totalCols > 0 else { return [:] }
        
        let currentTotal = colWidths.values.reduce(0, +)
        let difference = screenWidth - currentTotal
        
        var result = colWidths
        
        if difference > 0, currentTotal > 0 {
            for (key, value) in result {
                let ratio = value / currentTotal
                result[key] = value + difference * ratio
            }
        }
        
        return result
    }
    
    @available(iOS 16.0, *)
    struct ScrollGeometry: Equatable {
        let contentOffset: CGPoint
        let contentSize: CGSize
        let containerSize: CGSize
    }
    
    private func updateScrollState(contentOffset: CGPoint, contentSize: CGSize, containerSize: CGSize) {
        let epsilon: CGFloat = 1.0
        let maxOffsetX = max(0, contentSize.width - containerSize.width)
        
        canScrollLeft = contentOffset.x > epsilon
        canScrollRight = contentOffset.x < maxOffsetX - epsilon
    }
    
    private var borderColor: Color {
        Color.Table.border
    }
    
    // Altezza minima di 1 per far partire il layout delle righe lazy
    private var tableHeight: CGFloat {
        max(contentTableHeight, 1)
    }
    
    // Righe usate per misurare le colonne: tutte se sono poche,
    // altrimenti quelle con le celle più lunghe di ogni colonna.
    private var measuredRows: [SirioTableRowData] {
        let maxRows = 32
        let perColumn = 8
        guard rows.count > maxRows else { return rows }
        
        var longest: [[(row: Int, weight: Int)]] = Array(repeating: [], count: headersData.count)
        for (rowIndex, row) in rows.enumerated() {
            for (col, cell) in row.cells.enumerated() {
                let weight = cell.measureWeight
                if longest[col].count < perColumn {
                    longest[col].append((rowIndex, weight))
                } else if let minIndex = longest[col].indices.min(by: { longest[col][$0].weight < longest[col][$1].weight }),
                          longest[col][minIndex].weight < weight {
                    longest[col][minIndex] = (rowIndex, weight)
                }
            }
        }
        let indexes = Set(longest.joined().map(\.row)).sorted()
        return indexes.map { rows[$0] }
    }
}

private extension SirioTableCell.Content {
    var measureWeight: Int {
        switch self {
        case .text(let text, _, _), .textOnly(let text), .numberOnly(let text), .tag(let text, _), .link(let text, _):
            return text.utf8.count
        case .action(let items):
            return items.count
        }
    }
}

/// Riga della tabella: colonne a larghezza fissa e celle tutte alte quanto la più alta.
private struct SirioTableRow<Cell: View>: View {
    let columns: Int
    let widths: [Int: CGFloat]
    @ViewBuilder let cell: (_ col: Int, _ width: CGFloat, _ height: CGFloat) -> Cell
    @State private var height: CGFloat = 0
    
    var body: some View {
        HStack(alignment: .top, spacing: Size.zero) {
            ForEach(0..<columns, id: \.self) { col in
                let width = widths[col] ?? 0
                cell(col, width, height)
                    .frame(width: width, alignment: .topLeading)
            }
        }
        .background(
            GeometryReader { geo in
                Color.clear.preference(key: RowHeightKey.self, value: geo.size.height)
            }
        )
        .onPreferenceChange(RowHeightKey.self) { newHeight in
            if abs(newHeight - height) > 0.5 {
                height = newHeight
            }
        }
    }
}

private struct RowHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

private struct ColumnWidthsKey: PreferenceKey {
    static var defaultValue: [Int: CGFloat] = [:]
    static func reduce(value: inout [Int: CGFloat], nextValue: () -> [Int: CGFloat]) {
        value.merge(nextValue(), uniquingKeysWith: max)
    }
}

private struct ContentHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
