//
// SirioFiltriChips.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriChips: View {

    var texts: [String]
    @Binding var selectedTypes: [String]?
    @Binding var isDisabled: Bool

    public init(
        texts: [String],
        selectedTypes: Binding<[String]?>,
        isDisabled: Binding<Bool> = .constant(false)
    ) {
        self.texts = texts
        self._selectedTypes = selectedTypes
        self._isDisabled = isDisabled
    }
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(texts, id: \.self) { text in
                    SirioChipsSelection(
                        text: text,
                        isSelected: Binding(
                            get: {
                                selectedTypes?.contains(text) == true
                            },
                            set: { newValue in
                                if newValue {
                                    // aggiungo
                                    if selectedTypes == nil {
                                        selectedTypes = [text]
                                    } else if selectedTypes?.contains(text) == false {
                                        selectedTypes?.append(text)
                                    }
                                } else {
                                    // rimuovo
                                    selectedTypes?.removeAll { $0 == text }

                                    // se vuoto → torna nil
                                    if selectedTypes?.isEmpty == true {
                                        selectedTypes = nil
                                    }
                                }
                            }
                        ),
                        isDisabled: $isDisabled
                    )
                    .padding(.vertical, Size.p8)
                }
            }
            .padding(.vertical, Size.p8)
            .padding(.horizontal, Size.p24)
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: Size.Filtri.cFrame)
        .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}


#Preview {
    SirioFiltriChips(texts: ["Valore selezionato", "Valore 1", "Valore 2", "Valore 3", "Valore 4"],
                     selectedTypes: .constant(["Valore selezionato"]))
}
