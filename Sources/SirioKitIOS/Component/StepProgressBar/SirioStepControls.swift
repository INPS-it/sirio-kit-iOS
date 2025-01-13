//
// SirioStepControls.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A set of controls for navigating between steps in a user interface, typically represented by "Back" and "Next" buttons.
///
/// `SirioStepControls` provides a customizable interface with optional actions for each control and the ability to disable either control.
///
/// - Parameters:
///   - leftControl: The text to display on the left control (default is "Indietro").
///   - leftControlIsDisabled: A Boolean value indicating whether the left control is disabled.
///   - rightControl: The text to display on the right control (default is "Avanti").
///   - rightControlIsDisabled: A Boolean value indicating whether the right control is disabled.
///   - leftAction: The action to perform when the left control is tapped. The default is `nil`.
///   - rightAction: The action to perform when the right control is tapped. The default is `nil`.
public struct SirioStepControls: View {
    var leftControl: String
    var leftControlIsDisabled: Bool
    var rightControl: String
    var rightControlIsDisabled: Bool
    var leftAction: (() -> Void)?
    var rightAction: (() -> Void)?
    
    public init(leftControl: String = "Indietro",
                leftControlIsDisabled: Bool,
                rightControl: String = "Avanti",
                rightControlIsDisabled: Bool,
                leftAction: (() -> Void)? = nil,
                rightAction: (() -> Void)? = nil) {
        self.leftControl = leftControl
        self.leftControlIsDisabled = leftControlIsDisabled
        self.rightControl = rightControl
        self.rightControlIsDisabled = rightControlIsDisabled
        self.leftAction = leftAction
        self.rightAction = rightAction
    }
    
    public var body: some View {
        HStack {
            Button(action: {
                leftAction?()
            }, label: {
                SirioIcon(data: .init(icon: .angleLeft))
                    .frame(width: Size.StepProgressBar.StepControls.iconFrame, height: Size.StepProgressBar.StepControls.iconFrame)
                    .foregroundStyle(leftColor)
                
                SirioText(text: leftControl, typography: Typography.StepProgressBar.StepControls.text)
                    .foregroundStyle(leftColor)
                    .lineLimit(1)
            })
            .disabled(leftControlIsDisabled)
            
            Spacer()
            
            Button(action: {
                rightAction?()
            }, label: {
                SirioText(text: rightControl, typography: Typography.StepProgressBar.StepControls.text)
                    .foregroundStyle(rightColor)
                    .lineLimit(1)
                
                SirioIcon(data: .init(icon: .angleRight))
                    .frame(width: Size.StepProgressBar.StepControls.iconFrame, height: Size.StepProgressBar.StepControls.iconFrame)
                    .foregroundStyle(rightColor)
            })
            .disabled(rightControlIsDisabled)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .frame(height: Size.StepProgressBar.StepControls.height)
        .padding(.horizontal)
        .background(StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color)
    }
    
    private var leftColor: Color {
        return leftControlIsDisabled ? Color.StepProgressBar.StepControls.disabled : Color.StepProgressBar.StepControls.default
    }
    
    private var rightColor: Color {
        return rightControlIsDisabled ? Color.StepProgressBar.StepControls.disabled : Color.StepProgressBar.StepControls.default
    }
}

#Preview {
    VStack {
        SirioStepControls(leftControlIsDisabled: true, rightControlIsDisabled: false)
        SirioStepControls(leftControlIsDisabled: false, rightControlIsDisabled: false)
        SirioStepControls(leftControlIsDisabled: false, rightControlIsDisabled: true)
    }
}
