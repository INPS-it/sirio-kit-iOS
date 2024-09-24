//
// SirioFiltriSectionTitle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriSectionTitle: View {
    
    var text: String
    var action: (() -> Void)?
    var background: SirioFiltriBackground
    
    public init(text: String, 
                action: (() -> Void)? = nil,
                background: SirioFiltriBackground = .default){
        self.text = text
        self.action = action
        self.background = background
    }
    
    
    public var body: some View {
        HStack {
            SirioText(text: text, typography: .label_lg_700)
                .foregroundStyle(Color.Filtri.Text.default)
            
            SirioIcon(data: .init(icon: .infoCircle))
                .frame(width: Size.Filtri.infoIcon, height: Size.Filtri.infoIcon)
                .foregroundStyle(Color.Filtri.Icon.default)

            Spacer()
        }
        .padding(Size.Filtri.padding)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

#Preview {
    SirioFiltriSectionTitle(text: "Section Title #")
}
