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
                    SirioEditorialCard(url: url, category: "Categoria", date: "13 Nov 2023", title: "Titolo della card", subtitle: "Sottotitolo", text: .loremIpsum, signature: "Firma Autore", iconsData: [.previewEllipsis, .previewHeart])
                        .padding()
                    
                    SirioEditorialCard(category: "Categoria", date: "13 Nov 2023", title: "Titolo della card", subtitle: "Sottotitolo", text: .loremIpsum, signature: "Firma Autore", iconsData: [.previewEllipsis, .previewHeart])
                        .padding()
                }
                .navigationTitle("Editorial Card")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Editorial Card", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ScrollView {
                    
                    SirioProcessCard(schemeColor: .light, icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, iconData: .previewEllipsis)
                        .padding()
                    
                    SirioProcessCard(schemeColor: .dark, icon: .book, date: "13 Nov 2023", title: "Titolo della card molto lungo su 2 righe", text: .loremIpsum, textButton: "Text", onTapButtonAction: {}, iconData: .previewEllipsis)
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

#Preview {
    ExampleCard()
}
