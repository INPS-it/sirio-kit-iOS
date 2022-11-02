//
// CustomFab.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom FAB
/// - Parameters:
///   - data: The data of the FAB
///   - size: The size of the FAB
struct CustomFab: View {
    var data: FabData
    var size: CGFloat
    
    var body: some View {
        
        Button(action: {
            data.action?()
        }, label: {
            
        })
        .buttonStyle(FabOnlyIconStyle(data: data, size: size))
    }
}

struct CustomFab_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomFab(data: .init(icon: .plus, action: {}), size: Size.Fab.small)
                .padding()
                .colorScheme(.light)
            
            CustomFab(data: .init(icon: .plus, action: {}), size: Size.Fab.regular)
                .padding()
                .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
