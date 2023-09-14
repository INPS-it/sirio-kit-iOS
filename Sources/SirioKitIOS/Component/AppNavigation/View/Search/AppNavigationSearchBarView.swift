//
// AppNavigationSearchBarView.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
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

public struct AppNavigationSearchBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var searchEnv: SearchEnvironment
    @FocusState private var isTextFieldFocused: Bool
    
    private let backgroundColor: Color = Color.AppNavigation.Search.background
    private let borderColor: Color =  Color.AppNavigation.Search.border
    private let textColor: Color = Color.AppNavigation.Search.text
    private let iconColor: Color = Color.AppNavigation.Search.Item.icon
    
    private var title: String
    private var placeholder: String
    private var leftItem: AppNavigationItemData?
    private var rightItems: [AppNavigationItemData]?
    
    public init(title: String,
                placeholder: String,
                leftItem: AppNavigationItemData? = nil,
                rightItems: [AppNavigationItemData]? = nil){
        self.title = title
        self.placeholder = placeholder
        self.leftItem = leftItem
        self.rightItems = rightItems
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            AppNavigationStandardTitle(title: title,
                                       leftItem: leftItem,
                                       rightItems: rightItems)
            .colorScheme(.light)
            
            HStack(spacing: Size.AppNavigation.spacing) {
                
                ZStack(alignment: .leading) {
                    if searchEnv.text.isEmpty {
                        SirioText(text: placeholder, typography: Typography.AppNavigation.md)
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    }
                    TextField(placeholder, text: $searchEnv.text)
                        .sirioFont(typography: Typography.AppNavigation.md)
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
                        .frame(width: Size.AppNavigation.Search.item, height: Size.AppNavigation.Search.item)
                })
            }
            .frame(height: Size.AppNavigation.Search.height + 2 * Size.AppNavigation.Search.border)
            .padding(.horizontal, Size.AppNavigation.Search.paddingHorizontal)
            
            .border(borderColor, width: Size.AppNavigation.Search.border)
            .background(backgroundColor)
            
        }
    }
}

struct AppNavigationSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppNavigationSearchBarView(title: "",
                                       placeholder: "Placeholder search bar",
                                       leftItem: nil,
                                       rightItems: [.previewBell, .previewUser])
            .environmentObject(SearchEnvironment())
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
