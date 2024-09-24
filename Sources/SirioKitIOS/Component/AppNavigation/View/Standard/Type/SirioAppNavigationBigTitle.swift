//
// SirioAppNavigationBigTitle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioAppNavigationBigTitle: View {
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
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: Size.AppNavigation.spacing) {
                SirioAppNavigationItem(item: leftItem)
                
                Spacer()
                
                if let rightItems = rightItems {
                    ForEach(rightItems.prefix(2)) { item in
                        SirioAppNavigationItem(item: item)
                    }
                }
            }
            .frame(height: Size.AppNavigation.BigTitle.height)
            .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
            
            SirioText(text: title, typography: Typography.AppNavigation.xl)
                .lineLimit(1)
                .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
                .frame(height: Size.AppNavigation.BigTitle.textHeight)
                .foregroundColor(textColor)
        }
        .background(backgroundColor)
    }
}

extension SirioAppNavigationBigTitle {
    
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
        SirioAppNavigationBigTitle(title: "Titolo grande",
                              leftItem: .previewBack,
                              rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        SirioAppNavigationBigTitle(title: "Titolo grande",
                              leftItem: .previewBack,
                              rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}