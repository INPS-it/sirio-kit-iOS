//
// SirioPagination.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A pagination component that allows the user to navigate through pages.
/// - Parameters:
///   - selectedPage: The index of the selected page.
///   - numberOfPages: The total number of pages to handle.
///   - paginationViewModel: An observable object that manages the logic of the pagination component.
///   - isDisabled: Whether the component allows page changes.
///   - accessibilityLabelLeftButton: A string that identifies the left button accessibility element.
///   - accessibilityLabelTile: A string that identifies the tile accessibility element.
///   - accessibilityLabelRightButton: A string that identifies the right button accessibility element.

public struct SirioPagination: View {
    @Binding var selectedPage: Int
    var numberOfPages: Int
    @ObservedObject var paginationViewModel: SirioPaginationViewModel
    @Binding var isDisabled: Bool
    
    var accessibilityLabelLeftButton: String?
    var accessibilityLabelTile: String?
    var accessibilityLabelRightButton: String?

    
    @State private var isDisabledButtonLeft: Bool = false
    @State private var isDisabledButtonRight: Bool = false
    
    // Misura del container esterno
    @State private var containerWidth: CGFloat = 0

    // Spazio utile = total - padding esterni - spacer minimi - bottoni fissi
    private var usableTilesWidth: CGFloat {
        let horizontalPadding = 2 * Size.Pagination.paddingHorizontal
        let sideSpacers       = 2 * Size.Pagination.paddingHorizontalButton
        let buttons           = 2 * Size.Pagination.Button.width
        return max(0, containerWidth - horizontalPadding - sideSpacers - buttons)
    }

    public init(selectedPage: Binding<Int>,
                numberOfPages: Int,
                isDisabled: Binding<Bool> = .constant(false),
                accessibilityLabelLeftButton: String? = nil,
                accessibilityLabelTile: String? = nil,
                accessibilityLabelRightButton: String? = nil) {
        self._selectedPage = selectedPage
        self.numberOfPages = numberOfPages
        self._isDisabled = isDisabled
        self.paginationViewModel = SirioPaginationViewModel(
            selectedPage: selectedPage.wrappedValue,
            numberOfPages: numberOfPages,
            itemWidth: 38,
            itemSpacing: 4                              // oppure Size.Pagination.itemSpacing
        )
        self.accessibilityLabelLeftButton = accessibilityLabelLeftButton
        self.accessibilityLabelTile = accessibilityLabelTile
        self.accessibilityLabelRightButton = accessibilityLabelRightButton
    }

    private var leftButton: some View {
        SirioButton(
            hierarchy: .ghost,
            size: .large,
            text: nil,
            iconData: .init(icon: .angleLeft),
            isDisabled: $isDisabledButtonLeft,
            action: { if selectedPage > 0 { selectedPage -= 1 } },
            accessibilityLabel: accessibilityLabelLeftButton
        )
        .frame(width: Size.Pagination.Button.width)
    }

    private var rightButton: some View {
        SirioButton(
            hierarchy: .ghost,
            size: .large,
            text: nil,
            iconData: .init(icon: .angleRight),
            isDisabled: $isDisabledButtonRight,
            action: { if selectedPage < numberOfPages - 1 { selectedPage += 1 } },
            accessibilityLabel: accessibilityLabelRightButton
        )
        .frame(width: Size.Pagination.Button.width)
    }

    public var body: some View {
        VStack {
            HStack {
                leftButton
                Spacer(minLength: Size.Pagination.paddingHorizontalButton)

                // Usa LO SPACING dell’HStack (niente padding per-item)
                HStack(alignment: .center, spacing: Size.Pagination.spacing) {
                    if paginationViewModel.availableWidth <= 0 {
                        Spacer()
                    } else {
                        let pages = paginationViewModel.generatePages()
                        ForEach(Array(pages.enumerated()), id: \.offset) { _, current in
                            if current == -1 {
                                dots
                            } else {
                                SirioPaginationTile(
                                    number: current + 1,
                                    isSelected: selectedPage == current,
                                    isDisabled: isDisabled,
                                    action: {
                                        if !isDisabled && selectedPage != current {
                                            selectedPage = current
                                        }
                                    },
                                    accessibilityLabel: accessibilityLabelTile
                                )
                            }
                        }
                    }
                }
                .frame(maxWidth: usableTilesWidth)
                .clipped()
                .readSize { size in
                    let clamped = min(size.width, usableTilesWidth)
                    if abs(paginationViewModel.availableWidth - clamped) > 0.5 {
                        withTransaction(Transaction(animation: nil)) {
                            paginationViewModel.availableWidth = clamped
                        }
                    }
                }

                Spacer(minLength: Size.Pagination.paddingHorizontalButton)
                rightButton
            }
            .padding(.horizontal, Size.Pagination.paddingHorizontal)
        }
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear { containerWidth = proxy.size.width }
                    .onChange(of: proxy.size.width) { w in containerWidth = w }
            }
        )
        .onChange(of: selectedPage) { newValue in
            if !isDisabled {
                isDisabledButtonLeft  = newValue <= 0
                isDisabledButtonRight = newValue >= numberOfPages - 1
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                if isDisabled {
                    isDisabledButtonLeft = true
                    isDisabledButtonRight = true
                } else {
                    isDisabledButtonLeft  = selectedPage == 0
                    isDisabledButtonRight = selectedPage == numberOfPages - 1
                }
            }
        }
        .frame(height: Size.Pagination.height)
        .background(Color.Pagination.Background.default)
    }

    private var dots: some View {
        SirioText(text: "..", typography: Typography.Pagination.dots)
            .frame(width: Size.Pagination.Dots.width, height: Size.Pagination.Dots.height)
            .foregroundColor(Color.Pagination.Dots.default)
    }
}

// MARK: - Example
struct ExamplePagination: View {
    @State var selectedPage: Int = 0
    @State var isDisabled: Bool = false

    var body: some View {
        SirioPagination(
            selectedPage: $selectedPage,
            numberOfPages: 10,
            isDisabled: $isDisabled
        )
    }
}

#Preview {
    ExamplePagination()
}
