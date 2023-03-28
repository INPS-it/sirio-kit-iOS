//
// ExtendedFab.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// An extended FAB
/// - Parameters:
///   - data: The data of the FAB
public struct ExtendedFab: View {
    private var data: FabData
    
    public init(data: FabData){
        self.data = data
    }
    
    public var body: some View {
        Button(action: {
            data.action?()
        }, label: {
            // Inside Style
        })
        .buttonStyle(FabIconLabelStyle(data: data))
        .setAccessibilityLabel(data.accessibilityLabel)
    }
}

struct ExtendedFab_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            ExtendedFab(data: .init(text: "Text", icon: .plus, action: nil))
            .padding()
            .colorScheme(.light)
            ExtendedFab(data: .init(text: "Text", icon: .plus, action: nil))
            .padding()
            .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
