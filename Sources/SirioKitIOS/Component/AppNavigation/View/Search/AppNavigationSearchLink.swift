//
// AppNavigationSearchLink.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A struct to manage navigation for Sirio App Navigation Search
///
public struct AppNavigationSearchLink<Label, Destination> : View where Label : View, Destination : View {
    
    private let destination: Destination
    private let label: Label
    
    public init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label){
        self.destination = destination()
        self.label = label()
    }

    public var body: some View {
        NavigationLink(destination: {
            AppNavigationSearchContainerView {
                destination
            }
            .navigationBarHidden(true)
        }, label: {
            label
        })
    }
}

public struct AppNavigationSearchLinkActive<Label, Destination> : View where Label : View, Destination : View {
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
            AppNavigationSearchContainerView {
                destination
            }
            .navigationBarHidden(true)
        }, label: {
            label
        })
    }
}
