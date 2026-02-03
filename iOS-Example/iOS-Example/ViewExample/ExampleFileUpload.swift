//
// ExampleFileUpload.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleFileUpload: View {
    @State private var uploads1: [String] = []
    @State private var count1: Int = 0
    @State private var uploads2: [String] = []
    @State private var count2: Int = 0
    @State private var isDisabled: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                SirioText(text: "Enabled", typography: .label_md_400)
                SirioFileUpload(title: "Label",
                           subtitle: "*Info upload file",
                           text: "Upload",
                           isDisabled: $isDisabled,
                           uploads: $uploads1,
                           onUploadAction: {
                    self.count1 += 1
                    let newUpload = "File \(count1)"
                    uploads1.append(newUpload)
                },
                           onRemoveUploadAction: { index, value in
                    self.uploads1.remove(at: index)
                })
            }
            .padding()
            
            VStack(spacing: 16) {
                SirioText(text: "Disabled", typography: .label_md_400)
                SirioFileUpload(title: "Label",
                           subtitle: "*Info upload file",
                           text: "Upload",
                           isDisabled: .constant(true),
                           uploads: $uploads2,
                           onUploadAction: {
                    self.count2 += 1
                    let newUpload = "File \(count2)"
                    uploads2.append(newUpload)
                },
                           onRemoveUploadAction: { index, value in
                    self.uploads2.remove(at: index)
                })
            }
            .padding()
        }
        .padding(.vertical)
        .background(Color.colorBackground)
        .navigationTitle("File Upload")
    }
}

#Preview {
    ExampleFileUpload()
}
