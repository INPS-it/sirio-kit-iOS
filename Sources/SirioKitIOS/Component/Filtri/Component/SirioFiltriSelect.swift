//
// SirioFiltriSelect.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriSelect: View {
    
    var textInfo: String
    var placeholder: String
    @Binding var value: String
    var listItem: [String]
    @Binding var isDisabled: Bool

    public init(textInfo: String,
                placeholder: String,
                value: Binding<String>,
                listItem: [String],
                isDisabled: Binding<Bool> = .constant(false)
    ){
        self.textInfo = textInfo
        self.placeholder = placeholder
        self._value = value
        self.listItem = listItem
        self._isDisabled = isDisabled
    }
    
    
    public var body: some View {
        SirioDropdown(textInfo: textInfo, placeholder: placeholder, text: $value, listItem: listItem, isDisabled: $isDisabled)
            .padding(.horizontal, Size.p24)
            .padding(.vertical, Size.p8)
            .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}

#Preview {
    SirioFiltriSelect(textInfo: "Label", placeholder: "Text", value: .constant(""), listItem: ["Valore 1", "Valore 2", "Valore 3", "Valore 4", "Valore 5"])
}
