//
// SirioFiltriCheckBox.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriCheckBox: View {
    
    var text: String?
    @Binding var isChecked: Bool
    @Binding var isDisabled: Bool
    var callback: ((String?) -> ())?

    public init(text: String?,
                isChecked: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                callback: ((String?) -> ())? = nil) {
        self.text = text
        self._isChecked = isChecked
        self._isDisabled = isDisabled
        self.callback = callback
    }
    
    public var body: some View {
        HStack {
            SirioCheckbox(text: text, isChecked: $isChecked, isDisabled: $isDisabled, callback: callback)
            Spacer()
        }
        
        .padding(.horizontal, Size.p24)
        .padding(.vertical, Size.p8)
        .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}

#Preview {
    SirioFiltriCheckBox(text: "Title", isChecked: .constant(false))
}
