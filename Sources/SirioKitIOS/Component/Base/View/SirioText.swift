//
// SirioText.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A basic component that represent a text using the typography provided by Sirio
/// - Parameters:
///   - text: The string to show
///   - typography: The text typography
///   - isUnderlined: A boolean to underline text
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioText: View {
    private var text: String
    private var typography: Typography
    private var isUnderlined: Bool
    private var accessibilityLabel: String?
    
    private static let fontRegistration: Void = {
        Fonts.registerFonts()
    }()
    
    public init(text: String,
                typography: Typography,
                isUnderlined: Bool = false,
                accessibilityLabel: String? = nil){
        self.text = text
        self.typography = typography
        self.isUnderlined = isUnderlined
        self.accessibilityLabel = accessibilityLabel
        
        #if DEBUG
        _ = SirioText.fontRegistration
        #endif
    }
    
    public var body: some View {
        Text(text)
            .if(isUnderlined) {
                $0.underline()
            }
            .sirioFont(typography: typography)
            .dynamicTypeSize(.medium ... .xxLarge)
            .setAccessibilityLabel(accessibilityLabel)
    }
}

struct SirioText_Previews: PreviewProvider {
    static var previews: some View {
        SirioText(text: "Text",
                  typography: Typography.label_md_700)
    }
}
