//
// SirioAppNavigationLogo.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A wrapper that hide the system navigation view and show the sirio navigation view logo and the screen content
public struct SirioAppNavigationLogo<Content: View>: View {
    
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            SirioAppNavigationLogoContainerView(content: {
                content
            })
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    SirioAppNavigationLogo {
        Color.gray.edgesIgnoringSafeArea(.all)
            .setAppNavigationBarItems(
                leftItem: .previewBack,
                rightItems: [.previewUser, .previewSearch])
    }
    .preferredColorScheme(.dark)
}
