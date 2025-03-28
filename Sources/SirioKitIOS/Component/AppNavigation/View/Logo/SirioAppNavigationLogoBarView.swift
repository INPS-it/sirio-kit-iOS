//
// SirioAppNavigationLogoBarView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
        HStack(spacing: Size.zero) {
            NewSirioAppNavigationItem(item: leftItem)
            
            Spacer()
                        
            if let rightItems = rightItems {
                ForEach(rightItems.prefix(2)) { item in
                    NewSirioAppNavigationItem(item: item)
                }
            }
        }
        .frame(height: Size.NewAppNavigation.height)
        .background(appNavigationBackgroundColor)
        .overlay(SirioAppNavigationLogoInps(), alignment: .center)
    }
}

extension SirioAppNavigationLogoBarView {
    
    private var appNavigationBackgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.NewAppNavigation.Default.Background.light
        case .dark:
            return Color.NewAppNavigation.Default.Background.dark
        @unknown default:
            return Color.NewAppNavigation.Default.Background.light
        }
    }
    
    private var appNavigationtextColor: Color {
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
    VStack {
        SirioAppNavigationLogoBarView(leftItem: .previewBack,
                                 rightItems: [.previewUser, .previewSearch])
        .colorScheme(.light)
        
        SirioAppNavigationLogoBarView(leftItem: .previewBack,
                                 rightItems: [.previewUser, .previewSearch])
        .colorScheme(.dark)
    }
}
