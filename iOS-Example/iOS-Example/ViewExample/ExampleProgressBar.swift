//
// ExampleProgressBar.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
                    SirioProgressBar(text: "Label", currentValue: .constant(0))
                    SirioProgressBar(text: "Label", currentValue: .constant(10))
                    SirioProgressBar(text: "Label", currentValue: .constant(20))
                    SirioProgressBar(text: "Label", currentValue: .constant(30))
                    SirioProgressBar(text: "Label", currentValue: .constant(40))
                    SirioProgressBar(text: "Label", currentValue: .constant(50))
                }
                Group {
                    SirioProgressBar(text: "Label", currentValue: .constant(60))
                    SirioProgressBar(text: "Label", currentValue: .constant(70))
                    SirioProgressBar(text: "Label", currentValue: .constant(80))
                    SirioProgressBar(text: "Label", currentValue: .constant(90))
                    SirioProgressBar(text: "Label", currentValue: .constant(100))
                }
            }
            .padding()
        }
        .background(Color.colorBackground)
        .navigationTitle("ProgressBar")
    }
}

#Preview {
    ExampleProgressBar()
}
