//
// SirioAppNavigationLogoBarView.swift
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

public struct SirioAppNavigationLogoBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var leftItem: SirioAppNavigationItemData? = nil
    private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(leftItem: SirioAppNavigationItemData?,
                rightItems: [SirioAppNavigationItemData]?){
        self.leftItem = leftItem
        self.rightItems = rightItems
    }
    
    public var body: some View {
        HStack(spacing: Size.AppNavigation.spacing) {
            SirioAppNavigationItem(item: leftItem)
            
            Spacer()
                        
            if let rightItems = rightItems {
                ForEach(rightItems.prefix(2)) { item in
                    SirioAppNavigationItem(item: item)
                }
            }
        }
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(appNavigationBackgroundColor)
        .overlay(SirioAppNavigationLogoInps(), alignment: .center)
    }
}

extension SirioAppNavigationLogoBarView {
    
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
        SirioAppNavigationLogoBarView(leftItem: .previewBack,
                                 rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        SirioAppNavigationLogoBarView(leftItem: .previewBack,
                                 rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
