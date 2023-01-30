//
// AppNavigationLogoContainerView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation Logo

struct AppNavigationLogoContainerView<Content: View>: View {
    let content: Content
    
    @State private var leftItem: AppNavigationItemData? = nil
    @State private var rightItems: [AppNavigationItemData]? = nil
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AppNavigationLogoBarView(
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

struct AppNavigationLogoContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationLogoContainerView(content: {
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
}
