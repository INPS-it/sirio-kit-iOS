//
// SirioTableDrawer.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableDrawer: View {
    public var title: String
    public var onTapClose: (() -> Void)?
    public var data: [SirioTableDrawerItemData]
    @State var isOpenOptions = false
    public var iconsData: [SirioIconData]?
    
    public init(title: String, onTapClose: (() -> Void)? = nil, data: [SirioTableDrawerItemData], iconsData: [SirioIconData]? = nil) {
        self.title = title
        self.onTapClose = onTapClose
        self.data = data
        self.iconsData = iconsData
    }
    
    public var body: some View {
        VStack(spacing: Size.Table.Drawer.spacing){
            SirioTableDrawerHeader(title: title, onTapClose: onTapClose)
                .padding(.bottom, Size.Table.Drawer.paddingBottom)
            ForEach(data) { datum in
                SirioTableDrawerItem(data: datum)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.isOpenOptions = false
            }
            
            Spacer()
            
            if let iconsData = iconsData {
                SirioTableDrawerBottomBar(text: "Azioni", data: iconsData, onTapEllipsis: {
                    self.isOpenOptions.toggle()
                })
            }
        }
        .overlay(alignment: .bottomTrailing, content: {
            if isOpenOptions && iconsData != nil && !iconsData!.isEmpty {
                optionsView
                    .padding(.bottom, Size.Table.Drawer.BottomBar.paddingBottom)
                    .padding(.horizontal, Size.Table.Drawer.BottomBar.paddingHorizontal)
            }
        })
    }
    
    private var optionsView: some View {
        VStack(spacing: Size.SearchBar.Options.spacing) {
            List {
                ForEach(iconsData ?? []){ data in
                    
                    Button(action: {
                        isOpenOptions = false
                        let _ = data.action
                    }, label: {
                        // Inside style
                    }).buttonStyle(OptionsStyle(text: data.text ?? ""))
                }
                .listRowInsets(EdgeInsets())
                
            }
            .listStyle(PlainListStyle())
            .frame(width: Size.Table.Drawer.BottomBar.Options.width, height: Size.Table.Drawer.BottomBar.Options.height)
        }
        .overlay(
            RoundedRectangle(cornerRadius: Size.SearchBar.cornerRadius)
                .stroke(Color.black, lineWidth: Size.SearchBar.lineWidth)
        )
        .background(Color.white)
        .cornerRadius(Size.SearchBar.cornerRadius)
        
    }
}

#Preview {
    SirioTableDrawer(title: "Titolo",
                     onTapClose: {},
                     data: [
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Sottotitolo", type: .text),
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "00", type: .number),
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "11/03/2023", type: .date),
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Lorem Ipsum dolor sit amet", type: .link),
                     ], iconsData: [.init(icon: .print), .init(icon: .trash), .init(icon: .download)])
}

#Preview {
    SirioTableDrawer(title: "Titolo",
                     onTapClose: {},
                     data: [
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Sottotitolo", type: .text),
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "00", type: .number),
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "11/03/2023", type: .date),
                        SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Lorem Ipsum dolor sit amet", type: .link),
                     ], iconsData: [SirioIconData.init(icon: .trash, text: "Elimina"),
                                    SirioIconData.init(icon: .download, text: "Download"),
                                    SirioIconData.init(icon: .addressBook, text: "Rubrica"),
                                    SirioIconData.init(icon: .times, text: "Chiudi")
                                   ])
}

