//
// AppNavigationView.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A wrapper that hide the system navigation view and show the Sirio App Navigation view and the screen content
public struct AppNavigationView<Content: View>: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            AppNavigationContainerView(content: {
                content
            })
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        
        AppNavigationView(content: {
            Color.gray.edgesIgnoringSafeArea(.all)
                .setAppNavigationBarItems(leftItem: .previewBack,
                                       rightItems: [.previewUser, .previewSearch])
        })
    }
}


