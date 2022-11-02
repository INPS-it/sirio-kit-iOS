//
// Badge.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// Badge component
struct Badge: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Circle()
                        .strokeBorder(Color.TabBar.Badge.border, lineWidth: Size.Badge.border)
                        .background(Circle().foregroundColor(Color.TabBar.Badge.background))
                        .frame(width: Size.Badge.circle, height: Size.Badge.circle)
                }
                .padding(.top, Size.Badge.paddingTop)
                Spacer()
            }
        }
        .frame(width: Size.Badge.overlay, height: Size.Badge.overlay)
    }
}


struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
            .previewDisplayName("Badge Preview")
            
            
    }
}
