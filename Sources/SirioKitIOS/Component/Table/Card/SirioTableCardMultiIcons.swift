//
// SirioTableCardMultiIcons.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableCardMultiIcons: View {
    var icons: [SirioIconData]
    var parity: SirioTableCellParity
    var showSeparator: Bool

    public init(icons: [SirioIconData],
                parity: SirioTableCellParity,
                showSeparator: Bool = true) {
        if icons.count > 3 {
            print("⚠️ SirioTableCardMultiIcons: \(icons.count) icons provided, only the first 3 will be displayed.")
        }
        
        self.icons = Array(icons.prefix(3))
        self.parity = parity
        self.showSeparator = showSeparator
    }
    
    public var body: some View {
        HStack(spacing: Size.s24) {
            Spacer()
            
            ForEach(icons) { icon in
                SirioButton(hierarchy: .ghostLight, size: .small, iconData: icon, action: icon.action)
            }
        }
        .padding(.horizontal, Size.zero)
        .padding(.vertical, Size.p12)
        .frame(maxWidth: .infinity)
        .frame(height: 38)
        .background(backgroundColor)
        .if(showSeparator, transform: { view in
            view.overlay(
                VStack(spacing: Size.zero) {
                    Spacer()
                    Rectangle()
                        .frame(height: 1) // bottom
                        .foregroundColor(borderColor)
                        .padding(.horizontal, Size.zero)
                },
                alignment: .bottom
            )
        })
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
    
    private var textColor: Color {
        return Color.Table.Cell.link
    }
}



#Preview {
    VStack {
        ForEach(SirioTableCellParity.allCases, id: \.self) { parity in
            SirioTableCardMultiIcons(icons: [.init(icon: .filePdf, action: {}),
                                             .init(icon: .download, action: {}),
                                             .init(icon: .trash, action: {})],
                                     parity: parity)
        }
    }.padding()
}
