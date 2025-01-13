//
// SirioTableDrawerItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioTableDrawerItem: View {
    
    var data: SirioTableDrawerItemData
    
    init(data: SirioTableDrawerItemData) {
        self.data = data
    }
    
    var body: some View {
        VStack(spacing: Size.Table.Drawer.Item.spacing){
            HStack {
                SirioText(text: data.title, typography: .label_md_600)
                    .foregroundStyle(Color.Table.Drawer.Item.default)
                Spacer()
            }
            
            HStack {
                SirioText(text: data.subtitle, typography: subtitleTypography, isUnderlined: data.type == .link)
                    .foregroundStyle(subtitleColor)
                Spacer()
            }
            
            Rectangle()
                .fill(Color.Table.Drawer.Item.line)
                .frame(maxWidth: .infinity)
                .frame(height: Size.Table.Drawer.Item.lineFrame)
        }
        .padding(Size.Table.Drawer.Item.padding)
    }
    
    var subtitleTypography: Typography {
        switch data.type {
        case .text:
            return Typography.Table.Drawer.Item.text
        case .date:
            return Typography.Table.Drawer.Item.date
        case .number:
            return Typography.Table.Drawer.Item.number
        case .link:
            return Typography.Table.Drawer.Item.link
        }
    }
    
    var subtitleColor: Color {
        if data.type == .link {
            return Color.Table.Drawer.Item.link
        }
        return Color.Table.Drawer.Item.default
    }
}

#Preview {
    VStack(spacing: 0) {
        
        SirioTableDrawerItem(data: SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Sottotitolo", type: .text))
        
        SirioTableDrawerItem(data: SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", type: .text))
                
        SirioTableDrawerItem(data: SirioTableDrawerItemData.init(title: "Titolo", subtitle: "00", type: .number))
        
        SirioTableDrawerItem(data: SirioTableDrawerItemData.init(title: "Titolo", subtitle: "11/03/2023", type: .date))
        
        SirioTableDrawerItem(data: SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Lorem Ipsum dolor sit amet", type: .link))
        
    }
}
