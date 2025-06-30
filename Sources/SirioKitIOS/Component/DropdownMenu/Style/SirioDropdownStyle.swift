//
//  SirioDropdownStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioDropdownStyle: ButtonStyle {
    var text: String
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(spacing: Size.s0) {
            HStack {
                SirioText(text: text, typography: .labelMdRegular)
                    .foregroundColor(getTextColor(configuration: configuration))
                    .lineLimit(2)
                Spacer()
            }
            .padding(.horizontal, Size.p12)
            .padding(.vertical, Size.p12)
            .background(getBackgroundColor(configuration: configuration))
            
            Divider()
                .background(Color.aliasBackgroundColorSecondaryDark110)
        }
        .contentShape(Rectangle())
    }
    
    private func getTextColor(configuration: Self.Configuration) -> Color {
        if configuration.isPressed {
            return Color.aliasTextColorPrimaryLight0
        }
        return Color.aliasTextColorSecondaryDark100
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        if configuration.isPressed {
            return Color.aliasInteractivePrimaryPressed
        }
        return Color.aliasBackgroundColorPrimaryLight0
    }
}
