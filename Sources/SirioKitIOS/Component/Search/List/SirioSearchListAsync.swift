//
// SirioListAsyncSearch.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A customizable asynchronous searchable list component.
///
/// This view provides:
/// - A search bar with placeholder and label.
/// - An optional suggestions dropdown.
/// - A scrollable list of asynchronously loaded items.
/// - A customizable rendering closure for each item.
///
/// The component automatically handles loading states for both suggestions and
/// search results, and displays the appropriate UI feedback.
///
/// - Parameters:
///   - placeholder: The text displayed in the search field when empty.
///                  Default is `"Inserisci il testo"`.
///   - label: An optional label displayed above the search bar.
///   - fetchResults: An async closure that receives the current search text and
///                   returns the list of matching items.
///   - fetchSuggestions: An async closure that receives the current input and
///                       returns a list of suggestion strings.
///   - itemView: A closure that provides the view used to display each item.
///
/// The component maintains the following internal state:
/// - `searchText`: The current content of the search field.
/// - `optionValues`: The suggestions list returned by `fetchSuggestions`.
/// - `items`: The results list returned by `fetchResults`.
/// - `isLoading`: A flag indicating whether search results are being loaded.
/// - `isLoadingSuggestions`: A flag indicating whether suggestions are being loaded.
/// - `hasSearched`: Indicates whether at least one search has been executed,
///                  used to determine whether to show empty states.
public struct SirioSearchListAsync<T: Identifiable, ItemView: View>: View {
    var placeholder: String
    var label: String?
    
    @State private var searchText: String = ""
    @State private var optionValues: [String] = []        // Suggestions dropdown
    @State private var items: [T] = []                    // Search results
    @State private var isLoading: Bool = false            // Search loading state
    @State private var isLoadingSuggestions: Bool = false // Suggestions loading state
    @State private var hasSearched: Bool = false          // For controlling empty-state display
    
    var fetchResults: (String) async -> [T]
    var fetchSuggestions: (String) async -> [String]
    var itemView: (T, Bool?) -> ItemView // Item, ShowsDivider
    var emptyStateTitle: String?
    var emptyStateSubtitle: String?
    
    // MARK: - Init
    public init(label: String? = nil,
                placeholder: String = "Inserisci il testo",
                fetchResults: @escaping (String) async -> [T],
                fetchSuggestions: @escaping (String) async -> [String],
                @ViewBuilder itemView: @escaping (T, Bool?) -> ItemView,
                emptyStateTitle: String? = nil,
                emptyStateSubtitle: String? = nil) {
        self.label = label
        self.placeholder = placeholder
        self.fetchResults = fetchResults
        self.fetchSuggestions = fetchSuggestions
        self.itemView = itemView
        self.emptyStateTitle = emptyStateTitle
        self.emptyStateSubtitle = emptyStateSubtitle
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.SearchBar.spacingVertical) {
            
            // Search bar
            SirioSearchBarAsync(
                label: label,
                placeholder: placeholder,
                searchText: $searchText,
                optionValues: $optionValues,
                isLoadingSuggestions: isLoadingSuggestions,
                onTapSearch: {
                    Task { await performSearch() }
                },
                onQueryAdded: { query in
                    searchText = query
                    Task { await performSearch() }
                }
            )
            .padding(.horizontal, Size.p16)
            // Aggiorna suggerimenti durante la digitazione
            .onChange(of: searchText) { newValue in
                Task { await updateSuggestions(for: newValue) }
            }
            
            // 🔹 Stato risultati
            if isLoading {
                EmptyView()
            } else if hasSearched && !searchText.isEmpty && items.isEmpty {
                SirioSearchNoResult(title: emptyStateTitle, subtitle: emptyStateSubtitle)
            } else if !items.isEmpty {
                ScrollView {
                    VStack(spacing: Size.zero) {
                        ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                            itemView(
                                item,
                                index != items.count - 1
                            )
                        }
                    }
                }
            }
        }
    }

    // MARK: - Async logic
    private func performSearch() async {
        guard !searchText.isEmpty else {
            withAnimation {
                items = []
                hasSearched = false
            }
            return
        }
        isLoading = true
        hasSearched = true
        defer { isLoading = false }
        
        try? await Task.sleep(nanoseconds: 600_000_000)
        let results = await fetchResults(searchText)
        
        withAnimation {
            self.items = results
        }
    }
    
    private func updateSuggestions(for text: String) async {
        guard !text.isEmpty else {
            await MainActor.run { optionValues = [] }
            return
        }

        await MainActor.run {
            isLoadingSuggestions = true
            optionValues = []
        }

        let suggestions = await fetchSuggestions(text)

        await MainActor.run {
            isLoadingSuggestions = false
            
            // Aggiorna solo se il testo è ancora quello cercato
            guard searchText == text else { return }

            if !suggestions.isEmpty {
                optionValues = suggestions
            }
        }
    }
}

struct Employee: Identifiable {
    let id = UUID()
    let name: String
    let role: String
}

struct AsyncSearchPreview: View {
    var body: some View {
        SirioSearchListAsync(
            label: "Cerca dipendente",
            placeholder: "Inserisci nome o ruolo",
            fetchResults: { query in
                // Simula chiamata remota
                let all = [
                    Employee(name: "Mario Rossi", role: "Developer"),
                    Employee(name: "Giulia Verdi", role: "Designer"),
                    Employee(name: "Luca Bianchi", role: "Project Manager"),
                    Employee(name: "Martina Neri", role: "HR")
                ]
                try? await Task.sleep(nanoseconds: 800_000_000)
                return all.filter {
                    $0.name.localizedCaseInsensitiveContains(query) ||
                    $0.role.localizedCaseInsensitiveContains(query)
                }
            },
            fetchSuggestions: { query in
                // Simula suggerimenti dinamici
                let all = ["Mario Rossi", "Martina Neri", "Giulia Verdi", "Luca Bianchi"]
                if query.lowercased().contains("x") { return [] }
                try? await Task.sleep(nanoseconds: 300_000_000)
                return all.filter { $0.localizedCaseInsensitiveContains(query) }
            },
            itemView: { employee, showsDivider in
                SirioListItem(
                    model: .default(
                        title: employee.name,
                        subtitle: employee.role
                    ),
                    showsDivider: showsDivider ?? true
                )
            }
        )
        Spacer()
    }
}

#Preview {
    AsyncSearchPreview()
}
