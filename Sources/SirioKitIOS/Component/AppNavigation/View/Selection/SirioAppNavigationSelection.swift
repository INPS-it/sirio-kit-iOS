//
// SirioAppNavigationSelection.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation
import SwiftUI

/// A wrapper that hides the system navigation view and displays the Sirio App Navigation Selection view along with the screen content.
public struct SirioAppNavigationSelection<Content: View>: View {
    
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            SirioAppNavigationSelectionContainerView(content: {
                content
            })
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
