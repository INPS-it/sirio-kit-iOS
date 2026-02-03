//
// ExampleAccordion.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleAccordion: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Accordion")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

// MARK: - Destinazioni interne e lista

extension ExampleAccordion {
    
    enum Destination: Hashable {
        case accordion
        case accordionGroup
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Accordion", action: {
                path.append(Destination.accordion)
            }),
            .default(title: "Accordion Group", action: {
                path.append(Destination.accordionGroup)
            })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .accordion:
            VSchemeSwitcher {
                ExampleAccordionSingle()
            }
            .navigationTitle("Accordion")
            .background(Color.colorBackground)
            
        case .accordionGroup:
            VSchemeSwitcher {
                ExampleAccordionGroup()
            }
            .navigationTitle("Accordion Group")
            .background(Color.colorBackground)
        }
    }
}
#Preview {
    ExampleAccordion(path: .constant(NavigationPath()))
    //ExampleAccordionSingle()
}

struct ExampleAccordionSingle: View {
    
    var body: some View{
        VStack {
            SirioAccordion(data: .init(title: "Accordion #1", content: {
                SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                    .foregroundColor(.black)
            }))
            
            SirioAccordion(data: .init(iconData: SirioIconData(icon: .cube),
                                       title: "Accordion Item #2",
                                       content: {
                SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                    .foregroundColor(.black)
            }, onTapAccordion: { isOpen in
                
            }))
            
            SirioAccordion(data: .init(title: "Accordion Item #3",
                                       text: "Text",
                                       content: {
                SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                    .foregroundColor(.black)
            }, onTapAccordion: { isOpen in
                
            }))
            
            SirioAccordion(data: .init(title: "Accordion Item #4",
                                       tag: "Tag",
                                       content: {
                SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                    .foregroundColor(.black)
            }, onTapAccordion: { isOpen in
                
            }))
            
            SirioAccordion(data: .init(title: "Accordion #5", content: {
                SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                    .foregroundColor(.black)
            }))
            
        }
        .padding(.horizontal)
    }
}

struct ExampleAccordionGroup: View {
    
    var body: some View {
        VStack(spacing: 16){
            SirioAccordionGroup(data: [
                .init(title: "Accordion #1", content: {
                    SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                        .foregroundColor(.black)
                }),
                .init(title: "Accordion #2", content: {
                    SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                        .foregroundColor(.black)
                }),
                .init(title: "Accordion #3", content: {
                    SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                        .foregroundColor(.black)
                })
            ])
            
            SirioAccordionGroup(data: [
                .init(iconData: SirioIconData(icon: .cube),
                      title: "Accordion Item #1",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      }),
                .init(iconData: SirioIconData(icon: .cube),
                      title: "Accordion Item #2",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      }),
                .init(iconData: SirioIconData(icon: .cube),
                      title: "Accordion Item #3",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      })
            ])
            
            
            SirioAccordionGroup(data: [
                .init(title: "Accordion Item #1",
                      text: "Text",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      }),
                .init(title: "Accordion Item #2",
                      text: "Text",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      }),
                .init(title: "Accordion Item #3",
                      text: "Text",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      })
            ])
            
            SirioAccordionGroup(data: [
                .init(title: "Accordion Item #1",
                      tag: "Tag",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      }),
                .init(title: "Accordion Item #2",
                      tag: "Tag",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      }),
                .init(title: "Accordion Item #3",
                      tag: "Tag",
                      content: {
                          SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                              .foregroundColor(.black)
                      }, onTapAccordion: { isOpen in
                          
                      })
            ])
            
            SirioAccordionGroup(data: [
                .init(title: "Accordion #1", content: {
                    SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                        .foregroundColor(.black)
                }),
                .init(title: "Accordion #2", content: {
                    SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                        .foregroundColor(.black)
                }),
                .init(title: "Accordion #3", content: {
                    SirioText(text: .loremIpsum, typography: .bodyMdRegular)
                        .foregroundColor(.black)
                })
            ])
            
        }
        .padding(.horizontal)
    }
}
