//
// SirioFiltriSelected.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriSelected: View {
    @Binding var values: [String]
    var callback: (String) -> ()
    
    public init(values: Binding<[String]>,
                callback: @escaping (String) -> ()) {
        self._values = values
        self.callback = callback
    }
    
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Size.s8) {
                ForEach(values, id: \.self) { text in
                    SirioChips(
                        text: text,
                        iconData: nil,
                        onTapClose: { callback(text) }
                    )
                }
            }
            .padding(.vertical, Size.p8)
            .padding(.horizontal, Size.p12)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}

#Preview {
    SirioFiltriSelected(values: .constant(["Valore A", "Valore B", "Valore C", "Valore D"]), callback: { value in })
}
