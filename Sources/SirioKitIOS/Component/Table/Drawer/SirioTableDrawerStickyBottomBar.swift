//
// SirioTableDrawerStickyBottomBar.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableDrawerStickyBottomBar: View {
    var icons: [SirioIconData]
    
    public init(icons: [SirioIconData]) {
        if icons.count > 3 {
            print("⚠️ SirioTableCardMultiIcons: \(icons.count) icons provided, only the first 3 will be displayed.")
        }
        
        self.icons = Array(icons.prefix(3))
    }
    
    public var body: some View {
        HStack {
            HStack(spacing: Size.p24) {
                Spacer()
                
                ForEach(icons) { icon in
                    SirioButton(hierarchy: .primary, size: .medium, iconData: icon, action: icon.action)
                }
            }
            .padding(.horizontal, Size.p24)
            .padding(.vertical, Size.p12)
        }
        .frame(maxWidth: .infinity, maxHeight: Size.Table.Drawer.stickyBarHeight)
        .background(backgroundColor)
    }
    
    private var backgroundColor: Color {
        return Color.globalPrimary100
    }
    
    private var textColor: Color {
        return Color.Table.Cell.link
    }
}


#Preview {
    VStack {
        SirioTableDrawerStickyBottomBar(icons: [.init(icon: .filePdf, action: {}),
                                                .init(icon: .download, action: {}),
                                                .init(icon: .trash, action: {})])
    }.padding()
}
