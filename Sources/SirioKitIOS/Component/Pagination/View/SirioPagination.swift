//
// SirioPagination.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
    @Binding var isDisabled: Bool // All component
    @State private var isDisabledButtonLeft: Bool = false // Left button
    @State private var isDisabledButtonRight: Bool = false // Right button
    var accessibilityLabelLeftButton: String?
    var accessibilityLabelTile: String?
    var accessibilityLabelRightButton: String?
    
    public init(selectedPage: Binding<Int>,
                numberOfPages: Int,
                isDisabled: Binding<Bool> = .constant(false),
                accessibilityLabelLeftButton: String? = nil,
                accessibilityLabelTile: String? = nil,
                accessibilityLabelRightButton: String? = nil){
        self._selectedPage = selectedPage
        self.numberOfPages = numberOfPages
        self._isDisabled = isDisabled
        self.paginationViewModel = SirioPaginationViewModel(selectedPage: selectedPage.wrappedValue, numberOfPages: numberOfPages)
        self.accessibilityLabelLeftButton = accessibilityLabelLeftButton
        self.accessibilityLabelTile = accessibilityLabelTile
        self.accessibilityLabelRightButton = accessibilityLabelRightButton
    }
    
    public var body: some View {
        VStack {
            HStack {
                SirioButton(hierarchy: .ghost,
                            size: .large,
                            text: nil,
                            iconData: .init(icon: .angleLeft),
                            isDisabled: $isDisabledButtonLeft,
                            action: {
                    if selectedPage > 0 {
                        selectedPage -= 1
                    }
                }, accessibilityLabel: accessibilityLabelLeftButton)
                
                Spacer()
                
                HStack(alignment: .center, spacing: Size.zero){
                    if paginationViewModel.availableWidth == 0 {
                        Spacer()
                    } else if paginationViewModel.availableWidth > 0 {
                        ForEach(paginationViewModel.generatePages(), id: \.self) { current in
                            if current == -1 {
                                dots
                            } else {
                                let number = current + 1
                                SirioPaginationTile(number: number,
                                                    isSelected: selectedPage == current ,
                                                    isDisabled: isDisabled,
                                                    action: {
                                    if !isDisabled && selectedPage != current {
                                        self.selectedPage = current
                                    }
                                }, accessibilityLabel: accessibilityLabelTile)
                            }
                        }
                    }
                }
                .readSize { size in
                    paginationViewModel.availableWidth = size.width
                }
                
                Spacer()
                
                SirioButton(hierarchy: .ghost,
                            size: .large,
                            text: nil,
                            iconData: .init(icon: .angleRight),
                            isDisabled: $isDisabledButtonRight,
                            action: {
                    if selectedPage < numberOfPages - 1 {
                        selectedPage += 1
                    }
                }, accessibilityLabel: accessibilityLabelRightButton)
            }
            .padding(.horizontal, Size.Pagination.paddingHorizontal)
        }
        .onChange(of: selectedPage, perform: { newValue in
            print("On Change ->  \(newValue)")
            if !isDisabled {
                if newValue <= 0 {
                    self.isDisabledButtonLeft = true
                } else if newValue >= numberOfPages - 1 {
                    self.isDisabledButtonRight = true
                } else {
                    self.isDisabledButtonLeft = false
                    self.isDisabledButtonRight = false
                }
            }
        })
        .onAppear {
            // Left and Right buttons management
            DispatchQueue.main.async {
                if self.$isDisabled.wrappedValue {
                    self.isDisabledButtonLeft = self.$isDisabled.wrappedValue
                    self.isDisabledButtonRight = self.$isDisabled.wrappedValue
                } else {
                    self.isDisabledButtonLeft = self.$selectedPage.wrappedValue == 0
                    self.isDisabledButtonRight = self.$selectedPage.wrappedValue == self.numberOfPages-1
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

struct ExamplePagination: View {
    @State var selectedPage: Int = 0
    @State var isDisabled: Bool = false
    
    var body: some View {
        SirioPagination(selectedPage: $selectedPage, numberOfPages: 10, isDisabled: $isDisabled)
    }
}

#Preview {
    ExamplePagination()
}
