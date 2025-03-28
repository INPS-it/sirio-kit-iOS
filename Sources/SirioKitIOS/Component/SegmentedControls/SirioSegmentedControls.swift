//
// SirioSegmentedControls.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation
import SwiftUI

/// A segmented control component that can display either text options or icon-based options.
/// - Parameters:
///   - selectedIndex: The index of the currently selected option
///   - options: The list of text options to display (optional, used when displaying text-based segmented controls)
///   - icons: The list of icons to display (optional, used when displaying icon-based segmented controls)

public struct SirioSegmentedControls: View {
    @Binding var selectedIndex: Int
    var options: [String]?
    var icons: [SirioIconData]?
    
    public init(selectedIndex: Binding<Int>, options: [String]) {
        self._selectedIndex = selectedIndex
        self.options = options
        
    }
    
    public init(selectedIndex: Binding<Int>, icons: [SirioIconData]) {
        self._selectedIndex = selectedIndex
        self.icons = icons
    }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            if let options = options {
                createButtons(items: options, isOption: true)
            } else if let icons = icons {
                createButtons(items: icons, isOption: false)
            }
        }
        .padding(.horizontal, Size.SirioSegmentedControls.paddingHorizontal)
        .frame(height: Size.SirioSegmentedControls.height)
        .background(Color.SegmentedControls.background)
        .clipShape(RoundedRectangle(cornerRadius: Size.SirioSegmentedControls.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: Size.SirioSegmentedControls.cornerRadius)
                .stroke(Color.SegmentedControls.border, lineWidth: Size.SirioSegmentedControls.lineWidth)
        )
    }
    
    @ViewBuilder
    private func createButtons<T>(items: [T], isOption: Bool) -> some View {
        ForEach(items.indices, id: \.self) { index in
            Button(action: {
                withAnimation(.interactiveSpring()) {
                    selectedIndex = index
                }
            }) {
                if isOption, let options = options {
                    SirioButtonControls(text: options[index], isSelected: .constant(selectedIndex == index))
                } else if let icons = icons {
                    SirioButtonControls(iconData: icons[index], isSelected: .constant(selectedIndex == index))
                }
                addDividerIfNeeded(for: items, at: index)
            }
            .disabled(selectedIndex == index)
        }
    }
    
    @ViewBuilder
    private func addDividerIfNeeded<T>(for items: [T], at index: Int) -> some View {
        if let lastIndex = items.indices.last, index < lastIndex, selectedIndex != index, selectedIndex != index + 1 {
            Divider()
                .frame(width: Size.SirioSegmentedControls.Divider.width,
                       height: Size.SirioSegmentedControls.Divider.height)
                .background(Color.SegmentedControls.backgroundDivider)
                .clipShape(RoundedRectangle(cornerRadius: Size.SirioSegmentedControls.cornerRadius))
        }
    }
}

struct Test_SirioSegmentedControls: View {
    @State var selectedIndex: Int = 0
    var body: some View {
        SirioSegmentedControls(selectedIndex: $selectedIndex, options: ["Label", "Label", "Label", "Label", "Label"])
        
        SirioSegmentedControls(selectedIndex: $selectedIndex, icons: [.previewHeart, .previewHeart, .previewHeart, .previewHeart, .previewHeart])
    }
}

#Preview {
    Test_SirioSegmentedControls().padding()
}

