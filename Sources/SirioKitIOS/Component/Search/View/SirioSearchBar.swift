//
// SirioSearchBar.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A  customizable search bar component.
///
/// `SirioSearchBarL` provides a simple search field with:
/// - A placeholder text.
/// - Built-in focus handling.
/// - An optional search button callback.
///
/// It is designed to be embedded inside more complex search views or used
/// as a standalone search input.
///
/// - Parameters:
///   - placeholder: The text displayed when the search field is empty.
///   - searchText: A binding to the current search text entered by the user.
///
/// Internal state:
/// - `isFocused`: Tracks whether the search field is currently focused.

public struct SirioSearchBar: View {
    var placeholder: String
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    
    
    public init(placeholder: String = "",
                searchText: Binding<String>){
        self.placeholder = placeholder
        self._searchText = searchText
    }
    
    public var body: some View {
        VStack(spacing: Size.zero){
            HStack(spacing: Size.SearchBar.spacingHorizontal) {
                
                ZStack(alignment: .leading) {
                    if searchText.isEmpty {
                        SirioText(text: placeholder, typography: Typography.labelMdRegular)
                            .foregroundColor(Color.aliasTextColorDisabled)
                            .lineLimit(1)
                    }
                    
                    TextField("", text: $searchText)
                        .sirioFont(typography: Typography.SearchBar.searchText)
                        .foregroundColor(Color.aliasTextColorDisabled)
                        .lineLimit(1)
                        .disableAutocorrection(true)
                        .submitLabel(.search)
                }
                
                Spacer()
                
                if searchText.isEmpty {
                    Button(action: {
                        DispatchQueue.main.async {
                            searchText = ""
                        }
                    }, label: {
                        SirioIcon(data: .init(icon: .search))
                            .foregroundColor(Color.aliasTextColorSecondaryDark100)
                            .frame(width: 16, height: 16)
                    })
                    .padding(Size.p16)
                } else {
                    Button(action: {
                        DispatchQueue.main.async {
                            searchText = ""
                        }
                    }, label: {
                        SirioIcon(data: .init(icon: .times))
                            .foregroundColor(Color.aliasInteractivePrimaryDefault)
                            .frame(width: 16, height: 16)
                    })
                    .padding(Size.p16)
                }
            }
            .frame(height: 48)
            .padding(.leading, Size.p16)
            .overlay(
                RoundedRectangle(cornerRadius: Size.SearchBar.cornerRadius)
                    .stroke(borderColor, lineWidth: Size.SearchBar.lineWidth)
            )
            .cornerRadius(Size.SearchBar.cornerRadius)
        }
        .padding(Size.p16)
        .frame(height: 80)
        .background(Color.SearchBar.Background.default)
    }
    
    private var borderColor: Color {
        return searchText.isEmpty ? Color.SearchBar.Border.default : Color.SearchBar.Border.valued
    }
}
