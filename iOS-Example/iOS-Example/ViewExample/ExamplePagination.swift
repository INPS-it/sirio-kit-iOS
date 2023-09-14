//
// ExamplePagination.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExamplePagination: View {
    
    @State var selectedPage1: Int = 7
    @State var selectedPage2: Int = 0
    @State var isDisabled: Bool = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                SirioText(text: "Enabled", typography: .label_md_400)
                Pagination(selectedPage: $selectedPage1, numberOfPages: 10, isDisabled: $isDisabled)
                    .padding(.bottom)
                
                SirioText(text: "Disabled", typography: .label_md_400)
                Pagination(selectedPage: $selectedPage2, numberOfPages: 10, isDisabled: .constant(true))
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
        .navigationTitle("Pagination")
        .listStyle(GroupedListStyle())
    }
}

struct ExamplePagination_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePagination()
    }
}
