//
// AppNavigationContainerView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation

public struct AppNavigationContainerView<Content: View>: View {
    private let content: Content
    
    @State private var type: AppNavigationType = .standard // Standard is default type
    @State private var title: String = ""
    @State private var leftItem: AppNavigationItemData? = nil
    @State private var rightFirstItem: AppNavigationItemData? = nil
    @State private var rightSecondItem: AppNavigationItemData? = nil
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            AppNavigationBarView(type: type,
                                 leftItem: leftItem,
                                 title: title,
                                 rightFirstItem: rightFirstItem,
                                 rightSecondItem: rightSecondItem)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(
            AppNavigationTypePreferenceKeys.self, perform: {
                value in
                self.type = value
            }
        )
        .onPreferenceChange(
            AppNavigationTitlePreferenceKeys.self, perform: {
                value in
                self.title = value
            }
        )
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

struct AppNavigationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationContainerView(content: {
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                Text("Hello, world")
                    .foregroundColor(.white)
                    .setAppNavigationBarItems(leftItem: .previewBack,
                                        rightFirstItem: .previewUser,
                                        rightSecondItem: .previewSearch)
            }
        })
    }
}
