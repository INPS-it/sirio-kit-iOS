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
    @State private var rightItems: [AppNavigationItemData]? = nil
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            AppNavigationBarView(type: type,
                                 leftItem: leftItem,
                                 title: title,
                                 rightItems: rightItems)
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
            AppNavigationRightItemsPreferenceKeys.self, perform: {
                value in
                self.rightItems = value
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
                                              rightItems: [.previewUser, .previewSearch])
            }
        })
    }
}
