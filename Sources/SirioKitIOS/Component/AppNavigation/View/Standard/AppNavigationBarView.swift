//
// AppNavigationBarView.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A standard  app navigation
/// - Parameters:
///   - type: The type of navigation
///   - title: The title of navigation
///   - leftitem: An [AppNavigationItemData] with the content of the left item
///   - rightItems: An array of [AppNavigationItemData] with the content of the right items
public struct AppNavigationBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var type: AppNavigationType
    private var title: String
    private var leftItem: AppNavigationItemData? = nil
    private var rightItems: [AppNavigationItemData]? = nil
    
    public init(
        type: AppNavigationType,
        leftItem: AppNavigationItemData?,
        title: String,
        rightItems: [AppNavigationItemData]?){
            self.type = type
            self.title = title
            self.leftItem = leftItem
            self.rightItems = rightItems
        }
    
    public var body: some View {
        switch type {
            
        case .standard:
            AppNavigationStandardTitle(title: title,
                                       leftItem: leftItem,
                                       rightItems: rightItems)
        case .long:
            AppNavigationLongTitle(title: title,
                                   leftItem: leftItem,
                                   rightItems: rightItems)
        case .big:
            AppNavigationBigTitle(title: title,
                                  leftItem: leftItem,
                                  rightItems: rightItems)
        }
    }
}

struct AppNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightItems: [.previewUser, .previewSearch])
            .padding(.vertical)
            .colorScheme(.light)
            
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightItems: [.previewUser, .previewSearch])
            .padding(.vertical)
            .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
