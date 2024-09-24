//
// ExampleTitleBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTitleBar: View {
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                SirioTitleBar(title: "Title", items: [
                    .init(data: .previewDownload, action: {
                    
                }), .init(data: .previewPdf, action: {
                    
                })])
                
                SirioTitleBar(schemeColor: .light, title: "Title", items: [
                    .init(data: .previewDownload, action: {
                    
                }), .init(data: .previewPdf, action: {
                    
                })])
            }
        }
        .padding(.top, 20)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .background(Color.colorBackground)
        .navigationTitle("Title Bar")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleTitleBar()
}
