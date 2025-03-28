//
// NewSirioAppNavigationBarView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A standard  app navigation
/// - Parameters:
///   - type: The type of navigation
///   - title: The title of navigation
///   - leftitem: An [AppNavigationItemData] with the content of the left item
///   - rightItems: An array of [AppNavigationItemData] with the content of the right items
public struct NewSirioAppNavigationBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var title: String
    private var leftItem: SirioAppNavigationItemData? = nil
    private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(
        title: String,
        leftItem: SirioAppNavigationItemData?,
        rightItems: [SirioAppNavigationItemData]?){
            self.title = title
            self.leftItem = leftItem
            self.rightItems = rightItems
        }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            if leftItem != nil {
                NewSirioAppNavigationItem(item: leftItem)
            }
            SirioText(text: title, typography: Typography.labelMdMiddle)
                .foregroundColor(textColor)
                .lineLimit(2)
            
            Spacer()
            
            if let rightItems = rightItems, !rightItems.isEmpty {
                ForEach(rightItems.prefix(2)) { item in
                    NewSirioAppNavigationItem(item: item)
                }
            }
        }
        .padding(.leading, leftItem == nil ? Size.NewAppNavigation.paddingHorizontal : Size.zero)
        .padding(.trailing, rightItems == nil || rightItems?.isEmpty == true ? Size.NewAppNavigation.paddingHorizontal : Size.zero)
        .frame(height: Size.NewAppNavigation.height)
        .background(backgroundColor)
    }
    
    private var backgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.NewAppNavigation.Default.Background.light
        case .dark:
            return Color.NewAppNavigation.Default.Background.dark
        @unknown default:
            return Color.NewAppNavigation.Default.Background.light
        }
    }
    
    private var textColor: Color {
        switch colorScheme {
        case .light:
            return Color.NewAppNavigation.Default.Text.light
        case .dark:
            return Color.NewAppNavigation.Default.Text.dark
        @unknown default:
            return Color.NewAppNavigation.Default.Text.light
        }
    }
}

#Preview {
    Group {
        NewSirioAppNavigationBarView(title: "Titolo pagina",
                                     leftItem: .previewBack,
                                     rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        
        NewSirioAppNavigationBarView(title: "Titolo di pagina molto lungo su due righe con sospensione del testo",
                                     leftItem: .previewBack,
                                     rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
}
