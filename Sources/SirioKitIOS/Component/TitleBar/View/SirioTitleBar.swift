//
// SirioTitleBar.swift
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

public struct SirioTitleBar: View {
    var schemeColor: SchemeColor
    var title: String
    var items: [SirioTitleBarItemData]?
    
    public init(schemeColor: SchemeColor = .dark, title: String, items: [SirioTitleBarItemData]?) {
        self.schemeColor = schemeColor
        self.title = title
        if let items = items, items.count > 2 {
            print("Warning: The items array should have a maximum of 2 elements.")
            self.items = Array(items.prefix(2))
        } else {
            self.items = items ?? []
        }
    }
    
    public var body: some View {
        HStack {
            SirioText(text: title, typography: .h5_md)
                .foregroundStyle(textColor)
            
            Spacer()
            
            if let items = items {
                ForEach(items){ item in
                    Button(action: {
                        item.action()
                    }, label: {
                        SirioIcon(data: item.data)
                            .foregroundStyle(iconColor)
                            .frame(width: Size.TitleBar.Icon.frame, height: Size.TitleBar.Icon.frame)
                            .padding()
                    })
                }
            }
        }
        .padding(.horizontal, Size.TitleBar.paddingHorizontal)
        .padding(.vertical, Size.TitleBar.paddingVertical)
        .frame(height: Size.TitleBar.height)
        .background(backgroundColor)
        .cornerRadius(Size.TitleBar.cornerRadius, corners: [.topLeft, .topRight])
    }
    
    private var textColor: Color {
        return schemeColor == .dark ? Color.TitleBar.Text.dark : Color.TitleBar.Text.light
    }
    
    private var iconColor: Color {
        return schemeColor == .dark ? Color.TitleBar.Icon.dark : Color.TitleBar.Icon.light
    }
    
    private var backgroundColor: Color {
        return schemeColor == .dark ? Color.TitleBar.Background.dark : Color.TitleBar.Background.light
    }
}

#Preview {
    VStack {
        SirioTitleBar(schemeColor: .light,
                 title: "Titolo della tabella",
                 items: [.init(data: .previewHeart, action: {}),
                         .init(data: .previewEllipsis, action: {})])
        
        SirioTitleBar(schemeColor: .dark,
                 title: "Titolo della tabella",
                 items: [.init(data: .previewHeart, action: {}),
                         .init(data: .previewEllipsis, action: {})])
    }
}
