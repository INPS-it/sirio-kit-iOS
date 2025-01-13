//
// SirioAppNavigationLogoContainerView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Logo

struct SirioAppNavigationLogoContainerView<Content: View>: View {
    let content: Content
    
    @State private var leftItem: SirioAppNavigationItemData? = nil
    @State private var rightItems: [SirioAppNavigationItemData]? = nil
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SirioAppNavigationLogoBarView(
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

#Preview {
    SirioAppNavigationLogoContainerView(content: {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Hello, world")
                .foregroundColor(.white)
            
        }
        .setAppNavigationBarItems(
            leftItem: .previewBack,
            rightItems: [.previewUser, .previewBell])
    })
}
