//
// ExamplePopover.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExamplePopover: View {

    @Binding var path: NavigationPath

    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Popover")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExamplePopover {

    enum Destination: Hashable {
        case popover
        case demo
    }

    var items: [SirioListItemModel] {
        [
            .default(title: "Popover", action: { path.append(Destination.popover) }),
            .default(title: "Demo", action: { path.append(Destination.demo) }),
        ]
    }

    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
            
        case .popover:
            ScrollView {
                VStack(alignment: .leading) {
                    SirioPopover(
                        title: "Titolo",
                        subtitle: "Lorem ipsum sed eu consequat cras vitae eros."
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)

                    SirioPopover(
                        title: nil,
                        subtitle: "Lorem ipsum sed eu consequat cras vitae eros."
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)

                    SirioPopover(
                        title: "Titolo",
                        subtitle: "Lorem ipsum sed eu consequat cras vitae eros.",
                        textButton: "Azione",
                        onTapButton: { print("Azione tapped") }
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .background(Color.colorBackground)
            .navigationTitle("Popover")
            
        case .demo:
            ScrollView {
                VStack {
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverTitle: "Titolo Popover",
                        popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label lorem ipsum dolor sit amet",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverTitle: "Titolo Popover",
                        popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Testo descrizione"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label lorem ipsum dolor sit amet",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Testo descrizione"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Testo descrizione"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label lorem ipsum dolor sit amet",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Testo descrizione"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Testo descrizione"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label lorem ipsum dolor sit amet",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga e spazio insufficente per essere mostrato sotto la label"
                    )
                    .padding()
                    
                    SirioGenericTextField(
                        type: .constant(.info),
                        textInfo: "Label",
                        placeholder: "Text",
                        value: .constant(""),
                        popoverSubtitle: "Questo caso d’uso illustra il comportamento del popover con una descrizione lunga e spazio insufficente per essere mostrato sotto la label"
                    )
                    .padding()
                    
                }
            }
            .background(Color.colorBackground)
            .navigationTitle("Popover Demo")
        }
        
                
    }
}

#Preview {
    NavigationStack {
        ExamplePopover(path: .constant(NavigationPath()))
    }
}
