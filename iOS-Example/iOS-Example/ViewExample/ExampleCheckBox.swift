//
// ExampleCheckBox.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleCheckBox: View {
    @State var isChecked1: Bool = false
    @State var isChecked2: Bool = true
    @State var isChecked3: Bool = false
    @State var isChecked4: Bool = true
    @State var isChecked5: Bool = false
    @State var isChecked6: Bool = true
    @State var isChecked7: Bool = false
    @State var isChecked8: Bool = true
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center, spacing: 16){
                SirioText(text: "Box Only", typography: .label_md_400)
                    .padding()
                Checkbox(text: nil, isChecked: $isChecked1, isDisabled: .constant(false), callback: nil)
                Checkbox(text: nil, isChecked: $isChecked2, isDisabled: .constant(false), callback: nil)
                Checkbox(text: nil, isChecked: $isChecked3, isDisabled: .constant(true), callback: nil)
                Checkbox(text: nil, isChecked: $isChecked4, isDisabled: .constant(true), callback: nil)
                
                SirioText(text: "Box + Text", typography: .label_md_400)
                    .padding()
                Checkbox(text: "Title", isChecked: $isChecked5, isDisabled: .constant(false), callback: nil)
                Checkbox(text: "Title", isChecked: $isChecked6, isDisabled: .constant(false), callback: nil)
                Checkbox(text: "Title", isChecked: $isChecked7, isDisabled: .constant(true), callback: nil)
                Checkbox(text: "Title", isChecked: $isChecked8, isDisabled: .constant(true), callback: nil)
            }.padding()
        }
        .padding(.top, 20)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center)
        .background(Color.colorBackground)
        .navigationTitle("CheckBox")
        .listStyle(GroupedListStyle())
    }
}

struct ExampleCheckBox_Previews: PreviewProvider {
    static var previews: some View {
        ExampleCheckBox()
    }
}
