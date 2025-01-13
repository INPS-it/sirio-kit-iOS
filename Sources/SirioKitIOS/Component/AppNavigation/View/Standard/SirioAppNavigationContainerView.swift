//
// SirioAppNavigationContainerView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A container for Sirio App Navigation

public struct SirioAppNavigationContainerView<Content: View>: View {
    private let content: Content
    
    @State private var type: SirioAppNavigationType = .standard // Standard is default type
    @State private var title: String = ""
    @State private var leftItem: SirioAppNavigationItemData? = nil
    @State private var rightItems: [SirioAppNavigationItemData]? = nil
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            SirioAppNavigationBarView(type: type,
                                 leftItem: leftItem,
                                 title: title,
                                 rightItems: rightItems)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(
            SirioAppNavigationTypePreferenceKeys.self, perform: {
                value in
                self.type = value
            }
        )
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
    SirioAppNavigationContainerView(content: {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Hello, world")
                .foregroundColor(.white)
                .setAppNavigationBarItems(leftItem: .previewBack,
                                          rightItems: [.previewUser, .previewSearch])
        }
    })
}
