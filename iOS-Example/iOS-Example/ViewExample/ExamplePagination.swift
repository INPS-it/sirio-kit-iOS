//
// ExamplePagination.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExamplePagination: View {
    @State private var selectedPage1: Int = 7
    @State private var selectedPage2: Int = 0
    @State private var isDisabled: Bool = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                SirioText(text: "Enabled", typography: .label_md_400)
                SirioPagination(selectedPage: $selectedPage1, numberOfPages: 10, isDisabled: $isDisabled)
                    .padding(.bottom)
            }
            .padding(.top, 20)
            
            VStack(alignment: .center) {
                SirioText(text: "Disabled", typography: .label_md_400)
                SirioPagination(selectedPage: $selectedPage2, numberOfPages: 10, isDisabled: .constant(true))
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.colorBackground)
        .navigationTitle("Pagination")

    }
}

#Preview {
    ExamplePagination()
}
