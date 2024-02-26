//
// ExampleAccordion.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleAccordion: View {
    
    var body: some View {
        List {
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAccordionSingle()
                }
                .navigationTitle("Accordion")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Accordion", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAccordionGroup()
                }
                .navigationTitle("Accordion Group")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Accordion Group", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Accordion")
        .listStyle(GroupedListStyle())
    }
}

struct ExampleAccordion_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAccordion()
    }
}


struct ExampleAccordionSingle: View {
    
    var body: some View{
        VStack {
            Accordion(data: .init(text: "Accordion #1", content: {
                SirioText(text: .loremIpsum, typography: .label_md_600)
                    .foregroundColor(.black)
            }))
            
            Accordion(data: .init(text: "Accordion #1", content: {
                SirioText(text: .loremIpsum, typography: .label_md_600)
                    .foregroundColor(.black)
            }, isDisabled: true))
        }
    }
}

struct ExampleAccordionGroup: View {
    
    var body: some View {
        AccordionGroup(data: [
            .init(text: "Accordion #1", content: {
                SirioText(text: .loremIpsum, typography: .label_md_600)
                    .foregroundColor(.black)
            }),
            .init(text: "Accordion #2", content: {
                SirioText(text: .loremIpsum, typography: .label_md_600)
                    .foregroundColor(.black)
            }),
            .init(text: "Accordion #3", content: {
                SirioText(text: .loremIpsum, typography: .label_md_600)
                    .foregroundColor(.black)
            }, isDisabled: true)
        ])
    }
}
