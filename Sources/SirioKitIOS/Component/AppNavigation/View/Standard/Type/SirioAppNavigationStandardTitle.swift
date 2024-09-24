//
// SirioAppNavigationStandardTitle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioAppNavigationStandardTitle: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var title: String
    private var leftItem: SirioAppNavigationItemData? = nil
    private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(title: String,
                leftItem: SirioAppNavigationItemData?,
                rightItems: [SirioAppNavigationItemData]?){
        
        self.title = title
        self.leftItem = leftItem
        self.rightItems = rightItems
    }
    
    public var body: some View {
        HStack(spacing: Size.AppNavigation.spacing) {
            SirioAppNavigationItem(item: leftItem)
            
            if let rightItems = rightItems, rightItems.count >= 2 {
                SirioAppNavigationItemEmpty()
            }
            
            Spacer()
            
            SirioText(text: title, typography: Typography.AppNavigation.md)
                .foregroundColor(textColor)
                .lineLimit(1)
            
            Spacer()
                 
            if let rightItems = rightItems, !rightItems.isEmpty {
                ForEach(rightItems.prefix(2)) { item in
                    SirioAppNavigationItem(item: item)
                }
            } else {
                SirioAppNavigationItemEmpty()
            }
        }
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(backgroundColor)
    }
}

extension SirioAppNavigationStandardTitle {
    
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
        SirioAppNavigationStandardTitle(title: "Titolo pagina",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        
        SirioAppNavigationStandardTitle(title: "Titolo pagina",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
