//
// ExampleCarousel.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleCarousel: View {
    
    struct News: Identifiable {
        var id = UUID()
        var icon: AwesomeIcon
        var title: String
        var subtitle: String
        var text: String
        var textButton: String
    }
    
    static var preview: [News] = [
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Button")
    ]
    
    @State var index = 0
    var items: [News] = []

    var body: some View {
        SirioCarousel(index: $index,
                      items: ExampleCarousel.preview,
                      content: { item in
            SirioProcessCard(schemeColor: .light, title: item.title, subtitle: item.subtitle, text: item.text, itemData: .init(firstButtonText: item.textButton, onTapFirstButtonAction: { }))
        })
        .navigationTitle("Carousel")
    }
}

#Preview {
    ExampleCarousel()
}
