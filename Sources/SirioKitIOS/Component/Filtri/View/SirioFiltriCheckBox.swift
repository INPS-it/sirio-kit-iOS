//
// SirioFiltriCheckBox.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioFiltriBackground {
    case `default`, light
}

public struct SirioFiltriCheckBox: View {
    
    var text: String?
    @Binding var isChecked: Bool
    @Binding var isDisabled: Bool
    var callback: ((String?) -> ())?
    var background: SirioFiltriBackground
    private var accessibilityLabel: String?

    public init(text: String?,
                isChecked: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                callback: ((String?) -> ())? = nil,
                background: SirioFiltriBackground = .default,
                accessibilityLabel: String? = nil) {
        self.text = text
        self._isChecked = isChecked
        self._isDisabled = isDisabled
        self.callback = callback
        self.background = background
        self.accessibilityLabel = accessibilityLabel
    }
    
    
    public var body: some View {
        HStack {
            SirioCheckbox(text: text, isChecked: $isChecked, isDisabled: $isDisabled, callback: callback, accessibilityLabel: accessibilityLabel)
            Spacer()
        }
        .padding(Size.Filtri.padding)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}

#Preview {
    SirioFiltriCheckBox(text: "Title", isChecked: .constant(false))
}
