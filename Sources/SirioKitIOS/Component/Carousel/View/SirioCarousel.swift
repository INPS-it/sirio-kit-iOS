//
// SirioCarousel.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A custom carousel (image slider) view that allows users to swipe through items horizontally,
/// with visual indicators and interactive controls.
///
/// - Parameters:
///   - index: A `Binding` that reflects the current index of the selected item in the carousel.
///   - items: An array of items that conform to the `Identifiable` protocol.
///   - content: A closure that takes each item and returns a `View` for that item.
///   - contentHeight: The fixed height for the carousel content (optional).

public struct SirioCarousel<Content: View, T: Identifiable>: View {
    // MARK: - Properties
    
    private let items: [T]
    private let content: (T) -> Content
    private let spacing: CGFloat = Size.s16
    private let maxItems: Int = 6
    private let contentHeight: CGFloat?
    @Binding private var index: Int
    private let showIndicator: Bool
    
    @State private var dragOffset: CGFloat = 0.0
    @State private var maxContentHeight: CGFloat = 10.0
    
    // MARK: - Init
    
    public init(index: Binding<Int>,
                items: [T],
                @ViewBuilder content: @escaping (T) -> Content,
                contentHeight: CGFloat? = nil,
                showIndicator: Bool = true) {
        
        if items.count > maxItems {
            #if DEBUG
            print("SirioCarousel warning: items have been limited to a maximum of \(maxItems).")
            #endif
        }
        
        let limitedItems = items.count > maxItems ? Array(items.prefix(maxItems)) : items
        
        self._index = index
        self.items = limitedItems
        self.content = content
        self.contentHeight = contentHeight
        self.showIndicator = showIndicator && !limitedItems.isEmpty
        
        // Normalizzazione dell’indice in init
        if !limitedItems.isEmpty && index.wrappedValue > limitedItems.count - 1 {
            index.wrappedValue = limitedItems.count - 1
        }
        if limitedItems.isEmpty {
            index.wrappedValue = 0
        }
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            if items.isEmpty {
                // Evitiamo di calcolare layout inutilmente
                EmptyView()
                    .frame(height: 0)
            } else {
                GeometryReader { reader in
                    buildCarousel(in: reader)
                }
                .frame(height: contentHeight ?? max(maxContentHeight, 10))
                .padding(.vertical, Size.p16)
            }
            
            if showIndicator, items.count > 1 {
                indicatorView
            }
        }
        .background(Color.globalPrimary000)
    }
    
    // MARK: - Carousel content
    
    private func buildCarousel(in reader: GeometryProxy) -> some View {
        let availableWidth = reader.size.width
        
        let peekAmount: CGFloat = 8.0
        let sidePadding = spacing + peekAmount
        
        let cardWidth = max(availableWidth - (sidePadding * 2), 0)
        let pageWidth = cardWidth + spacing
        
        let maxIndex = max(items.count - 1, 0)
        let safeIndex = clamp(index, min: 0, max: maxIndex)
        
        let baseOffset = -CGFloat(safeIndex) * pageWidth
        
        var alignmentShift: CGFloat = 0
        if safeIndex == 0 {
            alignmentShift = -peekAmount
        } else if safeIndex == maxIndex {
            alignmentShift = peekAmount
        }
        
        let totalOffset = baseOffset + alignmentShift + dragOffset
        
        return HStack(spacing: spacing) {
            ForEach(items) { item in
                content(item)
                    .frame(width: cardWidth)
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear {
                                    updateMaxHeight(proxy.size.height)
                                }
                                .onChange(of: proxy.size.height) { newHeight in
                                    updateMaxHeight(newHeight)
                                }
                        }
                    )
                    .frame(height: contentHeight)
            }
        }
        .padding(.horizontal, sidePadding)
        .offset(x: totalOffset)
        .contentShape(Rectangle())
        .gesture(dragGesture(cardWidth: cardWidth))
        // Hai già withAnimation nel dragGesture; qui può bastare l’animazione esplicita
        .animation(.snappy(duration: 0.4, extraBounce: 0.2), value: safeIndex)
    }
    
    // MARK: - Drag gesture
    
    private func dragGesture(cardWidth: CGFloat) -> some Gesture {
        DragGesture()
            .onChanged { value in
                guard !items.isEmpty else { return }
                
                let translation = value.translation.width
                let isFirst = index == 0 && translation > 0
                let isLast = index == items.count - 1 && translation < 0
                
                if isFirst || isLast {
                    dragOffset = translation / 3
                } else {
                    dragOffset = translation
                }
            }
            .onEnded { value in
                guard !items.isEmpty else {
                    withAnimation(.snappy(duration: 0.4, extraBounce: 0.2)) {
                        dragOffset = 0
                    }
                    return
                }
                
                guard cardWidth > 0 else {
                    withAnimation(.snappy(duration: 0.4, extraBounce: 0.2)) {
                        dragOffset = 0
                    }
                    return
                }
                
                let translation = value.translation.width
                let predicted = value.predictedEndTranslation.width
                let threshold = cardWidth / 2.0
                
                let currentIndex = clamp(index, min: 0, max: items.count - 1)
                var newIndex = currentIndex
                
                if translation < -threshold || predicted < -threshold {
                    newIndex = min(currentIndex + 1, items.count - 1)
                } else if translation > threshold || predicted > threshold {
                    newIndex = max(currentIndex - 1, 0)
                }
                
                withAnimation(.snappy(duration: 0.4, extraBounce: 0.2)) {
                    index = newIndex
                    dragOffset = 0
                }
            }
    }
    
    // MARK: - Indicator
    
    @ViewBuilder
    private var indicatorView: some View {
        HStack(alignment: .center, spacing: Size.zero) {
            ForEach(items.indices, id: \.self) { i in
                Capsule()
                    .fill(index == i
                          ? Color.Carousel.Dot.selected
                          : Color.Carousel.Dot.unselected)
                    .frame(
                        width: index == i
                        ? Size.Carousel.Indicator.currentIndexWidth
                        : Size.Carousel.Indicator.defaultWidth,
                        height: Size.Carousel.Indicator.height
                    )
                    .padding(Size.p4)
            }
        }
        .background(Color.globalPrimary000)
        .padding(.bottom, Size.p16)
    }
    
    // MARK: - Helpers
    
    private func clamp(_ value: Int, min: Int, max: Int) -> Int {
        Swift.min(Swift.max(value, min), max)
    }
    
    private func updateMaxHeight(_ newHeight: CGFloat) {
        guard newHeight > 0 else { return }
        if newHeight > maxContentHeight {
            maxContentHeight = newHeight
        }
    }
}

// MARK: - Test View

struct SirioCarouselTest: View {
    struct Item: Identifiable {
        let id = UUID()
    }
    
    static let preview: [Item] = Array(repeating: Item(), count: 10)
    @State var index: Int = 0
    
    var body: some View {
        SirioCarousel(
            index: $index,
            items: SirioCarouselTest.preview
        ) { _ in
            SirioProcessCard(
                schemeColor: .light,
                title: "Title",
                text: .loremIpsum,
                type: .standard(firstButtonText: "Text", onTapFirstButtonAction: {})
            )
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.3)
        SirioCarouselTest()
    }
}
