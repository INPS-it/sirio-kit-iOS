//
// SirioAppNavigationSelectionBarView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A scope control app navigation
/// - Parameters:
///   - title: The title of navigation
///   - leftitem: An [AppNavigationItemData] with the content of the left item
///   - rightItems: An array of [AppNavigationItemData] with the content of the right items

public struct SirioAppNavigationSelectionBarView: View {
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
                .colorScheme(colorScheme == .dark ? .light : .dark)
            
            SirioText(text: title, typography: Typography.AppNavigation.md)
                .foregroundColor(textColor)
                .lineLimit(1)
            
            Spacer()

            if let rightItems = rightItems {
                ForEach(rightItems.prefix(2)) { item in
                    SirioAppNavigationItem(item: item)
                        .colorScheme(colorScheme == .dark ? .light : .dark)
                }
            }
        }
        
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(appNavigationColor)
    }
}

extension SirioAppNavigationSelectionBarView {
    
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

#Preview {
    Group {
        SirioAppNavigationSelectionBarView(title: "1 Elemento",
                                    leftItem: .previewBack,
                                    rightItems: [.previewUser, .previewBell])
        .padding(.vertical)
        .colorScheme(.light)
        SirioAppNavigationSelectionBarView(title: "1 Elemento",
                                    leftItem: .previewBack,
                                    rightItems: [.previewUser, .previewBell])

        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
