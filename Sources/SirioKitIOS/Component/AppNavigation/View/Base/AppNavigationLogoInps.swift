//
// AppNavigationLogoInps.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The representation of an app navigation logo item
struct AppNavigationLogoInps: View {
    @Environment(\.colorScheme) var colorScheme

    let isDefaultLogo = false
    
    var body: some View {
        
        if isDefaultLogo { // Default INPS logo
            Image(Assets.default.rawValue, bundle: .module)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(iconColor)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: Size.AppNavigation.LogoInps.maxWidth,
                       maxHeight: Size.AppNavigation.LogoInps.maxHeight,
                       alignment: .center)
        } else { // Logo INPS 125
            Image(colorScheme == .light ? Assets.light.rawValue : Assets.dark.rawValue, bundle: .module)
                .resizable()
                .foregroundColor(.none)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: Size.AppNavigation.LogoInps125.maxWidth,
                       maxHeight: Size.AppNavigation.LogoInps125.maxHeight,
                       alignment: .center)
        }
    }
}

extension AppNavigationLogoInps {
    
    private var iconColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.LogoInps.light
        case .dark:
            return Color.AppNavigation.LogoInps.dark
        @unknown default:
            return Color.AppNavigation.LogoInps.light
        }
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
                .colorScheme(.dark)
                .background(Color.black)
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
