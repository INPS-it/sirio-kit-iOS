//
// SirioFiltriAction.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriActive: View {
    var initialFilterTypes: [SirioFiltriType]
    @Binding var filterTypes: [SirioFiltriType]
    
    public init(initialFilterTypes: [SirioFiltriType],
                filterTypes: Binding<[SirioFiltriType]>) {
        self.initialFilterTypes = initialFilterTypes
        self._filterTypes = filterTypes
    }
    
    private var activeFilters: [SirioFiltriType] {
        filterTypes.filter { $0.content.isActive }
    }
    
    public var body: some View {
        if activeFilters.isEmpty {
            EmptyView()
        } else {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(activeFilters){ filter in
                        if let texts = getFilterValue(from: filter) {
                            ForEach(texts, id: \.self){ text in
                                SirioChips(text: text, onTapClose: {
                                    resetFilter(filter, value: text)
                                })
                            }
                        }
                    }
                }
                .padding(.horizontal, Size.p16)
            })
            .frame(height: Size.Filtri.activeFrame)
            .background(Color.aliasBackgroundColorPrimaryLight0)
        }
    }
    
    private func resetFilter(_ filterType: SirioFiltriType, value: String? = nil) {
        // Senza "value" → reset totale
        guard let initialFilter = initialFilterTypes.first(where: { $0.id == filterType.id }) else {
            return
        }
        guard let index = filterTypes.firstIndex(where: { $0.id == filterType.id }) else {
            return
        }

        switch filterTypes[index].content {

        case .chips(let texts, var selectedTypes, let selectionMode, let isDisabled, let active):
            // Se non ho un value specifico, ripristino tutto come prima
            guard let value else {
                filterTypes[index] = initialFilter
                return
            }

            // Rimuovo solo la chip chiusa
            selectedTypes.removeAll { $0 == value }
            if selectedTypes.isEmpty { selectedTypes = [] }

            filterTypes[index].content = .chips(
                texts: texts,
                selectedTypes: selectedTypes,
                selectionMode: selectionMode,
                isDisabled: isDisabled,
                active: active
            )

        default:
            // Tutti gli altri filtri: reset totale
            filterTypes[index] = initialFilter
        }
    }
    
    private func getFilterValue(from filterType: SirioFiltriType) -> [String]? {
        switch filterType.content {

        // 🔹 Chips (multi)
        case .chips(_, let selectedTypes, _, _, _):
            if selectedTypes.isEmpty {
                return []
            }
            return selectedTypes

        // 🔹 Select
        case .select(let text, _, let value, _, _, _):
            return value.isEmpty ? nil : ["\(text): \(value)"]

        // 🔹 Date
        case .date(let textInfo, _, let value, _, _):
            return value.isEmpty ? nil : ["\(textInfo): \(value)"]

        // 🔹 Toggle
        case .toggle(let isOn, let text, _):
            return isOn ? [text] : nil

        // 🔹 Radio Group
        case .radioGroup(_, let selectedText, _, _, _):
            return selectedText.isEmpty ? nil : [selectedText]

        // 🔹 Checkbox
        case .checkbox(let text, let isChecked, _, _, _):
            return isChecked ? [text ?? "Checkbox"] : nil

        // 🔹 Section title o altro
        case .sectionTitle:
            return nil
        }
    }
}
