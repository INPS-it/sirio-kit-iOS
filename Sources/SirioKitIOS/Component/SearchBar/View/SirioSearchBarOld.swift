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
public struct SirioSearchBarOld: View {
    var label: String?
    var placeholder: String
    @Binding var searchText: String
    @Binding var optionValues: [String]
    @Binding private var queries: [String]
    @FocusState private var isFocused: Bool
    private var onTapSearch: (() -> Void)?
    private var onQueryAdded: ((String) -> Void)?
    @State private var isOpenOptions: Bool = false
    
    private var prompterHeight: CGFloat {
        if optionValues.isEmpty {
            // Altezza minima quando non ci sono suggerimenti
            return CGFloat(Size.SearchBar.height)
        } else {
            return min(CGFloat(optionValues.count) * CGFloat(Size.SearchBar.height),
                       Size.SearchBar.Options.maxHeight)
        }
    }
    
//    private var textColor: Color {
//        if isFocused {
//            return Color.SearchBar.Text.focused
//        } else {
//            return searchText.isEmpty ? Color.SearchBar.Text.default : Color.SearchBar.Text.valued
//        }
//    }
//    
//    private var borderColor: Color {
//        if isFocused {
//            return Color.SearchBar.Border.focused
//        } else {
//            return searchText.isEmpty ? Color.SearchBar.Border.default : Color.SearchBar.Border.valued
//        }
//    }
    
    public init(label: String?,
                placeholder: String = "",
                searchText: Binding<String>,
                optionValues: Binding<[String]> = .constant([]),
                queries: Binding<[String]>,
                onTapSearch: (() -> Void)?,
                onQueryAdded: ((String) -> Void)?){
        self.label = label
        self.placeholder = placeholder
        self._searchText = searchText
        self._optionValues = optionValues
        self._queries = queries
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
            
            if !queries.isEmpty && !isOpenOptions{
                queriesView
            }
            
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
                    DispatchQueue.main.async {
                        searchText = ""
                    }
                }, label: {
                    SirioIcon(data: .init(icon: .times))
                        .foregroundColor(Color.SearchBar.Button.Icon.clear)
                        .frame(width: Size.SearchBar.Icon.frame, height: Size.SearchBar.Icon.frame)
                })
            }
            
            Button(action: {
                if !searchText.isEmpty {
                    isOpenOptions = false
                    addQuery(text: searchText)
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
    
    private var queriesView: some View {
        VStack {
            FlexibleView(data: queries,
                         spacing: Size.zero,
                         alignment: .leading) { item in
                SirioChips(text: item,
                           iconData: nil,
                           isDisabled: .constant(false),
                           onTapClose: {
                    if let index = queries.firstIndex(of: item){
                        // Remove current item
                        self.queries.remove(at: index)
                    }
                })
                .padding(Size.SearchBar.Chips.padding)
            }
        }
    }
    
    private var optionsView: some View {
        VStack(spacing: Size.zero) {
            if optionValues.isEmpty && !searchText.isEmpty {
                // 🔹 Empty state con lo stesso stile, ma non cliccabile
                Button(action: {}, label: {})
                    .buttonStyle(OptionsStyle(text: "Nessun suggerimento per “\(searchText)”"))
                    .disabled(true)
                    .frame(height: Size.SearchBar.height)
            } else if optionValues.count == 1 {
                // 🔹 Un solo suggerimento → bottone singolo, fuori dalla List
                Button(action: {
                    isOpenOptions = false
                    addQuery(text: optionValues.first ?? "")
                    self.isFocused = false
                    onQueryAdded?(optionValues.first ?? "")
                }, label: {})
                .buttonStyle(OptionsStyle(text: optionValues.first ?? ""))
                .frame(height: Size.SearchBar.height)
            } else {
                // 🔹 Più suggerimenti → usa la List
                List {
                    ForEach(optionValues, id: \.self) { value in
                        Button(action: {
                            isOpenOptions = false
                            addQuery(text: value)
                            self.isFocused = false
                            onQueryAdded?(value)
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
    
    private func addQuery(text: String){
        if !queries.contains(text){
            queries.append(text)
        }
    }
}

struct SearchBarTestViewOld: View {
    @State var searchText: String = ""
    @State var optionValues: [String] = []
    @State var queries: [String] = [] // Default is empty
    
    var body: some View {
        VStack {
            SirioSearchBarOld(label: "Label",
                      placeholder: "Inserisci il testo",
                      searchText: $searchText,
                      optionValues: $optionValues,
                      queries: $queries,
                      onTapSearch: nil,
                      onQueryAdded: nil)
            Spacer()
        }
        .padding()
        .onChange(of: searchText){ newValue in
            optionValues = []
            for i in 1...5 {
                optionValues.append("\(newValue) #\(i)")
            }
            
            if (searchText == "Ciao"){
                optionValues = []
            }
        }
    }
}

#Preview {
    SearchBarTestViewOld()
}
