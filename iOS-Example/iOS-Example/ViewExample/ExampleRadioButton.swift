//
// ExampleRadioButton.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleRadioButton: View {
    @State var isChecked1: Bool = false
    @State var isChecked2: Bool = true
    @State var isChecked3: Bool = false
    @State var isChecked4: Bool = true
    @State var isChecked5: Bool = false
    @State var isChecked6: Bool = true
    @State var isChecked7: Bool = false
    @State var isChecked8: Bool = true
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .center, spacing: 16){
                SirioText(text: "Box Only", typography: .label_md_400)
                    .padding()
                SirioRadioButton(text: nil, isChecked: $isChecked1, isDisabled: .constant(false), callback: { _ in
                    self.isChecked2 = !self.isChecked1
                })
                SirioRadioButton(text: nil, isChecked: $isChecked2, isDisabled: .constant(false), callback: { _ in
                    self.isChecked1 = !self.isChecked2
                })
                SirioRadioButton(text: nil, isChecked: $isChecked3, isDisabled: .constant(true), callback: nil)
                SirioRadioButton(text: nil, isChecked: $isChecked4, isDisabled: .constant(true), callback: nil)
                
                SirioText(text: "Box + Text", typography: .label_md_400)
                    .padding()
                SirioRadioButton(text: "Title", isChecked: $isChecked5, isDisabled: .constant(false), callback: { _ in
                    self.isChecked6 = !self.isChecked5
                })
                SirioRadioButton(text: "Title", isChecked: $isChecked6, isDisabled: .constant(false), callback: { _ in
                    self.isChecked5 = !self.isChecked6
                })
                SirioRadioButton(text: "Title", isChecked: $isChecked7, isDisabled: .constant(true), callback: nil)
                SirioRadioButton(text: "Title", isChecked: $isChecked8, isDisabled: .constant(true), callback: nil)
            }.padding()
        }
        .padding(.top, 20)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .background(Color.colorBackground)
        .navigationTitle("Radio Button")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleRadioButton()
}
