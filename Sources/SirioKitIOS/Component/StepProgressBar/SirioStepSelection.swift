//
// SirioStepSelection.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view component that displays two text labels representing navigation steps in a user interface.
///
/// `SirioStepSelection` is used to show the current and next steps in a process, with customizable text for each step.
/// The left step typically represents the current or previous step, while the right step represents the next step.
///
/// - Parameters:
///   - leftStep: The text to display on the left side of the component, typically representing the current or previous step.
///   - rightStep: The text to display on the right side of the component, typically representing the next step.
public struct SirioStepSelection: View {
    var leftStep: String
    var rightStep: String
    
    public init(leftStep: String, rightStep: String) {
        self.leftStep = leftStep
        self.rightStep = rightStep
    }
    
    public var body: some View {
        HStack {
            SirioText(text: leftStep, typography: Typography.StepProgressBar.StepSelection.leftText)
                .foregroundStyle(Color.StepProgressBar.StepSelection.leftText)
                .lineLimit(1)
            
            Spacer()
            
            SirioText(text: rightStep, typography: Typography.StepProgressBar.StepSelection.rightText)
                .foregroundStyle(Color.StepProgressBar.StepSelection.rightText)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
        .frame(height: Size.StepProgressBar.StepSelection.height)
        .padding(.horizontal)
        .foregroundStyle(Color.StepProgressBar.StepSelection.background)
    }
}

#Preview {
    SirioStepSelection(leftStep: "Passaggio 1 di 6", rightStep: "Nome Passaggio")
}
