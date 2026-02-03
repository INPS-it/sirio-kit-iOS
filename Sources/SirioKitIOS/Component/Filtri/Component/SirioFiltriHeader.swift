//
// SirioFiltriHeader.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriHeader: View {
    
    var buttonFilterTitle: String
    var icon: AwesomeIcon
    var action: () -> Void
    
    public init(buttonFilterTitle: String = "Filtra",
                icon: AwesomeIcon = .times,
                action: @escaping () -> Void) {
        self.buttonFilterTitle = buttonFilterTitle
        self.icon = icon
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            HStack {
                Spacer()
                SirioButton(hierarchy: .ghostLight, size: .medium, iconData: .init(icon: .times), action: {
                    action()
                })
            }
            .padding(.vertical, Size.p12)
            
            HStack {
                SirioText(text: buttonFilterTitle, typography: .headlineSmHeavy)
                    .foregroundStyle(Color.aliasTextColorPrimaryDark110)
                Spacer()
            }
            .padding(.bottom, Size.p16)
        }
        .padding(.horizontal, Size.p24)
        .background(Color.aliasBackgroundColorPrimaryLight0)
        .frame(minHeight: Size.Filtri.headerFrame)
    }
}

#Preview {
    SirioFiltriHeader(action: {} )
}
