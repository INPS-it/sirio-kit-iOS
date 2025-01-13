//
// SirioAppNavigationItemEmpty.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an empty app navigation item
struct SirioAppNavigationItemEmpty: View {
    
    var body: some View {
        VStack {
            
        }
        .frame(width: Size.AppNavigation.Item.area, height: Size.AppNavigation.Item.area)
    }
}

#Preview {
    SirioAppNavigationItemEmpty()
}
