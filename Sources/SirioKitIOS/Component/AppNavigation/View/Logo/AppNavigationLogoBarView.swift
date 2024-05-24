//
// AppNavigationLogoBarView.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A standard app navigation with INPS logo at the center
/// - Parameters:
///   - leftItem: An [AppNavigationItemData] with the content of the left item
///   - rightItems: An array of [AppNavigationItemData] with the content of the right items

public struct AppNavigationLogoBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var leftItem: AppNavigationItemData? = nil
    private var rightItems: [AppNavigationItemData]? = nil
    
    public init(leftItem: AppNavigationItemData?,
                rightItems: [AppNavigationItemData]?){
        self.leftItem = leftItem
        self.rightItems = rightItems
    }
    
    public var body: some View {
        HStack(spacing: Size.AppNavigation.spacing) {
            AppNavigationItem(item: leftItem)
            
            Spacer()
                        
            if let rightItems = rightItems {
                ForEach(rightItems.prefix(2)) { item in
                    AppNavigationItem(item: item)
                }
            }
        }
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(appNavigationBackgroundColor)
        .overlay(AppNavigationLogoInps(), alignment: .center)
    }
}

extension AppNavigationLogoBarView {
    
    private var appNavigationBackgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Background.light
        case .dark:
            return Color.AppNavigation.Default.Background.dark
        @unknown default:
            return Color.AppNavigation.Default.Background.light
        }
    }
    
    private var appNavigationtextColor: Color {
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
        AppNavigationLogoBarView(leftItem: .previewBack,
                                 rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        AppNavigationLogoBarView(leftItem: .previewBack,
                                 rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
