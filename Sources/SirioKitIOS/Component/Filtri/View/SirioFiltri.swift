//
// SirioFiltri.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - Type Filtri
public struct SirioFiltriType: Identifiable, Equatable {
    public enum Content {
        case sectionTitle(title: String, subtitle: String)
        case chips(
            texts: [String],
            selectedTypes: [String],
            selectionMode: SirioChipsSelectionMode,
            isDisabled: Bool,
            active: Bool
        )
        case select(textInfo: String, placeholder: String, value: String, listItem: [String], isDisabled: Bool, active: Bool)
        case date(textInfo: String, placeholder: String, value: String, isDisabled: Bool, active: Bool)
        case toggle(isOn: Bool, text: String, active: Bool)
        case radioGroup(texts: [String], selectedText: String, isDisabled: Bool, callback: ((String?) -> ())?, active: Bool)
        case checkbox(text: String?, isChecked: Bool, isDisabled: Bool, callback: ((String?) -> ())?, active: Bool)
        
        // MARK: - Determina se il filtro è attivo
        var isActive: Bool {
            switch self {
            case .chips(_, let selectedTypes, _, _, let active):
                return active || (selectedTypes.isEmpty == false)
            case .select(_, _, let value, _, _, let active):
                return active || !value.isEmpty
            case .date(_, _, let value, _, let active):
                return active || !value.isEmpty
            case .toggle(let isOn, _, let active):
                return active || isOn
            case .radioGroup(_, let selectedText, _, _, let active):
                return active || !selectedText.isEmpty
            case .checkbox(_, let isChecked, _, _, let active):
                return active || isChecked
            case .sectionTitle:
                return false
            }
        }
    }
    
    public let id = UUID()
    public var content: Content
    
    public init(content: Content) {
        self.content = content
    }
    
    public static func == (lhs: SirioFiltriType, rhs: SirioFiltriType) -> Bool {
        lhs.content == rhs.content
    }
}

// MARK: - Equatable per Content (ignora le closure)
extension SirioFiltriType.Content: Equatable {
    public static func == (lhs: SirioFiltriType.Content, rhs: SirioFiltriType.Content) -> Bool {
        switch (lhs, rhs) {
        case (.sectionTitle(let lt, let ls), .sectionTitle(let rt, let rs)):
            return lt == rt && ls == rs
      
        case (
            .chips(texts: let lTexts, selectedTypes: let lSelectedTypes, selectionMode: let lMode, isDisabled: let lDisabled, active: let lActive),
            .chips(texts: let rTexts, selectedTypes: let rSelectedTypes, selectionMode: let rMode, isDisabled: let rDisabled, active: let rActive)
        ):
            return lTexts == rTexts &&
                   lSelectedTypes == rSelectedTypes &&
                   lMode == rMode &&
                   lDisabled == rDisabled &&
                   lActive == rActive
        case (.select(let lText, let lPlaceholder, let lVal, let lList, let lDis, let lAct),
              .select(let rText, let rPlaceholder, let rVal, let rList, let rDis, let rAct)):
            return lText == rText && lPlaceholder == rPlaceholder && lVal == rVal && lList == rList && lDis == rDis && lAct == rAct
            
        case (.date(let lLabel, let lPlaceholder, let lVal, let lDis, let lAct),
              .date(let rLabel, let rPlaceholder, let rVal, let rDis, let rAct)):
            return lLabel == rLabel && lPlaceholder == rPlaceholder && lVal == rVal && lDis == rDis && lAct == rAct
            
        case (.toggle(let lOn, let lText, let lAct),
              .toggle(let rOn, let rText, let rAct)):
            return lOn == rOn && lText == rText && lAct == rAct
            
        case (.radioGroup(let lTexts, let lSelected, let lDisabled, _, let lAct),
              .radioGroup(let rTexts, let rSelected, let rDisabled, _, let rAct)):
            // NOTA: callback ignorata nel confronto
            return lTexts == rTexts && lSelected == rSelected && lDisabled == rDisabled && lAct == rAct
            
        case (.checkbox(let lText, let lChecked, let lDisabled, _, let lAct),
              .checkbox(let rText, let rChecked, let rDisabled, _, let rAct)):
            // NOTA: callback ignorata nel confronto
            return lText == rText && lChecked == rChecked && lDisabled == rDisabled && lAct == rAct
            
        default:
            return false
        }
    }
}

public struct SirioFiltri<T: Identifiable, ItemView: View>: View {
    let sectionTitle: String?
    let title: String
    let items: [T]
    let itemView: (T) -> ItemView
    var onCloseDrawer: (() -> Void)?
    var onClearFilters: (() -> Void)?
    var onApplyFilters: (() -> Void)?
    
    @Binding private var filterTypes: [SirioFiltriType]
    @State private var showFiltri = false
    @State private var scrollOffset: CGFloat = 0
    @State private var initialFilterTypes: [SirioFiltriType] = []
    @State private var isHeaderVisible = true
    
    public init(
        sectionTitle: String? = nil,
        title: String = "Filtra",
        items: [T],
        @ViewBuilder itemView: @escaping (T) -> ItemView,
        filterTypes: Binding<[SirioFiltriType]>,
        onCloseDrawer: (() -> Void)? = nil,
        onClearFilters: (() -> Void)? = nil,
        onApplyFilters: (() -> Void)? = nil
    ) {
        self.sectionTitle = sectionTitle
        self.title = title
        self.items = items
        self.itemView = itemView
        self._filterTypes = filterTypes
        self.onCloseDrawer = onCloseDrawer
        self.onClearFilters = onClearFilters
        self.onApplyFilters = onApplyFilters
    }
    
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: Size.zero) {
                    if let sectionTitle = sectionTitle, !sectionTitle.isEmpty {
                        SirioText(text: sectionTitle, typography: .headlineMdHeavy)
                            .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                            .frame(minHeight: Size.Filtri.sectionTitleFrame)
                            .padding(.horizontal, Size.s16)
                    }
                    
                    SirioFiltriAction(title: title, onTap: {
                        showFiltri.toggle()
                    })
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onChange(of: geo.frame(in: .named("scroll"))) { frame in
                                    let minY = frame.minY
                                    let maxY = frame.maxY
                                    let screenHeight = UIScreen.main.bounds.height
                                    
                                    // Se la vista è completamente sopra o sotto lo schermo → non visibile
                                    let isVisible = maxY > 0 && minY < screenHeight
                                    self.scrollOffset = minY
                                    self.isHeaderVisible = isVisible
                                }
                        }
                    )
                    
                    SirioFiltriActive(initialFilterTypes: initialFilterTypes,
                                      filterTypes: $filterTypes)
                    
                    VStack(spacing: Size.s16) {
                        ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                            itemView(item)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.top, Size.p8)
                    .padding(.bottom, Size.p80)  // margine per non coprire la lista dal FAB
                    
                    //Spacer()
                }
            }
            .coordinateSpace(name: "scroll")
            
            if shouldShowFab {
                SirioFiltriFab(title: title, onTap: {
                    showFiltri.toggle()
                })
                .padding(.bottom, 0) // Default is safe area 34pt
                .transition(.scale.combined(with: .opacity))
                .animation(.easeInOut(duration: 0.25), value: shouldShowFab)
            }
        }
        .sirioFiltriDrawer(
            isPresented: $showFiltri,
            filterTypes: $filterTypes,
            initialFilterTypes: $initialFilterTypes,
            onTapClose: {
                onCloseDrawer?()
            }
        )
        .onAppear {
            if initialFilterTypes.isEmpty {
                initialFilterTypes = filterTypes
            }
        }
    }
    private var shouldShowFab: Bool {
        !isHeaderVisible
    }
}

#Preview {
    SirioFiltriTest()
}

struct SirioFiltriTest: View {
    struct FilterItem: Identifiable {
        let id = UUID()
        let title: String
    }
    @State private var filterTypes: [SirioFiltriType] = [
        .init(content: .sectionTitle(title: "Section Title", subtitle: .loremIpsum)),
        .init(content: .chips(
            texts: ["Valore selezionato", "Valore 1", "Valore 2", "Valore 3"],
            selectedTypes: [],
            selectionMode: .multiple,
            isDisabled: false,
            active: false
        )),
        .init(content: .select(
            textInfo: "Label",
            placeholder: "Placeholder",
            value: "",
            listItem: ["A", "B", "C", "D"],
            isDisabled: false,
            active: false
        )),
        .init(content: .date(
            textInfo: "Label",
            placeholder: "Placeholder",
            value: "",
            isDisabled: false,
            active: false
        )),
        .init(content: .toggle(isOn: false, text: "Label 1", active: false)),
        .init(content: .toggle(isOn: false, text: "Label 2", active: false)),
        .init(content: .sectionTitle(title: "Section Title", subtitle: "")),
        .init(content: .radioGroup(texts: ["Label 1", "Label 2"], selectedText: "", isDisabled: false, callback: { selected in
            print("Radio selezionato: \(selected ?? "nil")")
        }, active: false)),
        .init(content: .sectionTitle(title: "Section Title", subtitle: "")),
        .init(content: .checkbox(
            text: "Label 1",
            isChecked: false,
            isDisabled: false,
            callback: { checked in
                print("Checkbox cliccato: \(checked ?? "nil")")
            }, active: false
        )),
        .init(content: .checkbox(
            text: "Label 2",
            isChecked: false,
            isDisabled: false,
            callback: { checked in
                print("Checkbox cliccato: \(checked ?? "nil")")
            }, active: false
        ))
    ]
    
    private let allItems = [
        "Toggle","Date","Toggle","Select","Select","Radio","Check",
        "Select","Radio","Radio","Date","Select","Chips","Chips"
    ].map { FilterItem(title: $0) }
    
    @State private var list: [FilterItem] = [
        "Toggle","Date","Toggle","Select","Select","Radio","Check",
        "Select","Radio","Radio","Date","Select","Chips","Chips"
    ].map { FilterItem(title: $0) }
    
    var body: some View {
        SirioFiltri(
            sectionTitle: "Titolo della sezione",
            title: "Filtra",
            items: list,
            itemView: { item in
                SirioProcessCard(
                    schemeColor: .light,
                    title: item.title,
                    text: .loremIpsum,
                    type: .standard(
                        firstButtonText: "Text",
                        onTapFirstButtonAction: {
                            print("Premuto bottone nella card \(item.title)")
                        }
                    )
                )
            },
            filterTypes: $filterTypes,
            onClearFilters: {
                print("Clear filter")
            }, onApplyFilters: {
                print("Applied filter")
            }
        )
        .onChange(of: filterTypes) { newTypes in
            handleFilterChanges(newTypes)
        }
    }
    
    // MARK: - Handle filters
    private func handleFilterChanges(_ filters: [SirioFiltriType]) {
        var filter: [String] = []
        
        for type in filters {
            switch type.content {
                
            case .toggle(let isOn, _, _):
                if isOn {
                    filter += ["Toggle"]
                }
                
            case .select(_, _, let value, _, _, _):
                if !value.isEmpty {
                    filter += ["Select"]
                }
                
            case .checkbox(_, let isChecked, _, _, _):
                if isChecked {
                    filter += ["Check"]
                }
                
            case .radioGroup(_, let selectedText, _, _, _):
                if !selectedText.isEmpty {
                    filter += ["Radio"]
                }
                
            case .date(_,_, let value, _, _):
                if !value.isEmpty {
                    filter += ["Date"]
                }
                
            case .chips(_, let selected, _, _, _):
                if !selected.isEmpty {
                    filter += ["Chips"]
                }
            default:
                break
            }
        }
        
        if filter.isEmpty {
            list = allItems
        } else {
            list = allItems.filter { item in
                filter.contains(item.title)
            }
        }
    }
}
