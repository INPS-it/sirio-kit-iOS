//
// SirioTableDrawerTitle.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioTableDrawerTitle: View {
    
    var title: String
    var onTapClose: (() -> Void)?
    
    init(title: String, onTapClose: (() -> Void)? = nil) {
        self.title = title
        self.onTapClose = onTapClose
    }
    
    var body: some View {
        VStack(spacing: Size.zero){
            HStack {
                Spacer()
                
                SirioButton(hierarchy: .ghostLight, size: .medium, iconData: .init(icon: .times), action: {
                    onTapClose?()
                })
            }
            .padding(.vertical, Size.p12)

            
            HStack {
                SirioText(text: title, typography: Typography.Table.Drawer.Header.title)
                    .foregroundStyle(Color.Table.Drawer.Header.title)
                Spacer()
            }
            .padding(.bottom, Size.p16)
        }
        .padding(.horizontal, Size.p24)
        .background(Color.aliasBackgroundColorPrimaryLight0)
    }
}

#Preview {
    SirioTableDrawerTitle(title: "Titolo", onTapClose: {})
}
