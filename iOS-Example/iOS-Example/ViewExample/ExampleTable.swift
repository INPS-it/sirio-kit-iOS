//
// ExampleTable.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTable: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Table")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleTable {
    
    enum Destination: Hashable {
        case tableSmallDark
        case tableSmallLight
        case tableSmallDarkMore
        case tableLargeDark
        case tableLargeLight
        case tableLargeDarkLong
        case tableHorizontalScroll
        case tableAlternateRows
        case tableCard
        case tableDrawer
        case tableDemo
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Table Small Dark", action: { path.append(Destination.tableSmallDark) }),
            .default(title: "Table Small Light", action: { path.append(Destination.tableSmallLight) }),
            .default(title: "Table Small Dark - More", action: { path.append(Destination.tableSmallDarkMore) }),
            .default(title: "Table Large Dark", action: { path.append(Destination.tableLargeDark) }),
            .default(title: "Table Large Light", action: { path.append(Destination.tableLargeLight) }),
            .default(title: "Table Large Dark - Long text", action: { path.append(Destination.tableLargeDarkLong) }),
            .default(title: "Table Horizontal scroll", action: { path.append(Destination.tableHorizontalScroll) }),
            .default(title: "Table Alternate rows", action: { path.append(Destination.tableAlternateRows) }),
            .default(title: "Table Card", action: { path.append(Destination.tableCard) }),
            .default(title: "Table Drawer", action: { path.append(Destination.tableDrawer) }),
            .default(title: "Table Demo", action: { path.append(Destination.tableDemo) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .tableSmallDark:
            ExampleTable1(title: "Table Small Dark", schemeColor: .dark, size: .small)
                .navigationTitle("Table Small Dark")
                .background(Color.colorBackground)
            
        case .tableSmallLight:
            ExampleTable1(title: "Table Small Light", schemeColor: .light, size: .small)
                .navigationTitle("Table Small Light")
                .background(Color.colorBackground)
            
        case .tableSmallDarkMore:
            ExampleTable2(title: "Table Small Dark - More", schemeColor: .dark, size: .small)
                .navigationTitle("Table Small Dark - More")
                .background(Color.colorBackground)
            
        case .tableLargeDark:
            ExampleTable3(title: "Table Large Dark", schemeColor: .dark, size: .large)
                .navigationTitle("Table Large Dark")
                .background(Color.colorBackground)
            
        case .tableLargeLight:
            ExampleTable3(title: "Table Large Light", schemeColor: .light, size: .large)
                .navigationTitle("Table Large Light")
                .background(Color.colorBackground)
            
        case .tableLargeDarkLong:
            ExampleTable4(title: "Table Large Dark - Long text", schemeColor: .dark, size: .large)
                .navigationTitle("Table Large Dark - Long text")
                .background(Color.colorBackground)
            
        case .tableHorizontalScroll:
            ExampleTable5(title: "Table Horizontal - scroll", schemeColor: .dark, size: .large)
                .navigationTitle("Table Horizontal scroll")
                .background(Color.colorBackground)
            
        case .tableAlternateRows:
            ExampleTable6(title: "Table Alternate rows", schemeColor: .dark, size: .large)
                .navigationTitle("Table Alternate rows")
                .background(Color.colorBackground)
             
        case .tableCard:
            ExampleTableCard(title: "Table Card", size: .large)
                .navigationTitle("Table Card")
                .background(Color.colorBackground)
            
        case .tableDrawer:
            ExampleTableDrawer()
                .navigationTitle("Table Drawer")
                .background(Color.colorBackground)
            
        case .tableDemo:
            
            ExampleTable8(title: "Table Demo", schemeColor: .dark, size: .large)
                .navigationTitle("Table Demo")
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleTable(path: .constant(NavigationPath()))
}

// MARK: - ExampleTable1
struct ExampleTable1: View {
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize
    
    let headers: [SirioTableHeaderData] = (0..<3).map { index in
            .init(title: "Header", isSortable: true)
    }
    
    @State private var rows: [SirioTableRowData] = (0..<8).map { _ in
            .init(cells: [
                .link(text: "Link", onTap: nil),
                .numberOnly(text: "00"),
                .textOnly(text: "Lorem ipsum"),
            ])
    }
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            SirioTable(
                schemeColor: schemeColor,
                title: "Titolo tabella",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                ],
                size: size,
                headersData: headers,
                rows: $rows
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTable2
struct ExampleTable2: View {
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize
    
    let headers: [SirioTableHeaderData] = (0..<3).map { index in
            .init(title: "Header", isSortable: true)
    }
    
    @State private var rows: [SirioTableRowData] = (0..<8).map { _ in
            .init(cells: [
                .link(text: "Link", onTap: nil),
                .numberOnly(text: "00"),
                .textOnly(text: "Sed at felis quis urna porttitor aliquam"),
            ])
    }
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            
            SirioTable(
                schemeColor: schemeColor,
                title: "Titolo tabella",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                ],
                size: size,
                headersData: headers,
                rows: $rows
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTable3
struct ExampleTable3: View {
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize
    
    let headers: [SirioTableHeaderData] = (0..<3).enumerated().map { index, _ in
            .init(title: "Header", isSortable: index < 2)
    }
    
    @State private var rows: [SirioTableRowData] = (0..<18).map { _ in
            .init(cells: [
                .text(text: "Title", isChecked: .constant(false), onTapCheckBoxAction: {}),
                .tag(text: "Label Tag"),
                .action(items: [
                    .init(value: "Action #1", action: {}),
                    .init(value: "Action #2", action: {}),
                    .init(value: "Action #3", action: {})
                ])
            ])
    }
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            SirioTable(
                schemeColor: schemeColor,
                title: "Titolo tabella",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                ],
                size: size,
                headersData: headers,
                rows: $rows
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTable4
struct ExampleTable4: View {
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize
    
    let headers: [SirioTableHeaderData] = (0..<3).enumerated().map { index, _ in
            .init(title: "Header", isSortable: index < 2)
    }
    
    @State private var rows: [SirioTableRowData] = (0..<8).map { _ in
            .init(cells: [
                .text(text: "Vivamus at nunc non arcu", isChecked: .constant(false), onTapCheckBoxAction: {}),
                .tag(text: "Tag con testo lungo"),
                .action(items: [.init(value: "", iconData: .previewEye, action: {})])
            ])
    }
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            SirioTable(
                schemeColor: schemeColor,
                title: "Titolo tabella molto molto molto molto lungo su due righe",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                ],
                size: size,
                headersData: headers,
                rows: $rows
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTable5
struct ExampleTable5: View {
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize
    
    let headers: [SirioTableHeaderData] = (0..<4).enumerated().map {index, _ in
            .init(title: "Header", isSortable: index < 2)
    }
    
    @State private var rows: [SirioTableRowData] = (0..<18).map { _ in
            .init(cells: [
                .textOnly(text: "Lorem ipsum"),
                .numberOnly(text: "00"),
                .tag(text: "Label Tag"),
                .textOnly(text: "Label"),
            ])
    }
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            SirioTable(
                schemeColor: schemeColor,
                title: "Titolo tabella",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                ],
                size: size,
                headersData: headers,
                rows: $rows,
                allowHorizontalScroll: true
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTable6
struct ExampleTable6: View {
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize
    
    let headers: [SirioTableHeaderData] = (0..<3).enumerated().map {index, _ in
            .init(title: "Header", isSortable: index < 2)
    }
    
    @State private var rows: [SirioTableRowData] = (0..<8).map { _ in
            .init(cells: [
                .text(text: "Title", isChecked: .constant(false), onTapCheckBoxAction: {}),
                .tag(text: "Label Tag"),
                .action(items: [.init(value: "", iconData: .previewEye, action: {})])
            ])
    }
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            SirioTable(
                schemeColor: schemeColor,
                title: "Titolo tabella",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {}),
                ],
                size: size,
                headersData: headers,
                rows: $rows,
                alternateRowColors: true
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTableCard
struct ExampleTableCard: View {
    let title: String
    let size: SirioTableSize
    
    var body: some View {
        VStack {
            SirioText(text: title, typography: .labelMdMiddle)
            
            SirioTableCards(
                title: "Titolo tabella",
                actions: [
                    .init(value: "Label", iconData: .previewCube, action: {}),
                    .init(value: "Label", iconData: .previewCube, action: {})
                ],
                cards: [
                    [
                        .init(content: .text(header: "Header 1", text: "Lorem ipsum sagittis egestas at proin")),
                        .init(content: .number(header: "Header", text: "00")),
                        .init(content: .link(header: "Header", text: "Link", onTap: {
                            print("Link tappato")
                        })),
                        .init(content: .tag(header: "Header", text: "Label Tag")),
                        .init(content: .multiIcons(
                            icons: [
                                .init(icon: .filePdf, action: {}),
                                .init(icon: .download, action: {}),
                                .init(icon: .trash, action: {})
                            ]
                        ))
                    ],
                    [
                        .init(content: .text(header: "Header 1", text: "Lorem ipsum sagittis egestas at proin")),
                        .init(content: .number(header: "Header", text: "00")),
                        .init(content: .link(header: "Header", text: "Link", onTap: {
                            print("Link tappato")
                        })),
                        .init(content: .tag(header: "Header", text: "Label Tag")),
                        .init(content: .multiIcons(
                            icons: [
                                .init(icon: .filePdf, action: {}),
                                .init(icon: .download, action: {}),
                                .init(icon: .trash, action: {})
                            ]
                        ))
                    ],
                    [
                        .init(content: .text(header: "Header 1", text: "Lorem ipsum sagittis egestas at proin")),
                        .init(content: .number(header: "Header", text: "00")),
                        .init(content: .link(header: "Header", text: "Link", onTap: {
                            print("Link tappato")
                        })),
                        .init(content: .tag(header: "Header", text: "Label Tag")),
                        .init(content: .multiIcons(
                            icons: [
                                .init(icon: .filePdf, action: {}),
                                .init(icon: .download, action: {}),
                                .init(icon: .trash, action: {})
                            ]
                        ))
                    ],
                ],
                alternateRowColors: true
            )
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - ExampleTableDrawer
struct ExampleTableDrawer: View {
    @State private var showDrawer = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Apri Drawer") {
                showDrawer = true
            }
        }
        .sirioTableDrawer(
            isPresented: $showDrawer,
            title: "Titolo del Drawer",
            rows: [
                .init(content: .link(header: "Header", text: "Link", onTap: {})),
                .init(content: .number(header: "Header", text: "00")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
            ],
            bottomIcons: [
                .init(icon: .print, action: {}),
                .init(icon: .download, action: {}),
                .init(icon: .trash, action: {})
            ],
            onTapClose: {
                print("Chiudi Drawer")
            }
        )
    }
}

// MARK: - ExampleTable7 (Demo con ordinamento)
struct ExampleTable7: View {

    // MARK: - Model
    struct Item: Identifiable {
        let id = UUID()
        let text: String
        let number: Int
        let letter: String
        var checked: Bool
    }

    // MARK: - Props
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize

    // MARK: - State
    @State private var items: [Item]
    private let originalItems: [Item]

    // MARK: - Init
    init(title: String, schemeColor: SchemeColor, size: SirioTableSize) {
        self.title = title
        self.schemeColor = schemeColor
        self.size = size

        let n = 11
        let nums = (1...n).shuffled()
        let lets = (0..<n).map { String(UnicodeScalar(65 + $0)!) }.shuffled()

        let generated = (0..<n).map {
            Item(
                text: "Title \($0)",
                number: nums[$0],
                letter: lets[$0],
                checked: false
            )
        }

        _items = State(initialValue: generated)
        originalItems = generated
    }

    // MARK: - Headers
    private let headers = [
        SirioTableHeaderData(title: "Checked", isSortable: false),
        SirioTableHeaderData(title: "Number", isSortable: true),
        SirioTableHeaderData(title: "Letter", isSortable: true)
    ]

    // MARK: - Body
    var body: some View {
        SirioTable(
            schemeColor: schemeColor,
            title: title,
            actions: [.init(value: "Label", iconData: .previewCube, action: {})],
            size: size,
            headersData: headers,
            rows: .constant(makeRows(from: items)),
            alternateRowColors: true,
            sort: .ascending(2),
            onSortRequest: onSortRequest
        )
        .padding()
    }

    // MARK: - Sorting (USER RESPONSIBILITY)
    private func onSortRequest(_ sort: SirioTableSort) {
        guard sort.order != .none else {
            items = originalItems
            return
        }

        let asc = sort.order == .ascending

        items.sort {
            compare($0, $1, column: sort.columnIndex, ascending: asc)
        }
    }

    // MARK: - Helpers
    private func makeRows(from items: [Item]) -> [SirioTableRowData] {
        items.map {
            SirioTableRowData(cells: [
                .text(text: $0.text, isChecked: .constant($0.checked)),
                .numberOnly(text: "\($0.number)"),
                .tag(text: $0.letter)
            ])
        }
    }

    private func compare(
        _ a: Item,
        _ b: Item,
        column: Int,
        ascending: Bool
    ) -> Bool {
        let result: Bool

        switch column {
        case 0: result = !a.checked && b.checked
        case 1: result = a.number < b.number
        case 2: result = a.letter < b.letter
        default: result = true
        }

        return ascending ? result : !result
    }
}

struct ExampleTable8: View {

    // MARK: - Model
    struct Item: Identifiable {
        let id = UUID()
        let text: String
        let number: Int
        let letter: String
        var checked: Bool
    }

    // MARK: - Props
    let title: String
    let schemeColor: SchemeColor
    let size: SirioTableSize

    // MARK: - State
    @State private var items: [Item]
    @State private var tableSort = SirioTableSort(columnIndex: 0, order: .none)

    private let originalItems: [Item]

    // MARK: - Init
    init(title: String, schemeColor: SchemeColor, size: SirioTableSize) {
        self.title = title
        self.schemeColor = schemeColor
        self.size = size

        let n = 11
        let nums = (1...n).shuffled()
        let lets = (0..<n).map { String(UnicodeScalar(65 + $0)!) }.shuffled()

        let generated = (0..<n).map {
            Item(
                text: "Title \($0)",
                number: nums[$0],
                letter: lets[$0],
                checked: false
            )
        }

        _items = State(initialValue: generated)
        originalItems = generated
    }

    // MARK: - Headers
    private let headers = [
        SirioTableHeaderData(title: "Checked", isSortable: false),
        SirioTableHeaderData(title: "Number", isSortable: true),
        SirioTableHeaderData(title: "Letter", isSortable: true)
    ]

    // MARK: - Derived data (AUTOMATIC + STABLE SORT)
    private var visibleItems: [Item] {
        items.stableSortedForSirioTable(sort: tableSort) { item, column, _ in
            switch column {
            case 1:
                return .number(Double(item.number))
            case 2:
                return .string(item.letter)
            default:
                return nil
            }
        }
    }

    // MARK: - Body
    var body: some View {
        SirioTable(
            schemeColor: schemeColor,
            title: title,
            actions: [
                .init(value: "Label", iconData: .previewCube, action: {})
            ],
            size: size,
            headersData: headers,
            rows: .constant(makeRows(from: visibleItems)),
            alternateRowColors: true,
            sort: tableSort,
            onSortRequest: onSortRequest
        )
        .padding()
    }

    // MARK: - Sort handling (ANDROID-ALIGNED)
    private func onSortRequest(_ sort: SirioTableSort) {
        if sort.order == .none {
            items = originalItems
        }
        tableSort = sort
    }

    // MARK: - Helpers
    private func makeRows(from items: [Item]) -> [SirioTableRowData] {
        items.map {
            SirioTableRowData(cells: [
                .text(text: $0.text, isChecked: .constant($0.checked)),
                .numberOnly(text: "\($0.number)"),
                .tag(text: $0.letter)
            ])
        }
    }
}
