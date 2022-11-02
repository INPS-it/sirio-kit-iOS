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
    @State private var rightFirstItem: AppNavigationItemData? = nil
    @State private var rightSecondItem: AppNavigationItemData? = nil
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AppNavigationLogoBarView(
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
                rightFirstItem: .previewUser,
                rightSecondItem: .previewSearch)
        })
    }
}
