//
// SirioRegularFab.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A regular FAB
/// - Parameters:
///   - data: The data of FAB
public struct SirioRegularFab: View {
    private var data: SirioFabData
    
    public init(data: SirioFabData){
        self.data = data
    }
    
    public var body: some View {
        CustomFab(data: data, size: Size.Fab.regular)
            .setAccessibilityLabel(data.accessibilityLabel)
    }
}

#Preview {
    Group {
        SirioRegularFab(data: .init(icon: .plus, action: {}))
            .padding()
            .colorScheme(.light)
        SirioRegularFab(data: .init(icon: .plus, action: {}))
            .padding()
            .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
