//
// AppNavigationLogoView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A wrapper that hide the system navigation view and show the sirio navigation view logo and the screen content

public struct AppNavigationLogoView<Content: View>: View {
    
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            AppNavigationLogoContainerView(content: {
                content
            })
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AppNavigationLogoView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationLogoView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .setAppNavigationBarItems(
                    leftItem: .previewBack,
                    rightItems: [.previewUser, .previewSearch])
        }
        .preferredColorScheme(.dark)
    }
}
