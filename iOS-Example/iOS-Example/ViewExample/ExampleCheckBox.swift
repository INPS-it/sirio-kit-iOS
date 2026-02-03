//
// ExampleCheckBox.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleCheckBox: View {
    @State private var isChecked1: Bool = false
    @State private var isChecked2: Bool = true
    @State private var isChecked3: Bool = false
    @State private var isChecked4: Bool = true
    @State private var isChecked5: Bool = false
    @State private var isChecked6: Bool = true
    @State private var isChecked7: Bool = false
    @State private var isChecked8: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                SirioText(text: "Box Only", typography: .label_md_400)
                    .padding()
                SirioCheckbox(text: nil, isChecked: $isChecked1, isDisabled: .constant(false), callback: nil)
                SirioCheckbox(text: nil, isChecked: $isChecked2, isDisabled: .constant(false), callback: nil)
                SirioCheckbox(text: nil, isChecked: $isChecked3, isDisabled: .constant(true), callback: nil)
                SirioCheckbox(text: nil, isChecked: $isChecked4, isDisabled: .constant(true), callback: nil)
            }
            .padding()
            
            VStack(alignment: .center, spacing: 16) {
                SirioText(text: "Box + Text", typography: .label_md_400)
                    .padding()
                SirioCheckbox(text: "Title", isChecked: $isChecked5, isDisabled: .constant(false), callback: nil)
                SirioCheckbox(text: "Title", isChecked: $isChecked6, isDisabled: .constant(false), callback: nil)
                SirioCheckbox(text: "Title", isChecked: $isChecked7, isDisabled: .constant(true), callback: nil)
                SirioCheckbox(text: "Title", isChecked: $isChecked8, isDisabled: .constant(true), callback: nil)
            }
            .padding()
        }
        .background(Color.colorBackground)
        .navigationTitle("CheckBox")
    }
}

#Preview {
    ExampleCheckBox()
}
