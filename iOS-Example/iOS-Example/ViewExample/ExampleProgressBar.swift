//
// ExampleProgressBar.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleProgressBar: View {
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 16) {
                Group {
                    ProgressBar(text: "Label", currentValue: .constant(0))
                    ProgressBar(text: "Label", currentValue: .constant(10))
                    ProgressBar(text: "Label", currentValue: .constant(20))
                    ProgressBar(text: "Label", currentValue: .constant(30))
                    ProgressBar(text: "Label", currentValue: .constant(40))
                    ProgressBar(text: "Label", currentValue: .constant(50))
                }
                Group {
                    ProgressBar(text: "Label", currentValue: .constant(60))
                    ProgressBar(text: "Label", currentValue: .constant(70))
                    ProgressBar(text: "Label", currentValue: .constant(80))
                    ProgressBar(text: "Label", currentValue: .constant(90))
                    ProgressBar(text: "Label", currentValue: .constant(100))
                }
            }
            .padding()
        }
        .background(Color.colorBackground)
        .navigationTitle("ProgressBar")
    }
}

struct ExampleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ExampleProgressBar()
    }
}
