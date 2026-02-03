//
// SirioFiltriToggle.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriToggle: View {
    
    var text: String
    @Binding var isOn: Bool
    @Binding var isDisabled: Bool
    
    public init(text: String,
                isOn: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false)){
        self.text = text
        self._isOn = isOn
        self._isDisabled = isDisabled
    }
    
    
    public var body: some View {
        HStack {
            SirioToggle(text: text,
                        isOn: $isOn,
                        isDisabled: $isDisabled)
            Spacer()
        }
        .padding(.vertical, Size.p8)
        .padding(.horizontal, Size.p24)
        .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}

#Preview {
    VStack {
        SirioFiltriToggle(text: "Title", isOn: .constant(false))
    }
}
