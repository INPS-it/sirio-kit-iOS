//
// SirioFiltriHeader.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriHeader: View {
    
    var title: String
    var icon: AwesomeIcon
    var action: () -> Void
    var background: SirioFiltriBackground
    
    public init(title: String = "Filtri",
                icon: AwesomeIcon = .times,
                background: SirioFiltriBackground = .default,
                action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
        self.background = background
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                SirioIcon(data: .init(icon: icon))
                    .frame(width: Size.Filtri.icon, height: Size.Filtri.icon)
                    .foregroundStyle(Color.Filtri.Header.icon)
                    .onTapGesture {
                        action()
                    }
            }
            
            HStack {
                SirioText(text: title, typography: .h4_lg)
                    .foregroundStyle(Color.Filtri.Header.text)
                Spacer()
            }
        }
        .padding(.vertical, Size.Filtri.paddingVertical)
        .padding(.horizontal, Size.Filtri.padding)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

#Preview {
    SirioFiltriHeader(action: {} )
}
