//
// SirioTableDrawerHeader.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioTableDrawerHeader: View {
    
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
                SirioIcon(data: .init(icon: .times))
                    .frame(width: Size.Table.Drawer.Header.frame, height: Size.Table.Drawer.Header.frame)
                    .foregroundStyle(Color.Table.Drawer.Header.icon)
            }
            .padding(.bottom, Size.Table.Drawer.paddingBottom)
            
            HStack {
                SirioText(text: title, typography: Typography.Table.Drawer.Header.title)
                    .foregroundStyle(Color.Table.Drawer.Header.title)
                Spacer()
            }
            

        }
        .padding(.horizontal, Size.Table.Drawer.Header.paddingHorizontal)
    }
}

#Preview {
    SirioTableDrawerHeader(title: "Titolo", onTapClose: {})
}
