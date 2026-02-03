//
// SirioTableCellAction.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellAction: View {
    var size: SirioTableSize
    var parity: SirioTableCellParity
    var items: [SirioActionItem]
    var width: CGFloat
    var height: CGFloat
    @State var open: Bool = false
    
    public init(size: SirioTableSize,
                parity: SirioTableCellParity,
                items: [SirioActionItem],
                width: CGFloat = 0,
                height: CGFloat = 0){
        self.size = size
        self.parity = parity
        self.items = items
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        
        VStack(alignment: .center) {
            if items.count > 1 {
                SirioMoreAction(items: items, positionToOpen: .bottomLeft, isOpen: $open)
            } else if items.count == 1 {
                SirioButton(hierarchy: .ghostLight, size: .small, iconData: items[0].iconData, action: {
                    items[0].action?()
                })
            }
        }
        .frame(minWidth: width, minHeight: minHeight, alignment: .center)
        .background(backgroundColor)
        .overlay(
            VStack(spacing: Size.zero) {
                Spacer()
                Rectangle()
                    .frame(height: Size.Table.borderWidth) // bottom
                    .foregroundColor(borderColor)
            },
            alignment: .bottom
        )
        .overlay(
            HStack(spacing: Size.zero) {
                Spacer()
                Rectangle()
                    .frame(width: Size.Table.borderWidth) // trailing
                    .foregroundColor(borderColor)
            },
            alignment: .trailing
        )
    }
    
    
    private var paddingVertical: CGFloat {
        switch size {
        case .small: Size.Table.Padding.Vertical.small
        case .large: Size.Table.Padding.Vertical.large
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .small: Size.Table.Padding.Horizontal.small
        case .large: Size.Table.Padding.Horizontal.large
        }
    }
    
    private var minHeight: CGFloat {
        switch size {
        case .small:
            return max(height, Size.Table.Cell.Height.small)
        case .large:
            return max(height, Size.Table.Cell.Height.large)
        }
    }
    
    private var backgroundColor: Color {
        switch parity {
        case .even:
            return Color.aliasTextColorPrimaryLight40
        case .odd:
            return Color.aliasTextColorPrimaryLight0
        }
    }
    
    private var borderColor: Color {
        return Color.aliasTextColorPrimaryLight50
    }
}

#Preview {
    VStack{
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCellAction(size: .small,
                                  parity: parity,
                                  items: [.init(value: "#1", action: {}),
                                          .init(value: "2", action: {}),
                                          .init(value: "#3", action: {})])
        }
        
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCellAction(size: .large,
                                  parity: parity,
                                  items: [.init(value: "#1", action: {}),
                                          .init(value: "2", action: {}),
                                          .init(value: "#3", action: {})])
        }
    }.padding()
}


