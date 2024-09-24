//
// SirioFiltriToggle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriToggle: View {
    
    var text: String
    @Binding var isOn: Bool
    @Binding var isDisabled: Bool
    var background: SirioFiltriBackground
    var accessibilityLabel: String?
    
    public init(text: String,
                isOn: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                background: SirioFiltriBackground = .default,
                accessibilityLabel: String? = nil){
        self.text = text
        self._isOn = isOn
        self._isDisabled = isDisabled
        self.background = background
        self.accessibilityLabel = accessibilityLabel
    }
    
    
    public var body: some View {
        HStack {
            SirioToggle(text: text,
                        isOn: $isOn,
                        isDisabled: $isDisabled,
                        accessibilityLabel: accessibilityLabel)
            Spacer()
        }
        .padding(Size.Filtri.padding)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

#Preview {
    VStack {
        SirioFiltriToggle(text: "Title", isOn: .constant(false))
    }
}
