//
// AppNavigationLink.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the navigation for AppNavigation component
public struct AppNavigationLink<Label, Destination> : View where Label : View, Destination : View {
    private let destination: Destination
    private let label: Label
    
    public init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label){
        self.destination = destination()
        self.label = label()
    }
    
    public var body: some View {
        NavigationLink(destination: {
            AppNavigationContainerView {
                destination
            }
            .navigationBarHidden(true)
        }, label: {
            label
        })
    }
}

public struct AppNavigationLinkActive<Label, Destination> : View where Label : View, Destination : View {
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
            AppNavigationContainerView {
                destination
            }
            .navigationBarHidden(true)
        }, label: {
            label
        })
    }
}
