//
// ExampleTags.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTag: View {
    var body: some View {
        VStack(alignment: .center) {
            ForEach(TagType.allCases, id: \.self){ type in
                Tag(type: type, text: "Label Tag")
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

struct ExampleTag_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTag()
    }
}
