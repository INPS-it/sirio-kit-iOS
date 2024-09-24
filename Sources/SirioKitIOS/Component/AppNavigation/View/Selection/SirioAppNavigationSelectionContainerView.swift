//
// SirioAppNavigationSelectionContainerView.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Selection
public struct SirioAppNavigationSelectionContainerView<Content: View>: View {
    private let content: Content
    
    @State private var title: String = ""
    @State private var leftItem: SirioAppNavigationItemData? = nil
    @State private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            SirioAppNavigationSelectionBarView(title: title,
                                          leftItem: leftItem,
                                          rightItems: rightItems)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(
            SirioAppNavigationLeftItemPreferenceKeys.self, perform: {
                value in
                self.leftItem = value
            }
        )
        .onPreferenceChange(
            SirioAppNavigationRightItemsPreferenceKeys.self, perform: {
                value in
                self.rightItems = value
            }
        )
    }
}
