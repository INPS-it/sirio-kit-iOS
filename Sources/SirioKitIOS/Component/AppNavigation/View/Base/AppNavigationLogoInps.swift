//
// AppNavigationLogoInps.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an app navigation logo item
struct AppNavigationLogoInps: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding()
            .frame(maxWidth: Size.AppNavigation.LogoInps.maxWidth,
                   maxHeight: Size.AppNavigation.LogoInps.maxHeight,
                   alignment: .center)
    }
    
    private var icon: Assets.Logo {
        return colorScheme == .light ? Assets.Logo.light : Assets.Logo.dark
    }
}

struct AppNavigationLogoInps_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppNavigationLogoInps()
                .padding()
                .colorScheme(.light)
            
            AppNavigationLogoInps()
                .padding()
                .background(Color.black)
                .colorScheme(.dark)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
