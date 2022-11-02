//
// SirioIcon.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A basic component that represent an icon using the icons available in FontAwesome
/// - Parameters:
///   - icon: The AwesomeIcon icon
///   - iconName: The icon name (to be used if you want to use an icon outside the package)
///   - bundle: The bundle
public struct SirioIcon: View {
    private var icon: AwesomeIcon?
    private var iconName: String?
    private var bundle: Bundle
    
    public init(icon: AwesomeIcon?, iconName: String? = nil, bundle: Bundle = .bundleModule){
        self.icon = icon
        self.iconName = iconName
        self.bundle = bundle
    }
    
    public var body: some View {
        if let icon = icon {
            Image(icon.rawValue, bundle: bundle)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else if let iconName = iconName {
            Image(iconName, bundle: bundle)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct SirioIcon_Previews: PreviewProvider {
    static var previews: some View {
        SirioIcon(icon: .bell)
            .padding()
    }
}
