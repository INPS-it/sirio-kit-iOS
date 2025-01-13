//
// ExampleSlider.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleSlider: View {
    
    @State var currentValue1: Int = 20
    @State var currentValue2: Int = 20
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 16) {
                SirioText(text: "Enabled", typography: .label_md_400)
                SirioSlider(title: "Slider Label",
                             subtitle: "*Info upload file",
                             currentValue: $currentValue1,
                             minValue: 50,
                             maxValue: 100,
                             step: 1,
                             isDisabled: .constant(false))
                .padding()
                
                
                SirioText(text: "Disabled", typography: .label_md_400)
                SirioSlider(title: "Slider Label",
                            subtitle: "*Info upload file",
                            currentValue: $currentValue2,
                            minValue: 0,
                            maxValue: 100,
                            step: 1,
                            isDisabled: .constant(true))
                .padding()
            }
            .padding()
        }
        .padding(.vertical)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .background(Color.colorBackground)
        .navigationTitle("Slider")
    }
}

#Preview {
    ExampleSlider()
}
