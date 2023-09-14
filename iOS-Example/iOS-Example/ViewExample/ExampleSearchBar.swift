//
// ExampleSearchBar.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleSearchBar: View {
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
            Spacer()
        }
        .padding()
        .onChange(of: searchText){ newValue in
            optionValues = []
            for i in 1...5 {
                optionValues.append("\(newValue) \(i)")
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("Search Bar")
    }
}

struct ExampleSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ExampleSearchBar()
    }
}
