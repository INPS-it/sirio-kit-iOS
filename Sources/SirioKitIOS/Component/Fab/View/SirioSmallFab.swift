//
// SirioSmallFab.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A small FAB
/// - Parameters:
///   - data: The data of FAB
public struct SirioSmallFab: View {
    private var data: SirioFabData
    
    public init(data: SirioFabData){
        self.data = data
    }
    
    public var body: some View {
        CustomFab(data: data, size: Size.Fab.small)
            .setAccessibilityLabel(data.accessibilityLabel)
    }
}

#Preview {
    Group {
        SirioSmallFab(data: .init(icon: .plus, action: {}))
            .padding()
            .colorScheme(.light)
        
        SirioSmallFab(data: .init(icon: .plus, action: {}))
            .padding()
            .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
