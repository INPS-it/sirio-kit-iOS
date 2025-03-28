//
// SirioStepSelection.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioStepSelection: View {
    var title: String
    @Binding var currentStep: Int
    @Binding var totalSteps: Int
    @Binding var isOpen: Bool
    var action: (() -> Void)?
    
    init(title: String, currentStep: Binding<Int>, totalSteps: Binding<Int>, isOpen: Binding<Bool>, action: @escaping (() -> Void)) {
        self.init(title: title, currentStep: currentStep, totalSteps: totalSteps, isOpen: isOpen)
        self.action = action
    }
    
    init(title: String, currentStep: Binding<Int>, totalSteps: Binding<Int>, isOpen: Binding<Bool>) {
        self.title = title
        self._currentStep = currentStep
        self._totalSteps = totalSteps
        self._isOpen = isOpen
    }
    
    var body: some View {
        HStack(spacing: Size.zero) {
            
            SirioText(text: title, typography: .headlineMdMiddle)
                .foregroundStyle(Color.StepProgressBar.StepSelection.text1)

            Spacer()
            
            SirioText(text: "\(currentStep + 1) / \(totalSteps)", typography: .labelMdRegular)
                .foregroundStyle(Color.StepProgressBar.StepSelection.text2)
                .padding(.trailing, Size.SirioStepProgressBar.StepSelection.paddingTrailing)
            
            SirioIcon(data: .init(icon: isOpen ? .angleUp : .angleDown))
                .frame(width: Size.SirioStepProgressBar.StepSelection.iconFrame,
                       height: Size.SirioStepProgressBar.StepSelection.iconFrame)
                .foregroundStyle(Color.StepProgressBar.StepSelection.icon)
        }
        .padding(.horizontal, Size.SirioStepProgressBar.StepSelection.paddingHorizontal)
        .frame(height: Size.SirioStepProgressBar.StepSelection.height)
        .frame(maxWidth: .infinity)
        .background(Color.StepProgressBar.StepSelection.background)
        .contentShape(Rectangle())
        .onTapGesture {
            action?()
        }
    }
}

#Preview {
    VStack {
        SirioStepSelection(title: "Nome step", currentStep: .constant(1), totalSteps: .constant(7), isOpen: .constant(true))
        
        SirioStepSelection(title: "Nome step", currentStep: .constant(1), totalSteps: .constant(7), isOpen: .constant(false))
        
    }
}
