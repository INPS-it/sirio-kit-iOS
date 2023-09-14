//
// AppNavigationSearchContainerView.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Search
struct AppNavigationSearchContainerView<Content: View>: View {
    let content: Content
    @EnvironmentObject private var searchEnv: SearchEnvironment
    
    @State private var title: String = ""
    @State private var placeholder: String = ""
    @State private var leftItem: AppNavigationItemData? = nil
    @State private var rightItems: [AppNavigationItemData]? = nil
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AppNavigationSearchBarView(title: title,
                                       placeholder: placeholder,
                                       leftItem: leftItem,
                                       rightItems: rightItems)
            .environmentObject(searchEnv)
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .onPreferenceChange(
            AppNavigationTitlePreferenceKeys.self, perform: {
                value in
                self.title = value
            }
        )
        .onPreferenceChange(
            AppNavigationSearchPlaceholderPreferenceKeys.self, perform: {
                value in
                self.placeholder = value
            }
        )
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
