//
//  SirioCarousel.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioCarouselBackground {
    case light
    case medium
}

public struct SirioCarousel<Content: View, T: Identifiable>: View {
    var items: [T]
    var content: (T) -> Content
    var spacing: CGFloat
    var trailingSpace: CGFloat
    var background: SirioCarouselBackground
    @Binding var index: Int
    @State var frameSize: CGSize = .zero

    public init(spacing: CGFloat = 15,
                trailingSpace: CGFloat = 80,
                index: Binding<Int>,
                items: [T],
                background: SirioCarouselBackground = .light,
                @ViewBuilder content: @escaping (T) -> Content) {
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.items = Array(items.prefix(6))
        self.background = background
        self.content = content
        self.items.count > 6 ? print("The items should be a maximum of 6.") : nil
    }

    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0

    public var body: some View {
        VStack(alignment: .center) {
            GeometryReader { proxy in
                let width = proxy.size.width - (trailingSpace - spacing)
                let adjustmentWidth = (trailingSpace / 2) - spacing

                HStack(spacing: spacing) {
                    ForEach(items) { item in
                        content(item)
                            .frame(width: proxy.size.width - trailingSpace)
                            .readSize { size in
                                frameSize = size
                            }
                    }
                }
                .padding(.horizontal, spacing)
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
                .gesture(
                    DragGesture()
                        .updating($offset) { value, out, _ in
                            out = value.translation.width
                        }
                        .onEnded { value in
                            let offsetX = value.translation.width
                            let progress = -offsetX / width
                            let roundIndex = progress.rounded()
                            currentIndex = max(min(currentIndex + Int(roundIndex), items.count - 1), 0)
                            index = currentIndex
                        }
                        .onChanged { value in
                            let offsetX = value.translation.width
                            let progress = -offsetX / width
                            let roundIndex = progress.rounded()
                            index = max(min(currentIndex + Int(roundIndex), items.count - 1), 0)
                        }
                )
            }
            .frame(height: frameSize.height)
            .animation(.easeInOut, value: offset == 0)

            indicator()
        }
        .padding(.top)
        .background(background == .light ? Color.Carousel.Background.light : Color.Carousel.Background.medium)
    }

    @ViewBuilder
    func indicator() -> some View {
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: Size.Carousel.Indicator.spacing) {
                ForEach(items.indices, id: \.self) { index in
                    Button(action: {
                        self.currentIndex = index
                    }) {
                        Capsule()
                            .fill(items[currentIndex].id == items[index].id ? Color.Carousel.Dot.selected : Color.Carousel.Dot.unselected)
                            .frame(width: items[currentIndex].id == items[index].id ? Size.Carousel.Indicator.currentIndexWidth : Size.Carousel.Indicator.defaultWidth, height: Size.Carousel.Indicator.height)
                            .id(index)
                    }
                }
            }
        }
        .padding(.horizontal, Size.Carousel.Indicator.paddingHorizontal)
    }
}

#Preview {
    SirioCarouselPreview()
}

struct SirioCarouselPreview: View {
    
    struct News: Identifiable {
        var id = UUID()
        var icon: AwesomeIcon = .book
        var date: String
        var title: String
        var text: String
        var textButton: String
        
        
        static var preview: [News] = [
            .init(date: "15/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "16/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "17/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2024", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "19/01/2024", title: "Title", text: .loremIpsum, textButton: "Button")
        ]
    }
    
    @State var index = 0
    var items: [News] = []
    
    var body: some View {
        SirioCarousel(index: $index,
                      items: News.preview,
                      content: { item in
            SirioProcessCard(schemeColor: .light, icon: item.icon, date: item.date, title: item.title, text: item.text, textButton: item.textButton, onTapButtonAction: { })
        })
    }
}
