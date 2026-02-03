//
// ExampleCarousel.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleCarousel: View {
    @State private var index = 0
    
    struct News: Identifiable {
        var id = UUID()
        var icon: AwesomeIcon
        var title: String
        var subtitle: String
        var text: String
        var textButton: String
    }
    
    static var preview: [News] = [
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Text"),
        .init(icon: .book, title: "Title", subtitle: .loremIpsum, text: .loremIpsum, textButton: "Text"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Text"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Text"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Text"),
        .init(icon: .book, title: "Title", subtitle: "Subtitle", text: .loremIpsum, textButton: "Text")
    ]
    
    var body: some View {
        SirioCarousel(index: $index,
                      items: ExampleCarousel.preview,
                      content: { item in
            
            SirioProcessCard(
                schemeColor: .light,
                title: item.title,
                text: .loremIpsum,
                type: .standard(firstButtonText: item.textButton, onTapFirstButtonAction: {})
            )
        }, contentHeight: 200)
        .navigationTitle("Carousel")
        .background(Color.colorBackground)
    }
}

#Preview {
    ExampleCarousel()
}
