//
// SirioFiltriDrawer.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriDrawer: View {
    var buttonFilterTitle: String
    var action: () -> Void                      // chiusura del drawer
    var onClearFilters: (() -> Void)? = nil     // elimina filtri
    var onApplyFilters: (() -> Void)? = nil     // applica filtri
    
    @Binding var filterTypes: [SirioFiltriType]
    @State private var tempFilterTypes: [SirioFiltriType] = []   // Stato temporaneo locale
    @Binding private var initialFilterTypes: [SirioFiltriType] // Snapshot dello stato originale

    public init(
        filterTypes: Binding<[SirioFiltriType]>,
        initialFilterTypes: Binding<[SirioFiltriType]>,
        buttonFilterTitle: String = "Filtra",
        action: @escaping () -> Void,
        onClearFilters: (() -> Void)? = nil,
        onApplyFilters: (() -> Void)? = nil
    ) {
        self._filterTypes = filterTypes
        self._initialFilterTypes = initialFilterTypes
        self.buttonFilterTitle = buttonFilterTitle
        self.action = action
        self.onClearFilters = onClearFilters
        self.onApplyFilters = onApplyFilters
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            SirioFiltriHeader(buttonFilterTitle: buttonFilterTitle, action: action)
            ScrollView(.vertical, content: {
                VStack(spacing: Size.zero) {
                    ForEach($tempFilterTypes) { $type in
                        switch type.content {

                        // MARK: - Section Title
                        case .sectionTitle(let title, let subtitle):
                            SirioFiltriTitle(title: title, subtitle: subtitle)

                        // MARK: - Chips
                        case .chips(let texts, let selectedType, let isDisabled, _):
                            SirioFiltriChips(
                                texts: texts,
                                selectedTypes: Binding(
                                    get: {
                                        if case .chips(_, let selected, _, _) = type.content {
                                            return selected
                                        }
                                        return selectedType
                                    },
                                    set: { newValue in
                                        type.content = .chips(
                                            texts: texts,
                                            selectedTypes: newValue,
                                            isDisabled: isDisabled,
                                            active: !(newValue?.isEmpty ?? true)
                                        )
                                    }
                                ),
                                isDisabled: Binding(
                                    get: {
                                        if case .chips(_, _, let disabled, _) = type.content {
                                            return disabled
                                        }
                                        return false
                                    },
                                    set: { newValue in
                                        if case .chips(_, let selected, _, _) = type.content {
                                            type.content = .chips(
                                                texts: texts,
                                                selectedTypes: selected,
                                                isDisabled: newValue,
                                                active: !(selected?.isEmpty ?? true)
                                            )
                                        }
                                    }
                                )
                            )

                        // MARK: - Select
                        case .select(let textInfo, let placeholder, let value, let listItem, let isDisabled, _):
                            SirioFiltriSelect(
                                textInfo: textInfo,
                                placeholder: placeholder,
                                value: Binding(
                                    get: {
                                        if case .select(_, _, let val, _, _, _) = type.content {
                                            return val
                                        }
                                        return value
                                    },
                                    set: { newValue in
                                        type.content = .select(
                                            textInfo: textInfo,
                                            placeholder: placeholder,
                                            value: newValue,
                                            listItem: listItem,
                                            isDisabled: isDisabled,
                                            active: !newValue.isEmpty
                                        )
                                    }
                                ),
                                listItem: listItem,
                                isDisabled: Binding(
                                    get: {
                                        if case .select(_, _, _, _, let disabled, _) = type.content {
                                            return disabled
                                        }
                                        return false
                                    },
                                    set: { newValue in
                                        if case .select(_, let placeholder, let val, let list, _, _) = type.content {
                                            type.content = .select(
                                                textInfo: textInfo,
                                                placeholder: placeholder,
                                                value: val,
                                                listItem: list,
                                                isDisabled: newValue,
                                                active: !val.isEmpty
                                            )
                                        }
                                    }
                                )
                            )

                        // MARK: - Date
                        case .date(let textInfo, let placeholder, let value, let isDisabled, _):
                            SirioFiltriDate(
                                textInfo: textInfo,
                                placeholder: placeholder,
                                value: Binding(
                                    get: {
                                        if case .date(_, _, let val, _, _) = type.content {
                                            return val
                                        }
                                        return value
                                    },
                                    set: { newValue in
                                        type.content = .date(
                                            textInfo: textInfo,
                                            placeholder: placeholder,
                                            value: newValue,
                                            isDisabled: isDisabled,
                                            active: !newValue.isEmpty
                                        )
                                    }
                                ),
                                isDisabled: Binding(
                                    get: {
                                        if case .date(_, _, _, let disabled, _) = type.content {
                                            return disabled
                                        }
                                        return false
                                    },
                                    set: { newValue in
                                        if case .date(_, let placeholder, let val, _, _) = type.content {
                                            type.content = .date(
                                                textInfo: textInfo,
                                                placeholder: placeholder,
                                                value: val,
                                                isDisabled: newValue,
                                                active: !val.isEmpty
                                            )
                                        }
                                    }
                                )
                            )

                        // MARK: - Toggle
                        case .toggle(let isOn, let text, _):
                            SirioFiltriToggle(
                                text: text,
                                isOn: Binding(
                                    get: { isOn },
                                    set: { newValue in
                                        type.content = .toggle(
                                            isOn: newValue,
                                            text: text,
                                            active: newValue
                                        )
                                    }
                                )
                            )

                        // MARK: - Radio Group
                        case .radioGroup(let texts, let selectedText, let isDisabled, let callback, _):
                            ForEach(texts, id: \.self) { text in
                                SirioFiltriRadio(
                                    text: text,
                                    isChecked: Binding(
                                        get: {
                                            selectedText == text
                                        },
                                        set: { newValue in
                                            if newValue {
                                                type.content = .radioGroup(
                                                    texts: texts,
                                                    selectedText: text,
                                                    isDisabled: isDisabled,
                                                    callback: callback,
                                                    active: true
                                                )
                                            }
                                        }
                                    ),
                                    isDisabled: Binding(
                                        get: { isDisabled },
                                        set: { newValue in
                                            type.content = .radioGroup(
                                                texts: texts,
                                                selectedText: selectedText,
                                                isDisabled: newValue,
                                                callback: callback,
                                                active: !selectedText.isEmpty
                                            )
                                        }
                                    ),
                                    callback: callback
                                )
                            }

                        // MARK: - Checkbox
                        case .checkbox(let text, let isChecked, let isDisabled, let callback, _):
                            SirioFiltriCheckBox(
                                text: text,
                                isChecked: Binding(
                                    get: {
                                        if case .checkbox(_, let checked, _, _, _) = type.content {
                                            return checked
                                        }
                                        return isChecked
                                    },
                                    set: { newValue in
                                        type.content = .checkbox(
                                            text: text,
                                            isChecked: newValue,
                                            isDisabled: isDisabled,
                                            callback: callback,
                                            active: newValue
                                        )
                                    }
                                ),
                                isDisabled: Binding(
                                    get: {
                                        if case .checkbox(_, _, let disabled, _, _) = type.content {
                                            return disabled
                                        }
                                        return false
                                    },
                                    set: { newValue in
                                        if case .checkbox(let txt, let checked, _, let cb, _) = type.content {
                                            type.content = .checkbox(
                                                text: txt,
                                                isChecked: checked,
                                                isDisabled: newValue,
                                                callback: cb,
                                                active: checked
                                            )
                                        }
                                    }
                                ),
                                callback: callback
                            )
                        }
                    }
                }
            })
            
            SirioFiltriButton(onClearAction: {
                tempFilterTypes = initialFilterTypes // Ripristina lo snapshot iniziale
                onClearFilters?()
            }, onApplyAction: {
                filterTypes = tempFilterTypes
                onApplyFilters?()
                action()
            })
        }
        .onAppear {
            if initialFilterTypes.isEmpty {
                initialFilterTypes = filterTypes  // salva lo snapshot originale
            }
            tempFilterTypes = filterTypes
        }
    }
}

// MARK: - Extension per presentare il Drawer dei Filtri
public extension View {
    func sirioFiltriDrawer(
        isPresented: Binding<Bool>,
        filterTypes: Binding<[SirioFiltriType]>,
        initialFilterTypes: Binding<[SirioFiltriType]>,
        buttonFilterTitle: String = "Filtra",
        onTapClose: (() -> Void)? = nil,
        onClearFilters: (() -> Void)? = nil,
        onApplyFilters: (() -> Void)? = nil
    ) -> some View {
        //NavigationStack {
            ZStack {
                self
                NavigationLink(
                    destination: SirioFiltriDrawer(
                        filterTypes: filterTypes,
                        initialFilterTypes: initialFilterTypes,
                        buttonFilterTitle: buttonFilterTitle,
                        action: {
                            isPresented.wrappedValue = false
                            onTapClose?()
                        }, onClearFilters: {
                            onClearFilters?()
                        }, onApplyFilters: {
                            onApplyFilters?()
                        }
                    )
                    .navigationBarBackButtonHidden(true),
                    isActive: isPresented
                ) {
                    EmptyView()
                }
                .hidden()
                .navigationBarHidden(true)
            }
        }
    //}
}
