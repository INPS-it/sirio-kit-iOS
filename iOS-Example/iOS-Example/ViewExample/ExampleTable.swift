//
// ExampleTable.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTable: View {
    
    var body: some View {
        List {
            ForEach(SirioTableSize.allCases.reversed(), id: \.self) { size in
                NavigationLink(destination: {
                    ScrollView(showsIndicators: false, content: {
                        TestTable(size: size)
                            .navigationTitle("Table - \(size)")
                    })
                }, label: {
                    SirioText(text: "Table - \(size)", typography: .label_md_400)
                })
            }
            
            NavigationLink(destination: {
                List {
                    NavigationLink(destination: {
                        
                        VStack {
                            TestTable1()
                            Spacer()
                        }
                        .navigationTitle("Table 1")
                    }, label: {
                        SirioText(text: "Table 1", typography: .label_md_400)
                    })
                    
                    NavigationLink(destination: {
                        VStack {
                            TestTable2()
                            
                            Spacer()
                        }
                        .navigationTitle("Table 2")
                    }, label: {
                        SirioText(text: "Table 2", typography: .label_md_400)
                    })
                    
                    NavigationLink(destination: {
                        VStack {
                            TestTable3()
                            
                            Spacer()
                        }                            .navigationTitle("Table 3")
                    }, label: {
                        SirioText(text: "Table 3", typography: .label_md_400)
                    })
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Table")
                .navigationBarTitleDisplayMode(.inline)
                
            }, label: {
                SirioText(text: "Table", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                TestTableVertical()
                    .navigationTitle("Table vertical")
            }, label: {
                SirioText(text: "Table vertical", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                TestTableDrawer(isExpanded: true)
                    .navigationTitle("Drawer + bottom bar expanded")
                    .navigationBarTitleDisplayMode(.inline)
                
            }, label: {
                SirioText(text: "Drawer + bottom bar expanded", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                TestTableDrawer(isExpanded: false)
                    .navigationTitle("Drawer + bottom bar collapsed")
                    .navigationBarTitleDisplayMode(.inline)
                
            }, label: {
                SirioText(text: "Drawer + bottom bar collapsed", typography: .label_md_400)
            })
            
        }
        .background(Color.colorBackground)
        .navigationTitle("Table")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleToggle()
}

struct TestTable: View {
    var nRighe: Int = 8
    var size: SirioTableSize
    
    var body: some View {
        VStack(spacing: 0) {
            SirioTitleBar(title: "Title", items: [])
            VStack(spacing: 0){
                HStack(spacing: 0){
                    VStack(spacing: 0){
                        SirioTableHeader(alignment: .leading, size: size, title: "Header", hasCheckBox: true, isChecked: .constant(false), onTapButtonAction: {})
                        SirioTableCellText(size: size, text: "Text 0", isChecked: .constant(false))
                        SirioTableCellNumber(size: size, text: "0", isChecked: .constant(false))
                        SirioTableCellTextOnly(size: size, text: "Text Only 0")
                        SirioTableCellLink(size: size, text: "Link 0", onTapLinkAction: {})
                        SirioTableCellAvatar(size: size, title: "Avatar 0", subtitle: "Subtitle", iconData: .init(icon: .addressBook))
                        SirioTableCellNumberOnly(size: size, text: "0")
                        SirioTableCellTag(size: size, tagType: .gray, text: "Tag 0")
                        SirioTableCellMultiIcons(size: size, iconsData: [.init(icon: .filePdf), .init(icon: .download)])
                    }
                    
                    VStack(spacing: 0){
                        SirioTableHeader(alignment: .leading, size: size, title: "Header", hasCheckBox: true, isChecked: .constant(false), onTapButtonAction: {})
                        SirioTableCellText(size: size, text: "Text 0", isChecked: .constant(false))
                        SirioTableCellNumber(size: size, text: "0", isChecked: .constant(false))
                        SirioTableCellTextOnly(size: size, text: "Text Only 0")
                        SirioTableCellLink(size: size, text: "Link 0", onTapLinkAction: {})
                        SirioTableCellAvatar(size: size, title: "Avatar 0", subtitle: "Subtitle", iconData: .init(icon: .addressBook))
                        SirioTableCellNumberOnly(size: size, text: "0")
                        SirioTableCellTag(size: size, tagType: .gray, text: "Tag 0")
                        SirioTableCellMultiIcons(size: size, iconsData: [.init(icon: .filePdf), .init(icon: .download)])
                    }
                }
            }
        }
    }
}


struct TestTableVertical: View {
    
    var body: some View {
        SirioTableVertical(cells: [
            SirioTableVerticalCell(schemeColor: .light,
                                   data: [
                                    .init(title: "Header", subtitle: "Link", type: .link),
                                    .init(title: "Header", subtitle: "23/11/2023", type: .date),
                                    .init(title: "Header", subtitle: "00", type: .number),
                                    .init(title: "Header", subtitle: "Lorem ipsum", type: .text),
                                    .init(title: "Header", subtitle: "Label tag", type: .tag)],
                                   icons: [.previewPdf, .previewDownload, .previewTrash]),
            SirioTableVerticalCell(schemeColor: .light,
                                   data: [
                                    .init(title: "Header", subtitle: "Link", type: .link),
                                    .init(title: "Header", subtitle: "23/11/2023", type: .date),
                                    .init(title: "Header", subtitle: "00", type: .number),
                                    .init(title: "Header", subtitle: "Lorem ipsum", type: .text),
                                    .init(title: "Header", subtitle: "Label tag", type: .tag)],
                                   icons: [.previewPdf, .previewDownload, .previewTrash]),
            SirioTableVerticalCell(schemeColor: .dark,
                                   data: [
                                    .init(title: "Header", subtitle: "Link", type: .link),
                                    .init(title: "Header", subtitle: "23/11/2023", type: .date),
                                    .init(title: "Header", subtitle: "00", type: .number),
                                    .init(title: "Header", subtitle: "Lorem ipsum", type: .text),
                                    .init(title: "Header", subtitle: "Label tag", type: .tag)],
                                   icons: [.previewPdf, .previewDownload, .previewTrash]),
            SirioTableVerticalCell(schemeColor: .dark,
                                   data: [
                                    .init(title: "Header", subtitle: "Link", type: .link),
                                    .init(title: "Header", subtitle: "23/11/2023", type: .date),
                                    .init(title: "Header", subtitle: "00", type: .number),
                                    .init(title: "Header", subtitle: "Lorem ipsum", type: .text),
                                    .init(title: "Header", subtitle: "Label tag", type: .tag)],
                                   icons: [.previewPdf, .previewDownload, .previewTrash])
            
        ])
    }
}

struct TestTableDrawer: View {
    var isExpanded: Bool
    
    var body: some View {
        if isExpanded {
            SirioTableDrawer(title: "Titolo",
                             onTapClose: {},
                             data: [
                                SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Sottotitolo", type: .text),
                                SirioTableDrawerItemData.init(title: "Titolo", subtitle: "00", type: .number),
                                SirioTableDrawerItemData.init(title: "Titolo", subtitle: "11/03/2023", type: .date),
                                SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Lorem Ipsum dolor sit amet", type: .link),
                             ], iconsData: [.init(icon: .print), .init(icon: .trash), .init(icon: .download)])
        } else {
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
    }
}


struct TestTable1: View {
    var body: some View {
        SirioTable(
            title: "Title",
            headers: SirioTableRowData(cells: [
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 0", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 1", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 2", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
                
            ]),
            columns: [
                
                SirioTableColumnData(cells: [
                    .text(size: .medium, text: "Text 0", scroll: false, isChecked: .constant(false)),
                    .text(size: .medium, text: "Text 1", scroll: false, isChecked: .constant(false)),
                    .text(size: .medium, text: "Text 2", scroll: false, isChecked: .constant(false)),
                ]),
                
                SirioTableColumnData(cells: [
                    .numberOnly(size: .medium, text: "0", scroll: false),
                    .numberOnly(size: .medium, text: "1", scroll: false),
                    .numberOnly(size: .medium, text: "2", scroll: false)
                ]),
                
                SirioTableColumnData(cells: [
                    .textOnly(size: .medium, text: "Text 0", scroll: false),
                    .textOnly(size: .medium, text: "Text 1", scroll: false),
                    .textOnly(size: .medium, text: "Text 2", scroll: false)
                ]),
            ]
        )
    }
}

struct TestTable2: View {
    var body: some View {
        SirioTable(
            title: "Title",
            headers: SirioTableRowData(cells: [
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 0", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 1", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 2", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
                
            ]),
            columns: [
                SirioTableColumnData(cells: [
                    .link(size: .medium, text: "Link 0", scroll: false, onTapLinkAction: {}),
                    .link(size: .medium, text: "Link 1", scroll: false, onTapLinkAction: {}),
                    .link(size: .medium, text: "Link 2", scroll: false, onTapLinkAction: {})
                ]),
                
                SirioTableColumnData(cells: [
                    .avatar(size: .medium, title: "Avatar 0", subtitle: "Subtitle", iconData: .init(icon: .addressBook)),
                    
                        .avatar(size: .medium, title: "Avatar 1", subtitle: "Subtitle", iconData: .init(icon: .addressBook)),
                    
                        .avatar(size: .medium, title: "Avatar 2", subtitle: "Subtitle", iconData: .init(icon: .addressBook)),
                ]),
                
                SirioTableColumnData(cells: [
                    .tag(size: .medium, tagType: .gray, text: "Tag 0", scroll: false),
                    .tag(size: .medium, tagType: .gray, text: "Tag 1", scroll: false),
                    .tag(size: .medium, tagType: .gray, text: "Tag 2", scroll: false)
                ]),
                
            ]
        )
    }
}

struct TestTable3: View {
    var body: some View {
        SirioTable(
            title: "Title",
            headers: SirioTableRowData(cells: [
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 0", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 1", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil),
                .header(schemeColor: .dark, alignment: .leading, size: .medium, title: "Title 2", scroll: false, hasCheckBox: false, isChecked: .constant(false), onTapCheckBoxAction: nil, onTapButtonAction: nil)
                
            ]),
            columns: [
                SirioTableColumnData(cells: [
                    .textOnly(size: .medium, text: "Text 0", scroll: false),
                    .textOnly(size: .medium, text: "Text 1", scroll: false),
                    .textOnly(size: .medium, text: "Text 2", scroll: false)
                ]),
                
                SirioTableColumnData(cells: [
                    .number(size: .medium, text: "0", scroll: false, isChecked: .constant(false)),
                    .number(size: .medium, text: "1", scroll: false, isChecked: .constant(false)),
                    .number(size: .medium, text: "2", scroll: false, isChecked: .constant(false))
                ]),
                
                SirioTableColumnData(cells: [
                    .multiIcons(size: .medium, scroll: false, iconsData: [.init(icon: .filePdf), .init(icon: .download)]),
                    .multiIcons(size: .medium, scroll: false, iconsData: [.init(icon: .filePdf), .init(icon: .download)]),
                    .multiIcons(size: .medium, scroll: false, iconsData: [.init(icon: .filePdf), .init(icon: .download)])
                ]),
            ]
        )
    }
}
