//
// SirioAppNavigationSearch.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A wrapper that hide the system navigation view and show the Sirio App Navigation Search view and the screen content

public struct SirioAppNavigationSearch<Content: View>: View {
    @EnvironmentObject private var searchEnv: SirioSearchEnvironment

    private let content: Content
    
    public init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            SirioAppNavigationSearchContainerView(content: {
                content
            })
            .navigationBarHidden(true)
            .environmentObject(searchEnv)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
