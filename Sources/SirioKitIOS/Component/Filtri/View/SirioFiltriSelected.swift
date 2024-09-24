//
// SirioFiltriSelected.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriSelected: View {
    @Binding var values: [String]
    var callback: (String) -> ()
    var background: SirioFiltriBackground
    
    public init(values: Binding<[String]>,
                callback: @escaping (String) -> (),
                background: SirioFiltriBackground = .default) {
        self._values = values
        self.callback = callback
        self.background = background
    }
    
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0){
            if #available(iOS 16.0, *) {
                OverflowLayout() {
                    ForEach(values, id: \.self) { text in
                        SirioChipsLabelClose(text: text, onTapClose: {
                            callback(text)
                        }).padding(.vertical, Size.Filtri.paddingVerticalChips)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
            } else {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach(values, id: \.self) { text in
                            SirioChipsLabelClose(text: text, onTapClose: {
                                callback(text)
                            }).padding(.vertical, Size.Filtri.paddingVerticalChips)
                        }
                    }
                    .padding(Size.Filtri.padding)
                })
                .frame(maxWidth: .infinity)
                .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
            }
        }
    }
}

#Preview {
    SirioFiltriSelected(values: .constant(["Valore A", "Valore B", "Valore C", "Valore D"]), callback: { value in })
}
