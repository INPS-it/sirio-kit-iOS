//
// SearchBar.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

///  Search bar component
/// - Parameters:
///   - label: The optional string above the search bar
///   - helperText: The optional string below the search bar
///   - placeholder: The placeholder of the search bar
///   - searchText: The search string of the search bar
///   - optionValues: The hints based on current [searchText]
///   - queries: The list of already searched queries
///   - onTapSearch: Callback that is executed when the search button is tapped
///   - onQueryAdded: The callback invoked when the [queries] list change
public struct SearchBar: View {
    var label: String?
    var helperText: String?
    var placeholder: String
    @Binding var searchText: String
    @Binding var optionValues: [String]
    @Binding private var queries: [String]
    @FocusState private var isFocused: Bool
    private var onTapSearch: (() -> Void)?
    private var onQueryAdded: ((String) -> Void)?
    @State private var isOpenOptions: Bool = false
    
    private var prompterHeight: CGFloat {
        min(CGFloat(optionValues.count) * CGFloat(Size.SearchBar.height), Size.SearchBar.Options.maxHeight)
    }
    
    private var textColor: Color {
        if isFocused {
            return Color.SearchBar.Text.focused
        } else {
            return searchText.isEmpty ? Color.SearchBar.Text.default : Color.SearchBar.Text.valued
        }
    }
    
    private var borderColor: Color {
        if isFocused {
            return Color.SearchBar.Border.focused
        } else {
            return searchText.isEmpty ? Color.SearchBar.Border.default : Color.SearchBar.Border.valued
        }
    }
    
    public init(label: String?,
                helperText: String?,
                placeholder: String = "",
                searchText: Binding<String>,
                optionValues: Binding<[String]> = .constant([]),
                queries: Binding<[String]>,
                onTapSearch: (() -> Void)?,
                onQueryAdded: ((String) -> Void)?){
        self.label = label
        self.helperText = helperText
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
                    .foregroundColor(textColor)
            }
            
            searchBar
            
            if let helperText = helperText, !isOpenOptions {
                SirioText(text: helperText, typography: Typography.SearchBar.helper)
                    .foregroundColor(textColor)
            }
            
            if !queries.isEmpty && !isOpenOptions{
                queriesView
            }
            
            if isOpenOptions {
                optionsView
            }
            
        }.onChange(of: searchText){ newValue in
            if !newValue.isEmpty && !optionValues.isEmpty && isFocused {
                isOpenOptions = true
            } else {
                isOpenOptions = false
            }
        }
        .onChange(of: isFocused){ newValue in
            if newValue && !searchText.isEmpty && !optionValues.isEmpty {
                isOpenOptions = true
            }
        }
    }
    
    private var searchBar: some View {
        HStack(spacing: Size.SearchBar.spacingHorizontal) {
            
            ZStack(alignment: .leading) {
                if searchText.isEmpty {
                    SirioText(text: placeholder, typography: Typography.SearchBar.searchText)
                        .foregroundColor(textColor)
                        .lineLimit(1)
                }
                
                TextField("", text: $searchText)
                    .sirioFont(typography: Typography.SearchBar.searchText)
                    .foregroundColor(textColor)
                    .accentColor(textColor)
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
                .stroke(borderColor, lineWidth: Size.SearchBar.lineWidth)
        )
        .background(Color.SearchBar.Background.default)
        .cornerRadius(Size.SearchBar.cornerRadius)
    }
    
    private var queriesView: some View {
        VStack {
            FlexibleView(data: queries,
                         spacing: 0,
                         alignment: .leading) { item in
                ChipsLabelClose(text: item,
                                isDisabled: .constant(false),
                                onTapChips: nil,
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
        VStack(spacing: Size.SearchBar.Options.spacing) {
            List {
                ForEach(optionValues, id: \.self){ value in
                    
                    Button(action: {
                        isOpenOptions = false
                        addQuery(text: value)
                        self.isFocused = false
                        onQueryAdded?(value)
                    }, label: {
                        // Inside style
                    }).buttonStyle(OptionsStyle(text: value))
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .frame(height: prompterHeight)
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

struct Test: View {
    @State var searchText: String = ""
    @State var optionValues: [String] = []
    @State var queries: [String] = [] // Default is empty
    
    var body: some View {
        VStack {
            SearchBar(label: "Label",
                      helperText: "*Helper text",
                      placeholder: "Text",
                      searchText: $searchText,
                      optionValues: $optionValues,
                      queries: $queries,
                      onTapSearch: nil,
                      onQueryAdded: nil)
        }
        .padding()
        .onChange(of: searchText){ newValue in
            optionValues = []
            for i in 1...5 {
                optionValues.append("\(newValue) \(i)")
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}



