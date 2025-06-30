//
// ExampleCard.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI
import SirioKitIOS

struct ExampleCard: View {
    var url = URL(string: "https://www.inps.it/content/dam/inps-site/immagini/lavoro/INPS_congedi_EX%2001.svg")!

    var body: some View {
        List {
            NavigationLink(destination: {
                ScrollView {
                    SirioEditorialCard(imageName: "image_editorial_card",
                                       bundle: .bundleModule,
                                       category: "Categoria",
                                       date: "13 Nov 2023",
                                       title: "Titolo della card",
                                       subtitle: "Sottotitolo",
                                       text: .loremIpsum,
                                       iconsData: [.previewShare, .previewBookmark])
                    .padding()
                    
                    SirioEditorialCard(category: "Categoria",
                                       date: "13 Nov 2023",
                                       title: "Titolo della card",
                                       subtitle: "Sottotitolo",
                                       text: .loremIpsum,
                                       iconsData: [.previewShare, .previewBookmark])
                    .padding()
                }
                .navigationTitle("Editorial Card")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Editorial Card", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ScrollView {
                    
                    viewProcessCardStandard
                        .padding()
                    viewProcessCardCtaInline
                        .padding()
                    viewProcessCardCtaBlock
                        .padding()
                    viewProcessCardCtaMoreAction
                        .padding()
                }
                .navigationTitle("Process Card")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Process Card", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Card")
        .listStyle(GroupedListStyle())
    }
    
    var viewProcessCardStandard: some View {
        VStack {
            SirioText(text: "Standard", typography: .labelMdHeavy)
            
            SirioProcessCard(schemeColor: .light, title: "Titolo della card molto molto molto molto lungo", iconData: .init(icon: .infoCircle), text: .loremIpsum, itemData: .init(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
            
            SirioProcessCard(schemeColor: .light, title: "Titolo della card", iconData: .init(icon: .infoCircle), subtitle: "Sottotitolo", text: .loremIpsum, itemData: .init(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
            
            SirioProcessCard(schemeColor: .dark, title: "Titolo della card", iconData: .init(icon: .infoCircle), subtitle: "Sottotitolo", text: .loremIpsum, itemData: .init(firstButtonText: "Text", onTapFirstButtonAction: {}), onTapCardAction: {})
        }
    }
    
    var viewProcessCardCtaInline: some View {
        VStack {
            SirioText(text: "CTA Inline", typography: .labelMdHeavy)
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card",
                             iconData: .init(icon: .infoCircle),
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             itemData: .init(firstButtonText: "Text",
                                             onTapFirstButtonAction: {},
                                             secondButtonText: "Text",
                                             onTapSecondButtonAction: {}),
                             cta: .inline,
                             onTapCardAction: {})
            
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card",
                             iconData: .init(icon: .infoCircle),
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             itemData: .init(firstButtonText: "Text",
                                             onTapFirstButtonAction: {},
                                             secondButtonText: "Text",
                                             onTapSecondButtonAction: {}),
                             cta: .inline,
                             onTapCardAction: {})
        }
    }
    
    var viewProcessCardCtaBlock: some View {
        VStack {
            SirioText(text: "CTA Block", typography: .labelMdHeavy)
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card molto molto molto molto lungo",
                             iconData: .init(icon: .infoCircle),
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             itemData: .init(firstButtonText: "Text",
                                             onTapFirstButtonAction: {},
                                             secondButtonText: "Text",
                                             onTapSecondButtonAction: {}),
                             cta: .block,
                             onTapCardAction: {})
            
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card molto molto molto molto lungo",
                             iconData: .init(icon: .infoCircle),
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             itemData: .init(firstButtonText: "Text",
                                             onTapFirstButtonAction: {},
                                             secondButtonText: "Text",
                                             onTapSecondButtonAction: {}),
                             cta: .block,
                             onTapCardAction: {})
            
        }
    }
    
    var viewProcessCardCtaMoreAction: some View {
        VStack {
            SirioText(text: "CTA More Action", typography: .labelMdHeavy)

            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card molto molto molto molto lungo",
                             iconData: .init(icon: .infoCircle),
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             itemData: .init(firstButtonText: "Text",
                                             onTapFirstButtonAction: {},
                                             menuItems: [
                                                 .init(value: "Action #1", action: {}),
                                                 .init(value: "Action #2", action: {}),
                                                 .init(value: "Action #3", action: {}),
                                                 
                                             ]),
                             onTapCardAction: {},
            )
            
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card molto molto molto molto lungo",
                             iconData: .init(icon: .infoCircle),
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             itemData: .init(firstButtonText: "Text",
                                             onTapFirstButtonAction: {},
                                             menuItems: [
                                                 .init(value: "Action #1", action: {}),
                                                 .init(value: "Action #2", action: {}),
                                                 .init(value: "Action #3", action: {}),
                                                 
                                             ]),
                             onTapCardAction: {},
                             )
        }
    }
}

#Preview {
    ExampleCard()
}



#Preview("CTA Block") {
    ScrollView {
        SirioProcessCard(schemeColor: .light,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Sottotitolo",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         secondButtonText: "Text",
                                         onTapSecondButtonAction: {}),
                         cta: .block,
                         onTapCardAction: {})
        
        SirioProcessCard(schemeColor: .dark,
                         title: "Titolo della card molto molto molto molto lungo",
                         iconData: .init(icon: .infoCircle),
                         subtitle: "Sottotitolo",
                         text: .loremIpsum,
                         itemData: .init(firstButtonText: "Text",
                                         onTapFirstButtonAction: {},
                                         secondButtonText: "Text",
                                         onTapSecondButtonAction: {}),
                         cta: .block,
                         onTapCardAction: {})
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
