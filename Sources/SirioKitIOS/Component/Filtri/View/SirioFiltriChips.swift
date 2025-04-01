//
// SirioFiltriChips.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriChips: View {
    
    var texts: [String]
    @Binding var selectedType: String?
    @Binding var isDisabled: Bool
    var background: SirioFiltriBackground
    var accessibilityLabel: String?
    var isWrapped: Bool
    
    public init(texts: [String],
                selectedType: Binding<String?>,
                isDisabled: Binding<Bool> = .constant(false),
                background: SirioFiltriBackground = .default,
                accessibilityLabel: String? = nil,
                isWrapped: Bool = true) {
        self.texts = texts
        self._selectedType = selectedType
        self._isDisabled = isDisabled
        self.background = background
        self.accessibilityLabel = accessibilityLabel
        self.isWrapped = isWrapped
    }
    
    public var body: some View {
        if isWrapped {
            if #available(iOS 16.0, *) {
                HStack {
                    OverflowLayout() {
                        ForEach(texts, id: \.self) { text in
                            SirioChipsSelection(text: text, isSelected: Binding(
                                get: { selectedType == text },
                                set: { newValue in
                                    selectedType = newValue ? text : nil
                                }
                            ), isDisabled: $isDisabled, accessibilityLabel: accessibilityLabel)
                            .padding(.vertical, Size.Filtri.paddingVerticalChips)
                        }
                    }
                    Spacer()
                }
                .padding(Size.Filtri.padding)
                .frame(maxWidth: .infinity)
                .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
            } else {
                wrappedView
            }
        } else {
            wrappedView
        }
    }
    
    var wrappedView: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(texts, id: \.self) { text in
                    SirioChipsSelection(text: text, isSelected: Binding(
                        get: { selectedType == text },
                        set: { newValue in
                            selectedType = newValue ? text : nil
                        }
                    ), isDisabled: $isDisabled, accessibilityLabel: accessibilityLabel)
                    .padding(.vertical, Size.Filtri.paddingVerticalChips)
                }
            }
            .padding(Size.Filtri.padding)
        })
        .frame(maxWidth: .infinity)
        .background(background == .default ? Color.Filtri.Background.default : Color.Filtri.Background.light)
    }
}


#Preview {
    SirioFiltriChips(texts: ["Valore selezionato", "Valore 1", "Valore 2", "Valore 3", "Valore 4"],
                     selectedType: .constant("Valore selezionato"))
}

