//
// SirioTableCellText.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCellText: View {
    var size: SirioTableSize
    var text: String
    @Binding var isChecked: Bool
    var parity: SirioTableCellParity
    var onTapCheckBoxAction: (() -> Void)?
    var width: CGFloat
    var height: CGFloat
    
    public init(size: SirioTableSize,
                text: String,
                isChecked: Binding<Bool>,
                parity: SirioTableCellParity,
                onTapCheckBoxAction: (() -> Void)? = nil,
                width: CGFloat = 0,
                height: CGFloat = 0){
        self.size = size
        self.text = text
        self._isChecked = isChecked
        self.parity = parity
        self.onTapCheckBoxAction = onTapCheckBoxAction
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            SirioCheckbox(text: text, isChecked: $isChecked, callback: { _ in
                // Azione di callback
                self.onTapCheckBoxAction?()
            })
            .padding(.horizontal, paddingHorizontal)
            .padding(.vertical, paddingVertical)
        }
        .frame(minWidth: width, minHeight: minHeight, alignment: .leading)
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
            SirioTableCellText(size: .small,
                                text: "Title",
                                isChecked: .constant(true),
                                parity: parity,
                                onTapCheckBoxAction: {})
            
        }
        
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCellText(size: .large,
                                text: "Title",
                                isChecked: .constant(true),
                                parity: parity,
                                onTapCheckBoxAction: {})
            
        }
    }.padding()
}
