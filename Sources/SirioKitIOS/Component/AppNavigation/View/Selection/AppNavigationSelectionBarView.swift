//
// AppNavigationSelectionBarView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A scope control app navigation
/// - Parameters:
///   - title: The title of navigation
///   - leftitem: An [AppNavigationItemData] with the content of the left item
///   - rightFirstItem: An [AppNavigationItemData] with the content of the first right item
///   - rightSecondItem: An [AppNavigationItemData] with the content of the second right item

public struct AppNavigationSelectionBarView: View {
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
                .colorScheme(colorScheme == .dark ? .light : .dark)
            
            SirioText(text: title, typography: Typography.AppNavigation.md)
                .foregroundColor(textColor)
                .lineLimit(1)
            
            Spacer()

            AppNavigationItem(item: rightSecondItem)
                .colorScheme(colorScheme == .dark ? .light : .dark)
            
            AppNavigationItem(item: rightFirstItem)
                .colorScheme(colorScheme == .dark ? .light : .dark)

        }
        
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(appNavigationColor)
    }
}

struct AppNavigationSelectionBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            AppNavigationSelectionBarView(title: "1 Elemento",
                                        leftItem: .previewBack,
                                        rightFirstItem: .previewUser,
                                        rightSecondItem: .previewBell)
            .padding(.vertical)
            .colorScheme(.light)
            AppNavigationSelectionBarView(title: "1 Elemento",
                                        leftItem: .previewBack,
                                        rightFirstItem: .previewUser,
                                        rightSecondItem: .previewSearch)
            .padding(.vertical)
            .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}

extension AppNavigationSelectionBarView {
    
    private var appNavigationColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Selection.Background.light
        case .dark:
            return Color.AppNavigation.Selection.Background.dark
        @unknown default:
            return Color.AppNavigation.Selection.Background.light
        }
    }
    
    private var textColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Selection.Text.light
        case .dark:
            return Color.AppNavigation.Selection.Text.dark
        @unknown default:
            return Color.AppNavigation.Selection.Text.light
        }
    }
}
