//
// SirioAppNavigationItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an app navigation item
/// - Parameters:
///   - item: The content of the component - AppNavigationItemData
struct SirioAppNavigationItem: View {
    @Environment(\.colorScheme) var colorScheme
    private var item: SirioAppNavigationItemData?
    
    init(item: SirioAppNavigationItemData?){
        self.item = item
    }
    
    var body: some View {
        Button(action: {
            item?.action()
        }, label: {
            
        })
        .buttonStyle(SirioAppNavigationItemStyle(item: item))
        .setAccessibilityLabel(item?.accessibilityLabel)
        .accessibilityHidden(item == nil)
    }
}

#Preview {
    Group {
        SirioAppNavigationItem(item: SirioAppNavigationItemData.previewBell)
            .padding()
            .colorScheme(.light)
        
        SirioAppNavigationItem(item: SirioAppNavigationItemData.previewUser)
            .padding()
            .colorScheme(.light)
    }
}
