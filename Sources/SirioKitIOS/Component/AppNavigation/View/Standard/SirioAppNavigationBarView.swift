//
// SirioAppNavigationBarView.swift
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
public struct SirioAppNavigationBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var type: SirioAppNavigationType
    private var title: String
    private var leftItem: SirioAppNavigationItemData? = nil
    private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(
        type: SirioAppNavigationType,
        leftItem: SirioAppNavigationItemData?,
        title: String,
        rightItems: [SirioAppNavigationItemData]?){
            self.type = type
            self.title = title
            self.leftItem = leftItem
            self.rightItems = rightItems
        }
    
    public var body: some View {
        switch type {
            
        case .standard:
            SirioAppNavigationStandardTitle(title: title,
                                       leftItem: leftItem,
                                       rightItems: rightItems)
        case .long:
            SirioAppNavigationLongTitle(title: title,
                                   leftItem: leftItem,
                                   rightItems: rightItems)
        case .big:
            SirioAppNavigationBigTitle(title: title,
                                  leftItem: leftItem,
                                  rightItems: rightItems)
        }
    }
}

#Preview {
    Group {
        SirioAppNavigationStandardTitle(title: "Titolo pagina",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.light)
        
        SirioAppNavigationStandardTitle(title: "Titolo pagina",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewSearch])
        .padding(.vertical)
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
