//
// RegularFab.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A regular FAB
/// - Parameters:
///   - data: The data of FAB
public struct RegularFab: View {
    private var data: FabData
    
    public init(data: FabData){
        self.data = data
    }
    
    public var body: some View {
        CustomFab(data: data, size: Size.Fab.regular)
            .setAccessibilityLabel(data.accessibilityLabel)
    }
}

struct RegularFab_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegularFab(data: .init(icon: .plus, action: {}))
                .padding()
                .colorScheme(.light)
            RegularFab(data: .init(icon: .plus, action: {}))
                .padding()
                .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
