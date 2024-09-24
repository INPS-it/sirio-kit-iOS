//
// SirioFiltriTitleBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
/// A view representing a title bar with a title and optional items.
///
/// - Parameters:
///   - schemeColor: The schemeColor of the component
///   - title: The title displayed in the title bar.
///   - items: An optional array of `TitleBarItemData` representing additional items to be displayed in the title bar.

public struct SirioFiltriTitleBar: View {
    var title: String
    @Binding var isOpen: Bool
    var onTapOpen: (() -> Void)?
    
    public init(title: String, isOpen: Binding<Bool>, onTapOpen: (() -> Void)? = nil) {
        self.title = title
        self._isOpen = isOpen
        self.onTapOpen = onTapOpen
    }
    
    public var body: some View {
        HStack {
            SirioText(text: title, typography: .h5_md)
                .foregroundStyle(textColor)
            
            Spacer()
            
            HStack {
                SirioIcon(data: .init(icon: .filter))
                    .foregroundStyle(iconColor)
                    .frame(width: Size.Filtri.TitleBar.Icon.frame, height: Size.Filtri.TitleBar.Icon.frame)
                
                SirioText(text: isOpen ? "Nascondi filtri" : "Mostra filtri", typography: .label_md_600)
                    .foregroundStyle(textColor)
                    .padding(.trailing)
            }
            .onTapGesture {
                self.isOpen.toggle()
                self.onTapOpen?()
            }
            .clipShape(Rectangle())
            
        }
        .padding(.horizontal, Size.Filtri.TitleBar.paddingHorizontal)
        .padding(.vertical, Size.Filtri.TitleBar.paddingVertical)
        .frame(height: Size.Filtri.TitleBar.height)
        .background(backgroundColor)
        .cornerRadius(Size.Filtri.TitleBar.cornerRadius, corners: [.topLeft, .topRight])
        
    }
    
    private var textColor: Color {
        return Color.Filtri.TitleBar.Text.dark
    }
    
    private var iconColor: Color {
        return Color.Filtri.TitleBar.Icon.dark
    }
    
    private var backgroundColor: Color {
        return Color.Filtri.TitleBar.Background.dark
    }
}

#Preview {
    VStack {
        SirioFiltriTitleBar(title: "Filtri", isOpen: .constant(false))
        SirioFiltriTitleBar(title: "Filtri", isOpen: .constant(true))
    }
}
