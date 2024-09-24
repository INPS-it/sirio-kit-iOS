//
// SirioFiltriCTA.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI


public struct SirioFiltriCTA: View {
    
    var text1: String
    var action1: () -> Void
    var text2: String
    var action2: () -> Void
    var background: SirioFiltriBackground
    
    public init(text1: String = "Elimina filtri", 
                action1: @escaping () -> Void,
                text2: String = "Applica filtri",
                action2: @escaping () -> Void,
                background: SirioFiltriBackground = .default) {
        self.text1 = text1
        self.action1 = action1
        self.text2 = text2
        self.action2 = action2
        self.background = background
    }
    
    public var body: some View {
        HStack {
            SirioButtonTextOnly(style: .secondary, size: .medium, text: text1, action: action1)
            Spacer()
            SirioButtonTextOnly(style: .primary, size: .medium, text: text2, action: action2)

        }
        .padding(Size.Filtri.padding)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

#Preview {
    SirioFiltriCTA(action1: {}, action2: {})
}
