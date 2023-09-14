//
// ExampleCard.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
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
                    EditorialCard(url: url, category: "Categoria", date: "13 Nov 2023", title: "Titolo della card", subtitle: "Sottotitolo", text: .loremIpsum, signature: "Firma Autore", items: [.previewEllipsis, .previewHeart])
                        .padding()
                    
                    EditorialCard(category: "Categoria", date: "13 Nov 2023", title: "Titolo della card", subtitle: "Sottotitolo", text: .loremIpsum, signature: "Firma Autore", items: [.previewEllipsis, .previewHeart])
                        .padding()
                }
                .navigationTitle("Editorial Card")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Editorial Card", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ScrollView {
                    
                    ProcessCard(schemeColor: .light, icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, item: .previewEllipsis)
                        .padding()
                    
                    ProcessCard(schemeColor: .dark, icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, item: .previewEllipsis)
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
}

struct ExampleCard_Previews: PreviewProvider {
    static var previews: some View {
        ExampleCard()
    }
}
