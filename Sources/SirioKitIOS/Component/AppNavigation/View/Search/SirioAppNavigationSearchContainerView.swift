//
// SirioAppNavigationSearchContainerView.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Search
struct SirioAppNavigationSearchContainerView<Content: View>: View {
    let content: Content
    @EnvironmentObject private var searchEnv: SirioSearchEnvironment
    
    @State private var title: String = ""
    @State private var placeholder: String = ""
    @State private var leftItem: SirioAppNavigationItemData? = nil
    @State private var rightItems: [SirioAppNavigationItemData]? = nil
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SirioAppNavigationSearchBarView(title: title,
                                       placeholder: placeholder,
                                       leftItem: leftItem,
                                       rightItems: rightItems)
            .environmentObject(searchEnv)
            
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .onPreferenceChange(
            SirioAppNavigationTitlePreferenceKeys.self, perform: {
                value in
                self.title = value
            }
        )
        .onPreferenceChange(
            SirioAppNavigationSearchPlaceholderPreferenceKeys.self, perform: {
                value in
                self.placeholder = value
            }
        )
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
