//
// SirioFontModifier.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit

struct SirioFontModifier: ViewModifier {
    let typography: Typography

    func body(content: Content) -> some View {
        content
            .font(typography.font)
            .lineSpacing(typography.lineHeight - typography.uiFont.lineHeight)
            .padding(.vertical, (typography.lineHeight - typography.uiFont.lineHeight) / 2)
    }
}
