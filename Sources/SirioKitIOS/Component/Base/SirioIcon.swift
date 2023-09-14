//
// SirioIcon.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A basic struct used for represent an icon component
/// - Parameters:
///   - icon: The AwesomeIcon icon
///   - iconName: The icon name (to be used if you want to use an icon outside the package)
///   - bundle: The bundle (to be used if you want to use an icon outside the package)
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioIconData {
    var icon: AwesomeIcon?
    var iconName: String?
    var bundle: Bundle
    var accessibilityLabel: String?
    
    public init(icon: AwesomeIcon?, iconName: String? = nil, bundle: Bundle = .bundleModule, accessibilityLabel: String? = nil){
        self.icon = icon
        self.iconName = iconName
        self.bundle = bundle
        self.accessibilityLabel = accessibilityLabel
        precondition(icon != nil || iconName != nil, "At least one of 'icon' and 'iconName' must be not nil.")
        precondition(!(icon == nil && iconName != nil && bundle == .bundleModule), "Make sure the bundle you are using is the correct one")
    }
}

/// A basic component that represent an icon using the data
/// - Parameters:
///   - data: The  data for represent component

public struct SirioIcon: View {
    private var data: SirioIconData
    
    public init(data: SirioIconData){
        self.data = data
    }
    
    public var body: some View {
        VStack(spacing: 0){
            if let icon = data.icon {
                Image(icon.rawValue, bundle: data.bundle)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if let iconName = data.iconName {
                Image(iconName, bundle: data.bundle)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .setAccessibilityLabel(data.accessibilityLabel)
    }
}

struct SirioIcon_Previews: PreviewProvider {
    static var previews: some View {
        SirioIcon(data: .init(icon: .bell))
            .padding()
    }
}
