//
// ExampleFiltri.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleFiltri: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Filtri")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleFiltri {
    
    enum Destination: Hashable {
        case components
        case drawer
        case demo
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Components", action: { path.append(Destination.components) }),
            .default(title: "Drawer", action: { path.append(Destination.drawer) }),
            .default(title: "Demo", action: { path.append(Destination.demo) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .components:
            ScrollView {
                SirioText(text: "Chips", typography: .label_md_400)
                SirioFiltriChips(texts: ["Valore selezionato", "Valore 1", "Valore 2", "Valore 3"], selectedTypes: .constant(["Valore selezionato"]))
                SirioText(text: "Action", typography: .label_md_400)
                SirioFiltriAction(onTap: {})
                SirioText(text: "Fab", typography: .label_md_400)
                SirioFiltriFab(onTap: {})
                SirioText(text: "Selected", typography: .label_md_400)
                SirioFiltriSelected(values: .constant(["Valore A", "Valore B", "Valore C", "Valore D"]), callback: { _ in })
                Spacer()
            }
            .navigationTitle("Filtri Components")
            .background(Color.colorBackground)
            
        case .drawer:
            ScrollView {
                SirioFiltriAction(onTap: {})
                SirioFiltriTitle(title: "Section Title", subtitle: .loremIpsum2)
                SirioFiltriChips(texts: ["Valore 1", "Valore 2", "Valore 3", "Valore 4"], selectedTypes: .constant([""]))
                SirioFiltriSelect(textInfo: "Label", placeholder: "Text", value: .constant(""), listItem: ["Valore 1", "Valore 2", "Valore 3", "Valore 4"])
                SirioFiltriDate(textInfo: "Label", placeholder: "Text", value: .constant(""))
                SirioFiltriToggle(text: "Title", isOn: .constant(false))
                SirioFiltriRadio(text: "Title", isChecked: .constant(false))
                SirioFiltriCheckBox(text: "Title", isChecked: .constant(false))
                SirioFiltriButton(onClearAction: {}, onApplyAction: {})
                Spacer()
            }
            .navigationTitle("Filtri Drawer")
            .background(Color.colorBackground)
            
        case .demo:
            SirioFiltriTest()
                .navigationTitle("Demo Filtri")
                .navigationBarTitleDisplayMode(.inline)
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleFiltri(path: .constant(NavigationPath()))
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
            selectedTypes: nil,
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
        SirioAppNavigation {
            
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
            .setAppNavigationTitle(title: "Titolo")
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
                
            case .chips(_, let selected, _, _):
                if let selected = selected, !selected.isEmpty {
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
