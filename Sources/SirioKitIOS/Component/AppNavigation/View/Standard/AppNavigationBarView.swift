//
// AppNavigationBarView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A standard  app navigation
/// - Parameters:
///   - type: The type of navigation
///   - title: The title of navigation
///   - leftitem: An [AppNavigationItemData] with the content of the left item
///   - rightFirstItem: An [AppNavigationItemData] with the content of the first right item
///   - rightSecondItem: An [AppNavigationItemData] with the content of the second right item


public struct AppNavigationBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var type: AppNavigationType
    private var title: String
    private var leftItem: AppNavigationItemData? = nil
    private var rightFirstItem: AppNavigationItemData? = nil
    private var rightSecondItem: AppNavigationItemData? = nil
    
    public init(
        type: AppNavigationType,
        leftItem: AppNavigationItemData?,
        title: String,
        rightFirstItem: AppNavigationItemData?,
        rightSecondItem: AppNavigationItemData?){
            self.type = type
            self.title = title
            self.leftItem = leftItem
            self.rightFirstItem = rightFirstItem
            self.rightSecondItem = rightSecondItem
        }
    
    public var body: some View {
        switch type {
            
        case .standard:
            AppNavigationStandardTitle(title: title,
                                       leftItem: leftItem,
                                       rightFirstItem: rightFirstItem,
                                       rightSecondItem: rightSecondItem)
        case .long:
            AppNavigationLongTitle(title: title,
                                   leftItem: leftItem,
                                   rightFirstItem: rightFirstItem,
                                   rightSecondItem: rightSecondItem)
        case .big:
            AppNavigationBigTitle(title: title,
                                  leftItem: leftItem,
                                  rightFirstItem: rightFirstItem,
                                  rightSecondItem: rightSecondItem)
        }
    }
}

struct AppNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightFirstItem: .previewUser,
                                       rightSecondItem: .previewSearch)
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
