//
// SmallFab.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A small FAB
/// - Parameters:
///   - data: The data of FAB
public struct SmallFab: View {
    private var data: FabData
    
    public init(data: FabData){
        self.data = data
    }
    
    public var body: some View {
        CustomFab(data: data, size: Size.Fab.small)
            .setAccessibilityLabel(data.accessibilityLabel)
    }
}

struct SmallFab_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SmallFab(data: .init(icon: .plus, action: {}))
                .padding()
                .colorScheme(.light)
            
            SmallFab(data: .init(icon: .plus, action: {}))
                .padding()
                .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
