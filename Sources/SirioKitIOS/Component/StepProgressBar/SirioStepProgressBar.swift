//
// SirioStepProgressBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A composite view that combines step selection, step controls, and a custom content view.
///
/// `StepProgressBar` displays the current and next steps at the top, a customizable content view in the middle,
/// and navigation controls (e.g., "Back" and "Next") at the bottom.
///
/// - Parameters:
///   - leftStep: The text to display on the left side of the step selection, representing the current or previous step.
///   - rightStep: The text to display on the right side of the step selection, representing the next step.
///   - leftControl: The text to display on the left control (default is "Indietro").
///   - leftControlIsDisabled: A Boolean value indicating whether the left control is disabled.
///   - rightControl: The text to display on the right control (default is "Avanti").
///   - rightControlIsDisabled: A Boolean value indicating whether the right control is disabled.
///   - leftAction: The action to perform when the left control is tapped.
///   - rightAction: The action to perform when the right control is tapped.
///   - content: A view builder that provides the content to display between the step selection and step controls.
public struct SirioStepProgressBar<Content: View>: View {
    var leftStep: String
    var rightStep: String
    var leftControl: String
    var leftControlIsDisabled: Bool
    var rightControl: String
    var rightControlIsDisabled: Bool
    var leftAction: (() -> Void)?
    var rightAction: (() -> Void)?
    let content: Content
    
    public init(leftStep: String,
                rightStep: String,
                leftControl: String = "Indietro",
                leftControlIsDisabled: Bool,
                rightControl: String = "Avanti",
                rightControlIsDisabled: Bool,
                leftAction: (() -> Void)? = nil,
                rightAction: (() -> Void)? = nil,
                @ViewBuilder content: () -> Content) {
        self.leftStep = leftStep
        self.rightStep = rightStep
        self.leftControl = leftControl
        self.leftControlIsDisabled = leftControlIsDisabled
        self.rightControl = rightControl
        self.rightControlIsDisabled = rightControlIsDisabled
        self.leftAction = leftAction
        self.rightAction = rightAction
        self.content = content()
    }
    
    public var body: some View {
            VStack(spacing: 0) {
                SirioStepSelection(leftStep: leftStep, rightStep: rightStep)
                    .background(StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color)

                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal)

                SirioStepControls(leftControl: leftControl,
                             leftControlIsDisabled: leftControlIsDisabled,
                             rightControl: rightControl,
                             rightControlIsDisabled: rightControlIsDisabled,
                             leftAction: leftAction,
                             rightAction: rightAction)
                    .background(StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}

#Preview {
    SirioStepProgressBar(
        leftStep: "Passaggio 1 di 6",
        rightStep: "Nome Passaggio",
        leftControlIsDisabled: true,
        rightControlIsDisabled: false
    ) {
        SirioText(text: "Text", typography: .label_md_600)
    }
}
