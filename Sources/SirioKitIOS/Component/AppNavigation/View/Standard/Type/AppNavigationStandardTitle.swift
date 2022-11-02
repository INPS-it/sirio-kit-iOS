//
// AppNavigationStandardTitle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct AppNavigationStandardTitle: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var title: String
    private var leftItem: AppNavigationItemData? = nil
    private var rightFirstItem: AppNavigationItemData? = nil
    private var rightSecondItem: AppNavigationItemData? = nil
    
    public init(title: String,
                leftItem: AppNavigationItemData?,
                rightFirstItem: AppNavigationItemData?,
                rightSecondItem: AppNavigationItemData?){
        
        self.title = title
        self.leftItem = leftItem
        self.rightFirstItem = rightFirstItem
        self.rightSecondItem = rightSecondItem
    }
    
    public var body: some View {
        HStack(spacing: Size.AppNavigation.spacing) {
            AppNavigationItem(item: leftItem)
            
            if let _ = rightSecondItem {
                AppNavigationItemEmpty()
            }
            
            Spacer()
            
            SirioText(text: title, typography: Typography.AppNavigation.md)
                .foregroundColor(textColor)
                .lineLimit(1)
            
            Spacer()
                      
            if let rightSecondItem = rightSecondItem {
                AppNavigationItem(item: rightSecondItem)
            }
            
            AppNavigationItem(item: rightFirstItem)
            
        }
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(backgroundColor)
    }
}

struct AppNavigationStandardTitle_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            AppNavigationStandardTitle(title: "Pensami - Pensione a misura",
                                       leftItem: .previewBack,
                                       rightFirstItem: .previewUser,
                                       rightSecondItem: nil)
            .padding(.vertical)
            .colorScheme(.light)
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightFirstItem: .previewUser,
                                       rightSecondItem: .previewSearch)
            .padding(.vertical)
            .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
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
