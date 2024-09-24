//
// SirioTableVertical.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioTableVertical: View {
    var cells: [SirioTableVerticalCell]
    
    public init(cells: [SirioTableVerticalCell]) {
        self.cells = cells
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(cells) { cell in
                    cell
                        .padding(.bottom, Size.Table.Expanded.paddingBottom)
                }
            })
        }
        .padding(.horizontal, Size.Table.Expanded.paddingHorizontal)
    }
}

#Preview {
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
