//
// AppNavigationSelectionContainerView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Selection


struct AppNavigationSelectionContainerView<Content: View>: View {
    private let content: Content
   
    @State private var title: String = ""
    @State private var leftItem: AppNavigationItemData? = nil
    @State private var rightFirstItem: AppNavigationItemData? = nil
    @State private var rightSecondItem: AppNavigationItemData? = nil

    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AppNavigationSelectionBarView(title: title,
                                        leftItem: leftItem,
                                        rightFirstItem: rightFirstItem,
                                        rightSecondItem: rightSecondItem)
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
            AppNavigationRightFirstItemPreferenceKeys.self, perform: {
                value in
                self.rightFirstItem = value
            }
        )
        .onPreferenceChange(
            AppNavigationRightSecondItemPreferenceKeys.self, perform: {
                value in
                self.rightSecondItem = value
            }
        )
    }
}
