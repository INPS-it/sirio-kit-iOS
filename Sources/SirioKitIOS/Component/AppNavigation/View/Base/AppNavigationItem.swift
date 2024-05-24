//
// AppNavigationItem.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an app navigation item
/// - Parameters:
///   - item: The content of the component - AppNavigationItemData
struct AppNavigationItem: View {
    @Environment(\.colorScheme) var colorScheme
    private var item: AppNavigationItemData?
    
    init(item: AppNavigationItemData?){
        self.item = item
    }
    
    var body: some View {
        Button(action: {
            item?.action()
        }, label: {
            
        })
        .buttonStyle(AppNavigationItemStyle(item: item))
        .setAccessibilityLabel(item?.accessibilityLabel)
        .accessibilityHidden(item == nil)
    }
}

#Preview {
    Group {
        AppNavigationItem(item: AppNavigationItemData.previewBell)
            .padding()
            .colorScheme(.light)
        
        AppNavigationItem(item: AppNavigationItemData.previewUser)
            .padding()
            .colorScheme(.light)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
