//
// PaginationCursorNumber.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A viewmodel that manage Pagination
/// - Parameters:
///   - numberOfPages: The number of pages in pagination component
///   - selectedPage: The current page
class PaginationViewModel: ObservableObject {
    var numberOfPages: Int
    var numberOfVisibleItems: Int {
        min(numberOfPages, Int(availableWidth / Size.Pagination.Button.width))
    }
    @Published var startIndex: Int = 0
    @Published var endIndex: Int = 0
    @Published var availableWidth: CGFloat = 0 {
        didSet {
            computeIndex()
        }
    }
    @Published var selectedPage: Int
    
    private var lastIndex: Int {
        numberOfPages - 1
    }
    
    private var previousButtons: Int {
        numberOfVisibleItems / 2
    }
    
    private var followingButtons: Int {
        (numberOfVisibleItems - 1) / 2
    }
    
    init(selectedPage: Int, numberOfPages: Int){
        self.selectedPage = selectedPage
        self.numberOfPages = numberOfPages
        precondition(selectedPage >= 0 && numberOfPages >= 1, "Check the values assigned to 'selectedPage' and 'numberOfPages'")
        precondition(selectedPage < numberOfPages, "Selected page number is out of range")
    }
    
    private func computeIndex(){
        if availableWidth > 0 {
            startIndex = selectedPage - previousButtons
            endIndex = selectedPage + followingButtons
        }
        
        if startIndex < 0 {
            endIndex += 0 - startIndex
            startIndex = 0
        }
        
        if endIndex > lastIndex {
            if startIndex > 0 {
                startIndex -= endIndex - lastIndex
            }
            endIndex = lastIndex
        }
    }
    
    func generatePages() -> [Int] {
        var array: [Int] = Array(startIndex...endIndex)
        
        if startIndex != 0{
            array[0] = 0
            array[1] = -1 // -1 is dots view
        }
        
        if endIndex != lastIndex {
            array[array.endIndex-1] = lastIndex
            array[array.endIndex-2] = -1 // -1 is dots view
        }
        
        return array
    }
}
