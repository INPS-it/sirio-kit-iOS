//
// AppNavigationLogoBarView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A standard app navigation with INPS logo at the center
/// - Parameters:
///   - leftItem: An [AppNavigationItemData] with the content of the left item
///   - rightFirstItem: An [AppNavigationItemData] with the content of the first right item
///   - rightSecondItem: An [AppNavigationItemData] with the content of the second right item

public struct AppNavigationLogoBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var leftItem: AppNavigationItemData? = nil
    private var rightFirstItem: AppNavigationItemData? = nil
    private var rightSecondItem: AppNavigationItemData? = nil
    
    public init(leftItem: AppNavigationItemData?,
                rightFirstItem: AppNavigationItemData?,
                rightSecondItem: AppNavigationItemData?){
        
        self.leftItem = leftItem
        self.rightFirstItem = rightFirstItem
        self.rightSecondItem = rightSecondItem
    }
    
    public var body: some View {
        HStack(spacing: Size.AppNavigation.spacing) {
            AppNavigationItem(item: leftItem)
            
            Spacer()
                        
            AppNavigationItem(item: rightSecondItem)
            
            AppNavigationItem(item: rightFirstItem)
        }
        .frame(height: Size.AppNavigation.height)
        .padding(.horizontal, Size.AppNavigation.paddingHorizontal)
        .background(appNavigationBackgroundColor)
        .overlay(AppNavigationLogoInps(), alignment: .center)
    }
}

struct AppNavigationLogoBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppNavigationLogoBarView(leftItem: .previewBack,
                                     rightFirstItem: .previewUser,
                                     rightSecondItem: .previewSearch)
            .padding(.vertical)
            .colorScheme(.light)
            AppNavigationLogoBarView(leftItem: .previewBack,
                                     rightFirstItem: .previewUser,
                                     rightSecondItem: .previewSearch)
            .padding(.vertical)
            .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
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
