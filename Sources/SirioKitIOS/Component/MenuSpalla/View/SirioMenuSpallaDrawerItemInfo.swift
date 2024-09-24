//
// SirioMenuSpallaDrawerItemInfo.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioMenuSpallaDrawerItemInfo: View {
    var title: String
    var subtitle: String?
    
    public init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        HStack(spacing: Size.MenuSpalla.Drawer.ItemInfo.spacingHorizontal){
            SirioIcon(data: .init(icon: .user))
                .frame(width: Size.MenuSpalla.Drawer.ItemInfo.iconFrame,
                       height: Size.MenuSpalla.Drawer.ItemInfo.iconFrame)
                .foregroundStyle(Color.MenuSpalla.Drawer.ItemInfo.icon)
            
            VStack(alignment: .leading, spacing: Size.MenuSpalla.Drawer.ItemInfo.spacingVertical) {
                SirioText(text: title, typography: Typography.MenuSpalla.Drawer.ItemInfo.title)
                    .foregroundStyle(Color.MenuSpalla.Drawer.ItemInfo.text)
                if let subtitle = subtitle {
                    SirioText(text: subtitle, typography: Typography.MenuSpalla.Drawer.ItemInfo.subtitle)
                        .foregroundStyle(Color.MenuSpalla.Drawer.ItemInfo.text)
                }
            }
            Spacer()
        }
        .padding(.horizontal, Size.MenuSpalla.Drawer.ItemInfo.paddingHorizontal)
        .padding(.vertical, Size.MenuSpalla.Drawer.ItemInfo.paddingVertical)
        .background(Color.MenuSpalla.Drawer.ItemInfo.background)
    }
}

#Preview {
    SirioMenuSpallaDrawerItemInfo(title: "Mario Rossi", subtitle: "Profilo Cittadino")
}
