//
// PaginationCursorNumber.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A viewmodel that manage Pagination
/// - Parameters:
///   - numberOfPages: The number of pages in pagination component
///   - selectedPage: The current page
import SwiftUI

final class SirioPaginationViewModel: ObservableObject {
    var numberOfPages: Int {
        didSet {
            numberOfPages = max(1, numberOfPages)
            selectedPage = min(max(0, selectedPage), numberOfPages - 1)
            computeIndex()
        }
    }

    // larghezze/spazi del singolo item (dal DS)
    private let itemWidth: CGFloat
    private let itemSpacing: CGFloat

    // Calcolata e clampata dal View
    @Published var availableWidth: CGFloat = 0 {
        didSet { computeIndex() }
    }

    @Published var startIndex: Int = 0
    @Published var endIndex: Int = 0
    @Published var selectedPage: Int {
        didSet {
            selectedPage = min(max(0, selectedPage), numberOfPages - 1)
            computeIndex()
        }
    }

    private var lastIndex: Int { numberOfPages - 1 }

    // Quanti item visibili: per avere N tile serve N*W + (N-1)*S <= available
    //  => N <= (available + S) / (W + S)
    private var numberOfVisibleItems: Int {
        let usable = max(0, availableWidth)
        let W = max(1, itemWidth)        // evita /0
        let S = max(0, itemSpacing)
        let n = Int(floor((usable + S) / (W + S)))
        return max(1, min(numberOfPages, n))
    }

    private var previousButtons: Int { numberOfVisibleItems / 2 }
    private var followingButtons: Int { (numberOfVisibleItems - 1) / 2 }

    init(selectedPage: Int,
         numberOfPages: Int,
         itemWidth: CGFloat,
         itemSpacing: CGFloat) {
        self.numberOfPages = max(1, numberOfPages)
        self.selectedPage = min(max(0, selectedPage), max(0, numberOfPages - 1))
        self.itemWidth = max(1, itemWidth)
        self.itemSpacing = max(0, itemSpacing)
        computeIndex()
    }

    private func computeIndex() {
        var start = selectedPage - previousButtons
        var end   = selectedPage + followingButtons

        if start < 0 {
            end += -start
            start = 0
        }
        if end > lastIndex {
            if start > 0 {
                start -= end - lastIndex
            }
            end = lastIndex
        }
        if start < 0 { start = 0 }
        if end < 0 { end = 0 }
        if start > end {
            start = min(start, lastIndex)
            end = start
        }
        startIndex = start
        endIndex = end
    }

    func generatePages() -> [Int] {
        guard numberOfPages > 0 else { return [] }
        guard startIndex <= endIndex else { return [selectedPage] }

        var array: [Int] = Array(startIndex...endIndex)

        if startIndex != 0 {
            array[0] = 0
            if array.count > 2 { array[1] = -1 } // dots
        }

        if endIndex != lastIndex {
            array[array.count - 1] = lastIndex
            if array.count > 2 { array[array.count - 2] = -1 } // dots
        }

        return array
    }
}
