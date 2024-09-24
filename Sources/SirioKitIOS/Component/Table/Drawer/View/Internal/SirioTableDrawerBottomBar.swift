//
// SirioTableDrawerBottomBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI

public struct SirioTableDrawerBottomBar: View {
    public var text: String?
    public var data: [SirioIconData]
    public var onTapEllipsis: (() -> Void)?
    
    public var body: some View {
        HStack(spacing: Size.Table.Drawer.BottomBar.spacing) {
            if let text = text, data.count > 3 {
                SirioText(text: text, typography: .label_md_700)
                    .foregroundStyle(StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            Spacer()
            
            if data.count > 3  {
                Button(action: {
                    onTapEllipsis?()
                }, label: {
                    SirioIcon(data: .init(icon: .ellipsisH))
                        .frame(width: Size.Table.Drawer.BottomBar.Button.iconFrame, height: Size.Table.Drawer.BottomBar.Button.iconFrame)
                        .foregroundStyle(StyleDictionaryColor.aliasInteractivePrimary000Default.color)
                    
                })
                .frame(width: Size.Table.Drawer.BottomBar.Button.width, height: Size.Table.Drawer.BottomBar.Button.height)
            } else {
                ForEach(data) { datum in
                    SirioButtonIconOnly(style: .primary, size: .medium, iconData: datum, action: {
                        let _ = datum.action
                    })
                    .frame(width: Size.Table.Drawer.BottomBar.Button.width, height: Size.Table.Drawer.BottomBar.Button.height)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: Size.Table.Drawer.BottomBar.height)
        .padding(.horizontal, Size.Table.Drawer.BottomBar.paddingHorizontal)
        .background(StyleDictionaryColor.globalPrimary100.color)
    }
}
