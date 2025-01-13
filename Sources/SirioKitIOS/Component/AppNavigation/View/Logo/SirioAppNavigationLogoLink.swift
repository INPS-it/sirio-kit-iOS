//
// SirioAppNavigationLogoLink.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the navigation for AppNavigationLogo
public struct SirioAppNavigationLogoLink<Label, Destination> : View where Label : View, Destination : View {
    
    private let destination: Destination
    private let label: Label
    
    public init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label){
        self.destination = destination()
        self.label = label()
    }
    
    public var body: some View {
        NavigationLink(destination: SirioAppNavigationLogoContainerView {
            destination
        }
            .navigationBarHidden(true)
                       , label: {
            label
        })
    }
}

public struct AppNavigationLogoLinkActive<Label, Destination> : View where Label : View, Destination : View {
    @Binding private var isActive: Bool
    private let destination: Destination
    private let label: Label
    
    public init(isActive: Binding<Bool>, @ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label){
        self._isActive = isActive
        self.destination = destination()
        self.label = label()
    }
    
    public var body: some View {
        NavigationLink(isActive: $isActive, destination: {
            SirioAppNavigationLogoContainerView {
                destination
            }
            .navigationBarHidden(true)
        }, label: {
            label
        })
    }
}
