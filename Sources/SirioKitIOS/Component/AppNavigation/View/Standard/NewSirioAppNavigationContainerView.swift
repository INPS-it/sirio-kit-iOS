//
// NewSirioAppNavigationContainerView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation

public struct NewSirioAppNavigationContainerView<Content: View>: View {
    private let content: Content
    @State private var title: String = ""
    @State private var leftItem: SirioAppNavigationItemData? = nil
    @State private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            NewSirioAppNavigationBarView(title: title,
                                         leftItem: leftItem,
                                         rightItems: rightItems)
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
    NewSirioAppNavigationContainerView(content: {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Hello, world")
                .foregroundColor(.white)
                .setAppNavigationBarItems(leftItem: .previewBack,
                                          rightItems: [.previewUser, .previewSearch])
        }
    })
}
