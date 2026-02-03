//
// ExampleTags.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTag: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                SirioText(text: "Base", typography: .labelMdMiddle)
                ForEach(SirioTagType.baseCases, id: \.self) { type in
                    SirioTag(type: type, text: "Label Tag")
                        .padding(10)
                }
            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .top)
            
            VStack(alignment: .center) {
                SirioText(text: "Semantic", typography: .labelMdMiddle)
                    .padding(.top)
                ForEach(SirioTagType.semanticCases, id: \.self) { type in
                    SirioTag(type: type, text: "Label Tag")
                        .padding(10)
                }
            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .top)
        }
        .background(Color.colorBackground)
        .navigationTitle("Tag")
    }
}

#Preview {
    ExampleTag()
}
