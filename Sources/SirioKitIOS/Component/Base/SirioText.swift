//
// SirioText.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A basic component that represent a text using the typography provided by Sirio
/// - Parameters:
///   - text: The string to show
///   - typography: The text typography
///   - isUnderlined: A boolean to underline text
public struct SirioText: View {
    private var text: String
    private var typography: Typography
    private var isUnderlined: Bool
    
    public init(text: String,
                typography: Typography,
                isUnderlined: Bool = false){
        self.text = text
        self.typography = typography
        self.isUnderlined = isUnderlined
    }
    
    public var body: some View {
        Text(text)
            .if(isUnderlined) {
                $0.underline()
            }
            .sirioFont(typography: typography)
    }
}

struct SirioText_Previews: PreviewProvider {
    static var previews: some View {
        SirioText(text: "Text",
                  typography: Typography.label_md_700)
    }
}
