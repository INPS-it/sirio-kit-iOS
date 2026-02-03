//
// ExampleCard.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI
import SirioKitIOS

struct ExampleCard: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Card")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleCard {
    
    enum Destination: Hashable {
        case editorial
        case process
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Editorial Card", action: {
                path.append(Destination.editorial)
            }),
            .default(title: "Process Card", action: {
                path.append(Destination.process)
            })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .editorial:
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
            
        case .process:
            ScrollView {
                viewProcessCardStandard.padding()
                viewProcessCardCtaInline.padding()
                viewProcessCardCtaBlock.padding()
                viewProcessCardCtaMoreAction.padding()
            }
            .navigationTitle("Process Card")
            .background(Color.colorBackground)
        }
    }
    
    var viewProcessCardStandard: some View {
        VStack {
            SirioText(text: "Standard", typography: .labelMdHeavy)
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card molto molto molto molto lungo",
                             text: .loremIpsum,
                             type: .standard(firstButtonText: "Text", onTapFirstButtonAction: {}),
                             onTapCardAction: {})
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .standard(firstButtonText: "Text", onTapFirstButtonAction: {}),
                             onTapCardAction: {})
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .standard(firstButtonText: "Text", onTapFirstButtonAction: {}),
                             onTapCardAction: {})
        }
    }
    
    var viewProcessCardCtaInline: some View {
        VStack {
            SirioText(text: "CTA Inline", typography: .labelMdHeavy)
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card",
                             
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .inline(firstButtonText: "Text",
                                           onTapFirstButtonAction: {},
                                           secondButtonText: "Text",
                                           onTapSecondButtonAction: {}),
                             onTapCardAction: {})
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .inline(firstButtonText: "Text",
                                           onTapFirstButtonAction: {},
                                           secondButtonText: "Text",
                                           onTapSecondButtonAction: {}),
                             onTapCardAction: {})
        }
    }
    
    var viewProcessCardCtaBlock: some View {
        VStack {
            SirioText(text: "CTA Block", typography: .labelMdHeavy)
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card molto molto molto molto lungo",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .block(firstButtonText: "Text",
                                          onTapFirstButtonAction: {},
                                          secondButtonText: "Text",
                                          onTapSecondButtonAction: {}),
                             onTapCardAction: {})
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card molto molto molto molto lungo",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .block(firstButtonText: "Text",
                                          onTapFirstButtonAction: {},
                                          secondButtonText: "Text",
                                          onTapSecondButtonAction: {}),
                             onTapCardAction: {})
        }
    }
    
    var viewProcessCardCtaMoreAction: some View {
        VStack {
            SirioText(text: "CTA More Action", typography: .labelMdHeavy)
            SirioProcessCard(schemeColor: .light,
                             title: "Titolo della card molto molto molto molto lungo",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .moreAction(firstButtonText: "Text",
                                               onTapFirstButtonAction: {},
                                               menuItems: [
                                                .init(value: "Action #1", action: {}),
                                                .init(value: "Action #2", action: {}),
                                                .init(value: "Action #3", action: {})
                                               ]),
                             onTapCardAction: {})
            SirioProcessCard(schemeColor: .dark,
                             title: "Titolo della card molto molto molto molto lungo",
                             subtitle: "Sottotitolo",
                             text: .loremIpsum,
                             type: .moreAction(firstButtonText: "Text",
                                               onTapFirstButtonAction: {},
                                               menuItems: [
                                                .init(value: "Action #1", action: {}),
                                                .init(value: "Action #2", action: {}),
                                                .init(value: "Action #3", action: {})
                                               ]),
                             onTapCardAction: {})
        }
    }
}

#Preview {
    ExampleCard(path: .constant(NavigationPath()))
}
