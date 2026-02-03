//
// ExampleSearch.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleSearch: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Search")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleSearch {
    
    enum Destination: Hashable {
        case list
        case noList
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "List", action: { path.append(Destination.list) }),
            .default(title: "No List", action: { path.append(Destination.noList) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .list:
            ExampleSearchList()
                .navigationTitle("Search List")
                .background(Color.colorBackground)
            
        case .noList:
            ExampleSearchListAsync()
                .navigationTitle("Search No List")
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleSearch(path: .constant(NavigationPath()))
}

#Preview {
    ExampleSearchList()
}

#Preview {
    ExampleSearchListAsync()
}

// Search List
struct ExampleSearchList: View {
    @State private var searchText: String = ""
    @State private var selectedChip: String? = nil
    
    private let chips = Array(Set(Item.mock.map(\.subtitle))).sorted()
    var body: some View {
        SirioSearchList(
            placeholder: "Inserisci il testo",
            searchText: $searchText,
            chips: chips,
            selectedChips: $selectedChip,
            items: Item.mock,
            itemView: { item, showsDivider in
                SirioListItem(model: .default(title: item.title, subtitle: item.subtitle), showsDivider: showsDivider ?? true)
            },
            onFilter: { item, search, chip in
                let matchesSearch =
                search.isEmpty ||
                item.title.localizedCaseInsensitiveContains(search)
                
                let matchesChip =
                chip == nil || item.subtitle.localizedCaseInsensitiveContains(chip!)
                
                return matchesSearch && matchesChip
            }
        )
    }
}

// Search List Async
struct ExampleSearchListAsync: View {
    var body: some View {
        SirioSearchListAsync(
            label: "Label",
            placeholder: "Inserisci il testo",
            fetchResults: { query in
                // Simula chiamata remota
                let all = Item.mock
                try? await Task.sleep(nanoseconds: 800_000_000)
                return all.filter {
                    $0.title.localizedCaseInsensitiveContains(query)
                }
            },
            fetchSuggestions: { query in
                // Simula suggerimenti dinamici
                let all = Item.mock.map(\.title)
                if query.lowercased().contains("x") { return [] }
                try? await Task.sleep(nanoseconds: 300_000_000)
                return all.filter { $0.localizedCaseInsensitiveContains(query) }
            },
            itemView: { item, showsDivider in
                SirioListItem(model: .default(title: item.title), showsDivider: showsDivider)
            }
        )
        Spacer()
    }
}


struct Item: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    
    static let mock: [Item] = [
        Item(title: "Vitae elit, dolor sit amet", subtitle: "A"),
        Item(title: "Eiusmod tempor incididunt", subtitle: "C"),
        Item(title: "Minim veniam, exercitation laboris", subtitle: "B"),
        Item(title: "Irure dolor in voluptate", subtitle: "A"),
        Item(title: "Sint occaecat cupidatat", subtitle: "B"),
        Item(title: "Pretium tincidunt", subtitle: "C"),
        Item(title: "Quis ante", subtitle: "A"),
        Item(title: "Sit amet orci", subtitle: "B"),
        Item(title: "Administratio Perspicua", subtitle: "C"),
        Item(title: "Fringilla sit amet", subtitle: "A"),
        Item(title: "A est", subtitle: "B"),
        Item(title: "A est", subtitle: "C")
    ]
}
