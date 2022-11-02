//
// AppNavigationSelectionView.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation
import SwiftUI

/// A wrapper that hide the system navigation view and show the Sirio App Navigation Selection view and the screen content

struct AppNavigationSelectionView<Content: View>: View {
    
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            AppNavigationSelectionContainerView(content: {
                content
            })
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
