//
// ExampleTags.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTag: View {
    var body: some View {
        VStack(alignment: .center) {
            ForEach(SirioTagType.allCases, id: \.self){ type in
                SirioTag(type: type, text: "Label Tag")
                    .padding(10)
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
        .navigationTitle("Tag")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleTag()
}
