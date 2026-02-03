//
// SirioSearchBar.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A search bar component with suggestions and recently searched queries functionality.
/// - Parameters:
///   - label: The optional string displayed above the search bar.
///   - placeholder: The placeholder text inside the search bar when empty.
///   - searchText: The binding for the current search string.
///   - optionValues: The list of suggestions based on the current [searchText].
///   - queries: The list of recently searched queries.
///   - onTapSearch: The callback executed when the search button is tapped.
///   - onQueryAdded: The callback invoked when the [queries] list is modified.
///

public struct SirioSearchBarAsync: View {
    var label: String?
    var placeholder: String
    @Binding var searchText: String
    @Binding var optionValues: [String]
    var isLoadingSuggestions: Bool = false
    private var onTapSearch: (() -> Void)?
    private var onQueryAdded: ((String) -> Void)?
    @State private var isOpenOptions: Bool = false
    @FocusState private var isFocused: Bool
    
    private var prompterHeight: CGFloat {
        if optionValues.isEmpty {
            return CGFloat(Size.SearchBar.height)
        } else {
            return min(CGFloat(optionValues.count) * CGFloat(Size.SearchBar.height),
                       Size.SearchBar.Options.maxHeight)
        }
    }
    
    public init(label: String?,
                placeholder: String = "",
                searchText: Binding<String>,
                optionValues: Binding<[String]> = .constant([]),
                isLoadingSuggestions: Bool = false,
                onTapSearch: (() -> Void)?,
                onQueryAdded: ((String) -> Void)?){
        self.label = label
        self.placeholder = placeholder
        self._searchText = searchText
        self._optionValues = optionValues
        self.isLoadingSuggestions = isLoadingSuggestions
        self.onTapSearch = onTapSearch
        self.onQueryAdded = onQueryAdded
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.SearchBar.spacingVertical) {
            if let label = label {
                SirioText(text: label, typography: Typography.SearchBar.label)
                    .foregroundColor(Color.SearchBar.Text.default)
            }
            
            searchBar
            
            if isOpenOptions {
                optionsView
            }
        }
        .onChange(of: searchText) { newValue in
            if !newValue.isEmpty && isFocused {
                isOpenOptions = true
            } else {
                isOpenOptions = false
            }
        }
        .onChange(of: isFocused) { newValue in
            if newValue && !searchText.isEmpty {
                isOpenOptions = true
            } else {
                isOpenOptions = false
            }
        }
    }
    
    private var searchBar: some View {
        HStack(spacing: Size.SearchBar.spacingHorizontal) {
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    SirioText(text: placeholder, typography: Typography.SearchBar.searchText)
                        .foregroundColor(Color.SearchBar.Text.default)
                        .lineLimit(1)
                }
                TextField("", text: $searchText)
                    .sirioFont(typography: Typography.SearchBar.searchText)
                    .foregroundColor(Color.SearchBar.Text.default)
                    .accentColor(Color.SearchBar.Text.default)
                    .lineLimit(1)
                    .focused($isFocused)
                    .disableAutocorrection(true)
                    .submitLabel(.search)
            }
            
            Spacer()
            
            if !searchText.isEmpty {
                Button(action: {
                    DispatchQueue.main.async { searchText = "" }
                }, label: {
                    SirioIcon(data: .init(icon: .times))
                        .foregroundColor(Color.SearchBar.Button.Icon.clear)
                        .frame(width: Size.SearchBar.Icon.frame, height: Size.SearchBar.Icon.frame)
                })
            }
            
            Button(action: {
                if !searchText.isEmpty {
                    isOpenOptions = false
                    self.isFocused = false
                    onQueryAdded?(searchText)
                }
                onTapSearch?()
            }, label: {
                VStack {
                    SirioIcon(data: .init(icon: .search))
                        .foregroundColor(Color.SearchBar.Button.Icon.search)
                        .frame(width: Size.SearchBar.Icon.frame, height: Size.SearchBar.Icon.frame)
                }
                .frame(width: Size.SearchBar.ButtonSearch.width,
                       height: Size.SearchBar.ButtonSearch.height)
            })
            .background(Color.SearchBar.Button.Background.search)
        }
        .frame(height: Size.SearchBar.height)
        .padding(.leading, Size.SearchBar.paddingLeading)
        .overlay(
            RoundedRectangle(cornerRadius: Size.SearchBar.cornerRadius)
                .stroke(Color.SearchBar.Border.default, lineWidth: Size.SearchBar.lineWidth)
        )
        .background(Color.SearchBar.Background.default)
        .cornerRadius(Size.SearchBar.cornerRadius)
    }
    
    // MARK: - Dropdown con suggerimenti
    private var optionsView: some View {
        VStack(spacing: Size.zero) {
            if isLoadingSuggestions {
                // Mostra stato di caricamento
                Button(action: {}, label: {})
                    .buttonStyle(OptionsStyle(text: "Caricamento suggerimenti…"))
                    .disabled(true)
                    .frame(height: Size.SearchBar.height)
            } else if optionValues.isEmpty && !searchText.isEmpty {
                // Mostra "nessun suggerimento" solo se non stiamo caricando
                Button(action: {}, label: {})
                    .buttonStyle(OptionsStyle(text: "Nessun suggerimento per “\(searchText)”"))
                    .disabled(true)
                    .frame(height: Size.SearchBar.height)
            } else if optionValues.count == 1 {
                // Un solo suggerimento
                Button(action: {
                    searchText = optionValues.first ?? ""
                    isOpenOptions = false
                    isFocused = false
                    onQueryAdded?(searchText)
                    onTapSearch?()
                }, label: {})
                .buttonStyle(OptionsStyle(text: optionValues.first ?? ""))
                .frame(height: Size.SearchBar.height)
            } else {
                // Lista suggerimenti
                List {
                    ForEach(optionValues, id: \.self) { value in
                        Button(action: {
                            searchText = value
                            isOpenOptions = false
                            isFocused = false
                            onQueryAdded?(value)
                            onTapSearch?()
                        }, label: {})
                        .buttonStyle(OptionsStyle(text: value))
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: prompterHeight)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: Size.SearchBar.cornerRadius)
                .stroke(Color.black, lineWidth: Size.SearchBar.lineWidth)
        )
        .background(Color.white)
        .cornerRadius(Size.SearchBar.cornerRadius)
    }
}
