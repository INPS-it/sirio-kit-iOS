//
// AppNavigationSelectionContainerView.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Selection
public struct AppNavigationSelectionContainerView<Content: View>: View {
    private let content: Content
    
    @State private var title: String = ""
    @State private var leftItem: AppNavigationItemData? = nil
    @State private var rightItems: [AppNavigationItemData]? = nil
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            AppNavigationSelectionBarView(title: title,
                                          leftItem: leftItem,
                                          rightItems: rightItems)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(
            AppNavigationLeftItemPreferenceKeys.self, perform: {
                value in
                self.leftItem = value
            }
        )
        .onPreferenceChange(
            AppNavigationRightItemsPreferenceKeys.self, perform: {
                value in
                self.rightItems = value
            }
        )
    }
}
