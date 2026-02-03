//
// SirioSearchList.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A customizable search list component.
///
/// Displays a search bar with placeholder text and a scrollable list of items.
/// Each item is rendered using the provided `itemView` closure.
///
/// - Parameters:
///   - placeholder: The placeholder text shown when the search field is empty. Default is `"Inserisci il testo"`.
///   - searchText: A binding to the current search string.
///   - items: The list of items to display below the search bar.
///   - itemView: A closure returning the view to display for each item.
///   - onTapSearch: An optional callback executed when the search button is tapped.

public struct SirioSearchList<T: Identifiable, ItemView: View>: View {
    var placeholder: String
    @Binding var searchText: String
    var items: [T]
    var itemView: (T, Bool?) -> ItemView // Item, ShowsDivider
    var chips: [String]?
    var onFilter: ((T, String, String?) -> Bool)?
    var emptyStateTitle: String?
    var emptyStateSubtitle: String?
    @Binding var selectedChips: String?
    
    public init(placeholder: String = "Inserisci il testo",
                searchText: Binding<String>,
                chips: [String]? = nil,
                selectedChips: Binding<String?> = .constant(nil),
                items: [T],
                @ViewBuilder itemView: @escaping (T, Bool?) -> ItemView,
                onFilter: ((T, String, String?) -> Bool)?,
                emptyStateTitle: String? = nil,
                emptyStateSubtitle: String? = nil){
        self.placeholder = placeholder
        self._searchText = searchText
        self.chips = chips
        self._selectedChips = selectedChips
        self.items = items
        self.itemView = itemView
        self.onFilter = onFilter
        self.emptyStateTitle = emptyStateTitle
        self.emptyStateSubtitle = emptyStateSubtitle
    }
    
    private var filteredItems: [T] {
            items.filter { item in
                if let onFilter = onFilter {
                    return onFilter(item, searchText, selectedChips)
                } else {
                    // Default filtering logic
                    if let text = item as? String {
                        return (selectedChips == nil || text.contains(selectedChips!)) &&
                               (searchText.isEmpty || text.localizedCaseInsensitiveContains(searchText))
                    } else {
                        return true
                    }
                }
            }
        }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.SearchBar.spacingVertical) {
            VStack(spacing: Size.zero) {
                SirioSearchBar(placeholder: placeholder,
                                searchText: $searchText)
                
                if let chips = chips, !chips.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(chips, id: \.self) { text in
                                SirioChipsSelection(text: text, isSelected:  Binding(
                                    get: { selectedChips == text },
                                    set: { newValue in
                                        selectedChips = newValue ? text : nil
                                    }
                                ), isDisabled: .constant(false))
                                .padding(.vertical, Size.p8)
                            }
                        }
                        .padding(.vertical, Size.p8)
                        .padding(.horizontal, Size.p16)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: Size.Filtri.cFrame)
                    .background(Color.aliasBackgroundColorPrimaryLight0)
                }
                ScrollView {
                    if filteredItems.isEmpty && (!searchText.isEmpty || selectedChips != nil) {
                        SirioSearchNoResult(title: emptyStateTitle, subtitle: emptyStateSubtitle)
                    } else {
                        ForEach(Array(filteredItems.enumerated()), id: \.element.id) { index, item in
                            itemView(
                                item,
                                index != filteredItems.count - 1
                            )
                        }
                    }
                }
            }
        }
    }
}


struct ExampleSearchListView: View {
    struct Employee: Identifiable {
        let id = UUID()
        let name: String
        let area: String
        let role: String
    }
    @State private var searchText: String = ""
    @State private var selectedChip: String? = nil

    private let chips = ["Amministrazione", "Tecnologia", "HR", "Direzione"]

    private let employees = [
        Employee(name: "Mario Rossi", area: "Tecnologia", role: "iOS Developer"),
        Employee(name: "Luca Bianchi", area: "Amministrazione", role: "Contabile"),
        Employee(name: "Giulia Verdi", area: "HR", role: "Recruiter"),
        Employee(name: "Martina Neri", area: "Tecnologia", role: "Backend Engineer"),
        Employee(name: "Francesco Gialli", area: "Direzione", role: "Manager"),
        Employee(name: "Chiara Viola", area: "HR", role: "People Partner"),
        Employee(name: "Andrea Rosso", area: "Tecnologia", role: "Frontend Developer")
    ]

    var body: some View {
        SirioSearchList(
            placeholder: "Cerca un dipendente",
            searchText: $searchText,
            chips: chips,
            selectedChips: $selectedChip,
            items: employees,
            itemView: { employee, showsDivider in
                SirioListItem(model: .default(title: employee.name, subtitle: "\(employee.role) - \(employee.area)"), showsDivider: showsDivider ?? true)
            },
            onFilter: { employee, search, chip in
                let matchesSearch =
                    search.isEmpty ||
                    employee.name.localizedCaseInsensitiveContains(search) ||
                    employee.role.localizedCaseInsensitiveContains(search)

                let matchesChip =
                    chip == nil || employee.area.localizedCaseInsensitiveContains(chip!)

                return matchesSearch && matchesChip
            }
        )
    }
}

#Preview {
    ExampleSearchListView()
}
