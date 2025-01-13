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
        var date: String
        var title: String
        var text: String
        var textButton: String
    }
    
    static var preview: [News] = [
        .init(icon: .book, date: "15/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "16/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "17/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "19/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "20/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "21/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "22/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "23/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "24/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "25/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "26/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
        .init(icon: .book, date: "27/01/2025", title: "Title", text: .loremIpsum, textButton: "Button")
    ]
    
    @State var index = 0
    var items: [News] = []

    var body: some View {
        SirioCarousel(index: $index,
                      items: ExampleCarousel.preview,
                      content: { item in
            SirioProcessCard(schemeColor: .light, icon: item.icon, date: item.date, title: item.title, text: item.text, textButton: item.textButton, onTapButtonAction: { })
        })
        .navigationTitle("Carousel")
    }
}

#Preview {
    ExampleCarousel()
}
