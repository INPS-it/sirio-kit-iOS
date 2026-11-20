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
    let selectionMode: SirioChipsSelectionMode
    @Binding var selectedTypes: [String]
    @Binding var isDisabled: Bool
    
    public init(
        texts: [String],
        selectionMode: SirioChipsSelectionMode = .multiple,
        selectedTypes: Binding<[String]>,
        isDisabled: Binding<Bool> = .constant(false)
    ) {
        self.texts = texts
        self.selectionMode = selectionMode
        self._selectedTypes = selectedTypes
        self._isDisabled = isDisabled
    }
    
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(texts, id: \.self) { text in
                    SirioChipsSelection(
                        text: text,
                        isSelected: binding(for: text),
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
    
    private func binding(for text: String) -> Binding<Bool> {
        Binding(
            get: {
                selectedTypes.contains(text)
            },
            set: { isSelected in
                switch selectionMode {
                case .single:
                    selectedTypes = isSelected ? [text] : []
                    
                case .multiple:
                    if isSelected {
                        if !selectedTypes.contains(text) {
                            selectedTypes.append(text)
                        }
                    } else {
                        selectedTypes.removeAll { $0 == text }
                    }
                }
            }
        )
    }
}

#Preview {
    SirioFiltriChips(texts: ["Valore selezionato", "Valore 1", "Valore 2", "Valore 3", "Valore 4"],
                     selectedTypes: .constant(["Valore selezionato"]))
}
