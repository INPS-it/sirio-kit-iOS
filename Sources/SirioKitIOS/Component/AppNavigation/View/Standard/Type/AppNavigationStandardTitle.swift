//
// AppNavigationStandardTitle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct AppNavigationStandardTitle: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var title: String
    private var leftItem: AppNavigationItemData? = nil
    private var rightItems: [AppNavigationItemData]? = nil
    
    public init(title: String,
                leftItem: AppNavigationItemData?,
                rightItems: [AppNavigationItemData]?){
        
        self.title = title
        self.leftItem = leftItem
        self.rightItems = rightItems
    }
    
    public var body: some View {
        HStack(spacing: Size.AppNavigation.spacing) {
            AppNavigationItem(item: leftItem)
            
            if let rightItems = rightItems, rightItems.count >= 2 {
                AppNavigationItemEmpty()
            }
            
            Spacer()
            
            SirioText(text: title, typography: Typography.AppNavigation.md)
                .foregroundColor(textColor)
                .lineLimit(1)
            
            Spacer()
                 
            if let rightItems = rightItems, !rightItems.isEmpty {
                ForEach(rightItems.prefix(2)) { item in
                    AppNavigationItem(item: item)
                }
            } else {
                AppNavigationItemEmpty()
            }
        }
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(backgroundColor)
    }
}

extension AppNavigationStandardTitle {
    
    private var backgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Background.light
        case .dark:
            return Color.AppNavigation.Default.Background.dark
        @unknown default:
            return Color.AppNavigation.Default.Background.light
        }
    }
    
    private var textColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Text.light
        case .dark:
            return Color.AppNavigation.Default.Text.dark
        @unknown default:
            return Color.AppNavigation.Default.Text.light
        }
    }
}

#Preview {
    Group {
        AppNavigationStandardTitle(title: "Titolo pagina",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        
        AppNavigationStandardTitle(title: "Titolo pagina",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
