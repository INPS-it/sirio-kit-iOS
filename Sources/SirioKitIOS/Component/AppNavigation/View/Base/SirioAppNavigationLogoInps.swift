//
// SirioAppNavigationLogoInps.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an app navigation logo item
struct SirioAppNavigationLogoInps: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding()
            .frame(maxWidth: Size.AppNavigation.LogoInps.maxWidth,
                   maxHeight: Size.AppNavigation.LogoInps.maxHeight,
                   alignment: .center)
            .accessibilityHidden(true)
            
    }
    
    private var icon: Assets.Logo {
        return colorScheme == .light ? Assets.Logo.light : Assets.Logo.dark
    }
}

extension SirioAppNavigationLogoInps {
    private var iconColor: Color {
        return Color.AppNavigation.LogoInps.light
    }
}

#Preview {
    Group {
        SirioAppNavigationLogoInps()
            .padding()
            .colorScheme(.light)
        
        SirioAppNavigationLogoInps()
            .padding()
            .colorScheme(.dark)
    }
    .previewLayout(PreviewLayout.sizeThatFits)
}
