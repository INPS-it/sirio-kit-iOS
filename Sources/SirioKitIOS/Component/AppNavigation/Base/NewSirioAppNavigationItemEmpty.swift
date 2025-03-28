//
// NewSirioAppNavigationItemEmpty.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an empty app navigation item
struct NewSirioAppNavigationItemEmpty: View {
    
    var body: some View {
        VStack {
            
        }
        .frame(width: Size.NewAppNavigation.Item.area, height: Size.NewAppNavigation.Item.area)
    }
}

#Preview {
    NewSirioAppNavigationItemEmpty()
}
