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
    @State private var rowHeights: [Int: CGFloat] = [:]
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
                            horizontalTable18(widths: widths, screenWidth: screenWidth)
                        } else {
                            horizontalTable16(widths: widths, screenWidth: screenWidth)
                        }
                    } else {
                        ScrollView(.vertical) {
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
                        .onPreferenceChange(ContentHeightKey.self) { newHeight in
                            contentTableHeight = newHeight
                        }
                        .frame(maxHeight: contentTableHeight)
                    }
                }
            }
        }
    }
    
    @available(iOS 18.0, *)
    @ViewBuilder
    func horizontalTable18(widths: [Int: CGFloat], screenWidth: CGFloat) -> some View {
        ZStack(alignment: .top) {
            ScrollView(.horizontal) {
                ScrollView(.vertical) {
                    contentTable(widths: widths, screenWidth: screenWidth)
                }
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
                contentTableHeight = newValue.contentSize.height
            }
            
            if canScrollLeft {
                Rectangle()
                    .fill(Color.aliasInteractiveAccentDefault)
                    .frame(width: Size.Table.scrollingTableWidth,
                           height: contentTableHeight)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if canScrollRight {
                Rectangle()
                    .fill(Color.aliasInteractiveAccentDefault)
                    .frame(width: Size.Table.scrollingTableWidth,
                           height: contentTableHeight)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    @ViewBuilder
    func horizontalTable16(widths: [Int: CGFloat], screenWidth: CGFloat) -> some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                ScrollView(.horizontal, showsIndicators: false) {
                    contentTable(widths: widths, screenWidth: screenWidth)
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
                                contentTableHeight = proxy.size.height
                                containerSize = proxy.size
                            }
                            .onChange(of: proxy.size.height) { newHeight in
                                contentTableHeight = newHeight
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
    
    @ViewBuilder
    func contentTable(widths: [Int: CGFloat], screenWidth: CGFloat) -> some View {
        Grid(alignment: .topLeading, horizontalSpacing: Size.zero, verticalSpacing: Size.zero) {
            // Header row
            GridRow {
                ForEach(headersData.indices, id: \.self) { col in
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
                        width: widths[col] ?? 0,
                        height: rowHeights[-1] ?? 0,
                        withSeparator: col != headersData.indices.last
                    )
                    .background(
                        GeometryReader { geo in
                            Color.clear.onAppear {
                                let size = geo.size
                                if rowHeights[-1, default: 0] < size.height {
                                    rowHeights[-1] = size.height
                                }
                                if colWidths[col, default: 0] < size.width {
                                    colWidths[col] = size.width
                                }
                            }
                        }
                    )
                }
            }
            // Data rows
            ForEach(Array(rows.enumerated()), id: \.element.id) { rowIndex, rowData in
                GridRow {
                    ForEach(Array(rowData.cells.enumerated()), id: \.offset) { colIndex, cellContent in
                        let width = widths[colIndex] ?? 0
                        let height = rowHeights[rowIndex] ?? 0
                        
                        SirioTableCell(
                            content: cellContent,
                            size: size,
                            parity: alternateRowColors ? rowIndex % 2 == 0 ? .even : .odd : .odd,
                            width: width,
                            height: height
                        )
                        .background(
                            GeometryReader { geo in
                                Color.clear.onAppear {
                                    let size = geo.size
                                    if rowHeights[rowIndex, default: 0] < size.height {
                                        rowHeights[rowIndex] = size.height
                                    }
                                    if colWidths[colIndex, default: 0] < size.width {
                                        colWidths[colIndex] = size.width
                                    }
                                }
                            }
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
        .frame(minWidth: screenWidth)
        
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
}

private struct ContentHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
