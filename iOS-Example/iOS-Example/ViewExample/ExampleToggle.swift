//
// ExampleToggle.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleToggle: View {
    @State private var isOn1: Bool = false
    @State private var isOn2: Bool = false
    @State private var isOn3: Bool = true
    @State private var isOn4: Bool = true
    @State private var isOn5: Bool = false
    @State private var isOn6: Bool = false
    @State private var isOn7: Bool = true
    @State private var isOn8: Bool = true
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                SirioText(text: "Toggle Only False", typography: .label_md_400)
                    .padding()
                SirioToggle(isOn: $isOn1, isDisabled: .constant(false))
                SirioToggle(isOn: $isOn2, isDisabled: .constant(true))
            }
            
            VStack(alignment: .center, spacing: 10) {
                SirioText(text: "Toggle Only True", typography: .label_md_400)
                    .padding()
                SirioToggle(isOn: $isOn3, isDisabled: .constant(false))
                SirioToggle(isOn: $isOn4, isDisabled: .constant(true))
            }
            
            VStack(alignment: .center, spacing: 10) {
                SirioText(text: "Toggle Text False", typography: .label_md_400)
                    .padding()
                SirioToggle(text: "Title", isOn: $isOn5, isDisabled: .constant(false))
                SirioToggle(text: "Title", isOn: $isOn6, isDisabled: .constant(true))
            }
            
            VStack(alignment: .center, spacing: 10) {
                SirioText(text: "Toggle Text True", typography: .label_md_400)
                    .padding()
                SirioToggle(text: "Title", isOn: $isOn7, isDisabled: .constant(false))
                SirioToggle(text: "Title", isOn: $isOn8, isDisabled: .constant(true))
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("Toggle")
    }
}
#Preview {
    ExampleToggle()
}
