//
//  SirioMoreAction.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//
import SwiftUI

public struct SirioMoreAction: View {
    let hierarchy: SirioButtonHierarchy
    let text: String?
    let items: [SirioDropdownMenuItem]
    let positionToOpen: SirioDropdownMenuPosition
    let nVisibleItems: Int = 3

    @Binding var isOpen: Bool
    
    public init(hierarchy: SirioButtonHierarchy = .ghost, text: String? = nil, items: [SirioDropdownMenuItem], positionToOpen: SirioDropdownMenuPosition, isOpen: Binding<Bool>) {
        self.hierarchy = hierarchy
        self.text = text
        self.items = items
        self.positionToOpen = positionToOpen
        self._isOpen = isOpen
    }
    
    private var iconData: SirioIconData {
        .init(icon: text != nil ? .angleDown : .ellipsisV)
    }
    
    public var body: some View {
        ZStack {
            SirioButton(hierarchy: hierarchy, size: .medium, text: text, iconData: iconData) {
                withAnimation(.easeInOut) {
                    isOpen.toggle()
                }
            }
            .zIndex(1)
            .overlay(alignment: alignment) {
                if isOpen {
                    SirioDropdownMenu(items: items, isOpen: $isOpen)
                    .offset(x: 0, y: yOffset)
                    .zIndex(2)
                }
            }
        }
    }
    
    private var alignment: Alignment {
        switch positionToOpen {
        case .topLeft:
            return .topTrailing
        case .topRight:
            return .topLeading
        case .bottomLeft:
            return .bottomTrailing
        case .bottomRight:
            return .bottomLeading
        }
    }
    
    private var yOffset: CGFloat {
        let dropdownHeight = CGFloat(min(items.count, nVisibleItems) * Int(Size.DropdownMenu.singleItemHeight))
        let spacing: CGFloat = Size.s8
        
        switch positionToOpen {
        case .topLeft, .topRight:
            return -(dropdownHeight + spacing)
        case .bottomLeft, .bottomRight:
            return dropdownHeight + spacing
        default: return 0
        }
    }
}


#Preview("Popup"){
    VStack {
        
        HStack {
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .topRight, isOpen: .constant(true))
            
            Spacer()
            
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .topLeft, isOpen: .constant(true))
        }
        
        Spacer().frame(height: 250)
        
        HStack {
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .bottomRight, isOpen: .constant(true))
            
            Spacer()
            
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .bottomLeft, isOpen: .constant(true))
        }
    }
    .padding()
}
