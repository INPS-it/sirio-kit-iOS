//
// SirioExtendedFab.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// An extended FAB
/// - Parameters:
///   - data: The data of the FAB
public struct SirioExtendedFab: View {
    private var data: SirioFabData
    
    public init(data: SirioFabData){
        self.data = data
    }
    
    public var body: some View {
        Button(action: {
            data.action?()
        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioFabIconLabelStyle(data: data))
        .setAccessibilityLabel(data.accessibilityLabel)
    }
}

#Preview {
    Group {
        SirioExtendedFab(data: .init(text: "Text", icon: .plus, action: nil))
        .padding()
        .colorScheme(.light)
        
        SirioExtendedFab(data: .init(text: "Text", icon: .plus, action: nil))
        .padding()
        .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
