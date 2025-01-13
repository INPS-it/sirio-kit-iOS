//
// ExampleFiltri.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleFiltri: View {
    var body: some View {
        List {
            // Selected
            NavigationLink(destination: {
                ExampleSirioFiltriSelected()
                    .navigationTitle("Filtri Selected")

            }, label: {
                SirioText(text: "Selected", typography: .label_md_400)
            })
            
            // Secondary
            NavigationLink(destination: {
                ExampleSirioFiltriDrawer()
                    .navigationTitle("Drawer")

            }, label: {
                SirioText(text: "Drawer", typography: .label_md_400)
            })
            
            // Tertiary Light
            NavigationLink(destination: {
                ExampleSirioFiltriTabs()
                    .navigationTitle("Filtri Tabs")

            }, label: {
                SirioText(text: "Tabs", typography: .label_md_400)

            })
           
        }
        .background(Color.colorBackground)
        .navigationTitle("Filtri")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleFiltri()
}

struct ExampleSirioFiltriSelected: View {
    @State var values: [String] = ["Valore A", "Valore B", "Valore C", "Valore D", "Valore E"]
    
    var body: some View {
        VStack {
            SirioFiltriSelected(values: $values, callback: { value in
                if let index = values.firstIndex(where: { $0 == value }) {
                    values.remove(at: index)
                }
            })
            Spacer()
        }
    }
}

struct ExampleSirioFiltriDrawer: View {
    var valuesChips: [String] = ["Valore 1", "Valore 2", "Valore 3", "Valore 4", "Valore 5"]
    @State var selectedType: String? = "Valore selezionato"
   
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SirioFiltriHeader(action: {})
                SirioFiltriRadio(text: "Title", isChecked: .constant(false))
                SirioFiltriCheckBox(text: "Title", isChecked: .constant(false))
                SirioFiltriToggle(text: "Title", isOn: .constant(false))
                SirioFiltriSectionTitle(text: "Section Title #")
                SirioFiltriChips(texts: valuesChips, selectedType: $selectedType, isWrapped: false)
                SirioFiltriChips(texts: valuesChips, selectedType: $selectedType, isWrapped: true)
                SirioFiltriInput(textInfo: "Label", placeholder: "Text", text: .constant(""))
            }
            SirioFiltriCTA(action1: {}, action2: {})
        }
        .background(Color.Filtri.Background.light)
    }
}

struct ExampleSirioFiltriTabs: View {
    @State var index1: Int = 0
    @State var index2: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                SirioFiltriTabs(items: [.init(text: "Label Tab 0"),
                                        .init(text: "Label Tab 1"),
                                        .init(text: "Label Tab 2"),
                                        .init(text: "Label Tab 3"),
                                        .init(text: "Label Tab 4")],
                                selectedIndex: $index1,
                                onSelectedTab: { value in },
                                withScroll: false)
                
                SirioFiltriTabs(items: [.init(text: "Label Tab 0"),
                                        .init(text: "Label Tab 1"),
                                        .init(text: "Label Tab 2"),
                                        .init(text: "Label Tab 3"),
                                        .init(text: "Label Tab 4")],
                                selectedIndex: $index2,
                                onSelectedTab: { value in },
                                withScroll: true)

                SirioFiltriInput(textInfo: "Label", placeholder: "Text", text: .constant(""))
                    .background(Color.red)

                SirioFiltriCheckBox(text: "Title", isChecked: .constant(false))
                SirioFiltriRadio(text: "Title", isChecked: .constant(false))
                SirioFiltriToggle(text: "Title", isOn: .constant(false))
            }
            SirioFiltriCTA(action1: {}, action2: {})
        }
        .background(Color.Filtri.Background.light)
    }
}
