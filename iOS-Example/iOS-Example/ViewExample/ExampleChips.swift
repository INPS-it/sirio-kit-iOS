//
// ExampleChips.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleChips: View {
    
    @State var chipsLabelIconSelected: String? = ""
    @State var chipsOnlyLabelSelected: String? = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                SirioText(text: "Big Chips Label + Icon + Close", typography: .label_md_400)
                SirioChipsLabelIconClose(text: "Chips", icon: .user)
                
                SirioText(text: "Big Chips Label + Close", typography: .label_md_400)
                SirioChipsLabelClose(text: "Chips")
                
                SirioText(text: "Big Chips Label + Icon", typography: .label_md_400)
                SirioChipsLabelIcon(text: "Chips", icon: .check, selectedType: $chipsLabelIconSelected)
                
                SirioText(text: "Big Chips Only Label", typography: .label_md_400)
                SirioChipsOnlyLabel(text: "Chips", selectedType: $chipsOnlyLabelSelected)
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
        .navigationTitle("Chips")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleChips()
}
