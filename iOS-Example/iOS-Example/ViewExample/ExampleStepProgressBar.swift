//
// ExampleStepProgressBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleStepProgressBar: View {
    
    var body: some View {
        SirioStepProgressBar(
            leftStep: "Passaggio 1 di 6",
            rightStep: "Nome Passaggio",
            leftControlIsDisabled: true,
            rightControlIsDisabled: false
        ) {
            SirioText(text: "Text", typography: .label_md_600)
        }
        .padding(.top, 20)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .background(Color.colorBackground)
        .navigationTitle("Step Progress Bar")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleStepProgressBar()
}
