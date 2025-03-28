//
// ExampleChips.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleChips: View {
    
    @State var isSelected1: Bool = true
    @State var isSelected2: Bool = true
    @State var isSelected3: Bool = false
    @State var isSelected4: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                SirioText(text: "Chips Close", typography: .labelMdHeavy)

                SirioChips(text: "Chips", iconData: .init(icon: .user), isDisabled: .constant(false))
                SirioChips(text: "Chips", iconData: .init(icon: .user), isDisabled: .constant(true))
                    .padding(.bottom)
                
                SirioText(text: "Chips Selection", typography: .labelMdHeavy)
                
                SirioChipsSelection(text: "Chips",
                                    isSelected: $isSelected1,
                                    isDisabled: .constant(false),
                                    onTapChips: nil)
                
                SirioChipsSelection(text: "Chips",
                                    isSelected: $isSelected2,
                                    isDisabled: .constant(true),
                                    onTapChips: nil)
                SirioChipsSelection(text: "Chips",
                                    isSelected: $isSelected3,
                                    isDisabled: .constant(false),
                                    onTapChips: nil)
                SirioChipsSelection(text: "Chips",
                                    isSelected: $isSelected4,
                                    isDisabled: .constant(true),
                                    onTapChips: nil)
            }
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.colorBackground)
        .navigationTitle("Chips")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleChips()
}
