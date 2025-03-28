//
// SirioBadge.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// Badge component
public struct SirioBadge: View {
    
    public init(){}
    
    public var body: some View {
        Circle()
            .strokeBorder(Color.Badge.border, lineWidth: Size.Badge.border)
            .background(Circle()
                .foregroundColor(Color.Badge.background)
                .frame(width: Size.Badge.circleRed, height: Size.Badge.circleRed))
            .frame(width: Size.Badge.circleWhite, height: Size.Badge.circleWhite)
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        SirioBadge()
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Badge Preview")
        }
}
