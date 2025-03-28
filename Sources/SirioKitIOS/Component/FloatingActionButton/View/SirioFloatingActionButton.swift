//
//  SirioFloatingActionButton.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom Floating Action Button (FAB) component.
///
/// - Parameters:
///   - data: An instance of `SirioFloatingActionButtonData` containing the icon, size, action, and other properties for configuring the FAB.

public struct SirioFloatingActionButton: View {
    var data: SirioFloatingActionButtonData
    
    public init(data: SirioFloatingActionButtonData) {
        self.data = data
    }
    
    public var body: some View {
        Button(action: {
            data.action?()
        }, label: {
            // Nothing
        })
        .buttonStyle(SirioFloatingActionButtonStyle(data: data))
    }
}

#Preview() {
    VStack {
        HStack {
            SirioFloatingActionButton(data: .init(icon: .plus, size: .small, action: {
                
            }))
            .colorScheme(.light)
            SirioFloatingActionButton(data: .init(icon: .plus, size: .small, action: {
                
            }))
            .colorScheme(.dark)
        }
        
        HStack {
            SirioFloatingActionButton(data: .init(icon: .plus, size: .regular, action: {
                
            }))
            .colorScheme(.light)

            SirioFloatingActionButton(data: .init(icon: .plus, size: .regular, action: {
                
            }))
            .colorScheme(.dark)
        }
        
        HStack {
            SirioFloatingActionButton(data: .init(text: "Text", icon: .plus, action: {
                
            }))
            .colorScheme(.light)
            SirioFloatingActionButton(data: .init(text: "Text", icon: .plus, action: {
                
            }))
            .colorScheme(.dark)
        }
    }
}
