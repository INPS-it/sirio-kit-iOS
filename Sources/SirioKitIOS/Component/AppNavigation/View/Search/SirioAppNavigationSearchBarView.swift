//
// SirioAppNavigationSearchBarView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// An app navigation with searchbar
/// - Parameters:
///   - title: The title of navigation bar
///   - placeholder: The search bar placeholder
///   - leftItem: An [AppNavigationItemData] with the content of the left item
///   - rightItems: An array of [AppNavigationItemData] with the content of the right items
///   - searchEnv: An object to manage the searchText

public struct SirioAppNavigationSearchBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var searchEnv: SirioSearchEnvironment
    @FocusState private var isTextFieldFocused: Bool
    
    private let backgroundColor: Color = Color.NewAppNavigation.Search.background
    private let borderColor: Color =  Color.NewAppNavigation.Search.border
    private let textColor: Color = Color.NewAppNavigation.Search.text
    private let iconColor: Color = Color.NewAppNavigation.Search.Item.icon
    
    private var title: String
    private var placeholder: String
    private var leftItem: SirioAppNavigationItemData?
    private var rightItems: [SirioAppNavigationItemData]?
    
    public init(title: String,
                placeholder: String,
                leftItem: SirioAppNavigationItemData? = nil,
                rightItems: [SirioAppNavigationItemData]? = nil){
        self.title = title
        self.placeholder = placeholder
        self.leftItem = leftItem
        self.rightItems = rightItems
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            NewSirioAppNavigationBarView(title: title,
                                       leftItem: leftItem,
                                       rightItems: rightItems)
            .colorScheme(.light)
            
            HStack(spacing: Size.NewAppNavigation.spacing) {
                
                ZStack(alignment: .leading) {
                    if searchEnv.text.isEmpty {
                        SirioText(text: placeholder, typography: Typography.labelMdMiddle)
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    }
                    TextField(placeholder, text: $searchEnv.text)
                        .sirioFont(typography: Typography.labelMdMiddle)
                        .foregroundColor(textColor)
                        .accentColor(textColor)
                        .lineLimit(1)
                        .focused($isTextFieldFocused)
                        .colorScheme(.light)
                        .autocorrectionDisabled()
                }
                
                Spacer()
                
                Button(action: {
                    if !searchEnv.text.isEmpty {
                        searchEnv.text = ""
                    } else {
                        isTextFieldFocused = true
                    }
                }, label: {
                    SirioIcon(data: .init(icon: searchEnv.text.isEmpty ? AwesomeIcon.search : AwesomeIcon.times))
                        .foregroundColor(iconColor)
                        .frame(width: Size.NewAppNavigation.Search.item, height: Size.NewAppNavigation.Search.item)
                })
            }
            .frame(height: 56)
            .padding(.horizontal, Size.NewAppNavigation.Search.paddingHorizontal)
            .border(borderColor, width: Size.NewAppNavigation.Search.border)
            .background(backgroundColor)
        }
    }
}

#Preview {
    SirioAppNavigationSearchBarView(title: "Titolo pagina",
                               placeholder: "Placeholder search bar",
                               leftItem: nil,
                               rightItems: [.previewBell, .previewUser])
    .environmentObject(SirioSearchEnvironment())
}
