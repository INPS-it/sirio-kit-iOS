//
//  SirioCarousel.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioCarouselBackground {
    case light
    case medium
}

/// A custom carousel (image slider) view that allows users to swipe through items horizontally, with visual indicators and interactive controls.
///
/// - Parameters:
///   - items: An array of items that conform to the `Identifiable` protocol. These items will be displayed in the carousel.
///   - content: A closure that takes each item and returns a `View` that represents how each item should be displayed in the carousel.
///   - spacing: The space between carousel items. Default is 15.
///   - trailingSpace: The amount of space to the right of the last item. Default is 80.
///   - background: The background color style of the carousel, either `.light` or `.medium`. Default is `.light`.
///   - index: A `Binding` that reflects the current index of the selected item in the carousel.

public struct SirioCarousel<Content: View, T: Identifiable>: View {
    private var items: [T]
    private var content: (T) -> Content
    private var spacing: CGFloat
    private var trailingSpace: CGFloat
    private var background: SirioCarouselBackground
    @Binding private var index: Int
    @State private var frameSize: CGSize = .zero
    @GestureState private var offset: CGFloat = 0
    @State private var currentIndex: Int = 0
    
    public init(spacing: CGFloat = 15,
                trailingSpace: CGFloat = 80,
                index: Binding<Int>,
                items: [T],
                background: SirioCarouselBackground = .light,
                @ViewBuilder content: @escaping (T) -> Content) {
        if items.count > 6 {
            print("Warning: The items have been limited to a maximum of 6.")
        }
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.items = items.count > 6 ? Array(items.prefix(6)) : items
        self.background = background
        self.content = content
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            GeometryReader { proxy in
                let width = proxy.size.width - (trailingSpace - spacing)
                
                HStack(spacing: spacing) {
                    ForEach(0..<items.count, id: \.self) { i in
                        content(items[i])
                            .frame(width: proxy.size.width - trailingSpace)
                            .readSize { size in
                                frameSize = size
                            }
                    }
                }
                .padding(.horizontal, spacing)
                .offset(x: calculateOffset(width: width))
                .gesture(
                    DragGesture()
                        .updating($offset) { value, out, _ in
                            let translationWidth = value.translation.width
                            // Trascinamento bloccato agli estremi
                            if (currentIndex == 0 && translationWidth > 0) || (currentIndex == items.count - 1 && translationWidth < 0) {
                                out = 0
                            } else {
                                out = translationWidth
                            }
                        }
                        .onEnded { value in
                            updateIndex(value: value, width: width)
                        }
                        .onChanged { value in
                            updateOngoingIndex(value: value, width: width)
                        }
                )
            }
            .frame(height: frameSize.height)
            .animation(.interpolatingSpring(stiffness: 200, damping: 20), value: currentIndex)
            
            indicator()
        }
        .padding(.top)
        .onChange(of: items.count) { newCount in
            if currentIndex >= newCount {
                withAnimation {
                    currentIndex = max(0, newCount - 1)
                    index = currentIndex
                }
            }
        }
        .background(background == .light ? Color.Carousel.Background.light : Color.Carousel.Background.medium)
    }
    
    private func calculateOffset(width: CGFloat) -> CGFloat {
        (CGFloat(currentIndex) * -width) + offset
    }
    
    private func updateIndex(value: DragGesture.Value, width: CGFloat) {
        let offsetX = value.translation.width
        let progress = -offsetX / width
        let newIndex = (progress > 0 ? ceil(progress) : floor(progress)) + CGFloat(currentIndex)
        currentIndex = max(min(Int(newIndex), items.count - 1), 0)
        index = currentIndex
    }
    
    private func updateOngoingIndex(value: DragGesture.Value, width: CGFloat) {
        let offsetX = value.translation.width
        let progress = -offsetX / width
        let newIndex = (progress > 0 ? ceil(progress) : floor(progress)) + CGFloat(currentIndex)
        index = max(min(Int(newIndex), items.count - 1), 0)
    }
    
    @ViewBuilder
    private func indicator() -> some View {
        HStack(alignment: .center, spacing: Size.Carousel.Indicator.spacing) {
            ForEach(items.indices, id: \.self) { index in
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.currentIndex = index
                        self.index = index
                    }
                }) {
                    Capsule()
                        .fill(currentIndex == index ? Color.Carousel.Dot.selected : Color.Carousel.Dot.unselected)
                        .frame(width: currentIndex == index ? Size.Carousel.Indicator.currentIndexWidth : Size.Carousel.Indicator.defaultWidth,
                               height: Size.Carousel.Indicator.height)
                        .id(index)
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
            .init(date: "15/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "16/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "17/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "18/01/2025", title: "Title", text: .loremIpsum, textButton: "Button"),
            .init(date: "19/01/2025", title: "Title", text: .loremIpsum, textButton: "Button")
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
