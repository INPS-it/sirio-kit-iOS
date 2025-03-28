//
// SirioStepProgressBar.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// SirioStepProgressBar component to manage and display step progress
/// - Parameters:
///   - currentStep: The current step index that is selected
///   - onStepSelected: Callback triggered when a step is selected
///   - steps: A binding to the list of steps to be shown
///   - back: Data for the "back" step control button
///   - next: Data for the "next" step control button
///   - others: Additional step control buttons
///   - content: The content to be displayed within the step progress bar
///   
public struct SirioStepProgressBar<Content: View>: View {
    @Binding public var currentStep: Int
    public var back: SirioStepControlData
    public var next: SirioStepControlData
    public var others: [SirioStepControlData]
    public var onStepSelected: (Int) -> Void
    @Binding public var steps: [SirioModelStepData]
    public var content: () -> Content
    
    @State public var isOpen: Bool = false
    
    public init(currentStep: Binding<Int>,
                onStepSelected: @escaping (Int) -> Void,
                steps: Binding<[SirioModelStepData]>,
                back: SirioStepControlData,
                next: SirioStepControlData,
                others: [SirioStepControlData],
                @ViewBuilder content: @escaping () -> Content) {
        self._currentStep = currentStep
        self.onStepSelected = onStepSelected
        self._steps = steps
        self.back = back
        self.next = next
        self.others = others
        self.content = content
    }
    
    @State private var contentHeight: CGFloat = .zero
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            SirioStepSelection(
                title: steps[currentStep].stepText,
                currentStep: $currentStep,
                totalSteps: Binding(
                    get: { steps.count },
                    set: { _ in }
                ),
                isOpen: $isOpen,
                action: {
                    self.isOpen.toggle()
                }
            )
            ZStack {
                content()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .padding(.top, Size.SirioStepProgressBar.paddingTop)
                    .padding(.horizontal, Size.SirioStepProgressBar.paddingHorizontal)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .padding(.bottom)
                                .onAppear {
                                    self.contentHeight = geometry.size.height
                                }
                                .onChange(of: geometry.size.height) { newValue in
                                    self.contentHeight = newValue
                                }
                        }
                    )
                if isOpen {
                    VStack {
                        ScrollView {
                            VStack(spacing: Size.zero) {
                                ForEach(0..<steps.count, id: \.self) { index in
                                    let type = index == currentStep ? .todo :
                                    index < currentStep ? steps[index].type :
                                        .inactive
                                    
                                    SirioStep(
                                        type: type,
                                        pointText: String(format: "%02d", index + 1),
                                        stepText: steps[index].stepText,
                                        interactive: index < currentStep,
                                        position: getPosition(for: index),
                                        onTapStep: {
                                            onStepSelected(index)
                                        }
                                    )
                                }
                            }
                        }
                        .frame(height: min(CGFloat(steps.count) * Size.SirioStepProgressBar.Step.height, contentHeight))
                        .background(Color.StepProgressBar.background)
                        .transition(.move(edge: .top))
                        Spacer(minLength: Size.zero)
                    }
                    .shadow(color: StyleDictionaryBoxShadow.elevation05.0.color,
                            radius: StyleDictionaryBoxShadow.elevation05.3.cgFloat,
                            x: StyleDictionaryBoxShadow.elevation05.1.cgFloat,
                            y: StyleDictionaryBoxShadow.elevation05.2.cgFloat)
                }
            }
            .padding(.bottom, Size.SirioStepProgressBar.paddingBottom)
            
            SirioStepControls(back: back, next: next, others: others)
        }
        .onChange(of: currentStep) { _ in
            closeSteps()
        }
    }
    
    private func closeSteps() {
        isOpen = false
    }
    
    private func getPosition(for index: Int) -> SirioStepPosition {
        if index == 0 {
            return .start
        } else if index == steps.count - 1 {
            return .end
        } else {
            return .middle
        }
    }
}

struct SirioStepProgressBarPreview: View {
    @State var currentStep = 0
    @State var steps = [
        SirioModelStepData(type: .todo, stepText: "Step 1"),
        SirioModelStepData(type: .todo, stepText: "Step 2"),
        SirioModelStepData(type: .done, stepText: "Step 3")
    ]
    
    var body: some View {
        SirioStepProgressBar(currentStep: $currentStep,
                                   onStepSelected: { step in
            self.currentStep = step
            print("Step \(step)")
        },
                                   steps: $steps,
                                   back: SirioStepControlData(
                                    text: "Indietro",
                                    action: {
                                        steps[currentStep].type = .warning
                                        currentStep = max(0, currentStep - 1)
                                    }),
                                   next: SirioStepControlData(
                                    text: "Avanti",
                                    action: {
                                        currentStep = min(steps.count - 1, currentStep + 1)
                                    }
                                   ),
                                   others: [.salvaBozza, .annulla], content: {
            
            VStack {
                SirioGenericTextField(placeholder: "Label", value: .constant(""), iconData: nil)
                SirioGenericTextField(placeholder: "Label", value: .constant(""), iconData: nil)
                SirioGenericTextField(placeholder: "Label", value: .constant(""), iconData: nil)
                SirioGenericTextField(placeholder: "Label", value: .constant(""), iconData: nil)
                SirioGenericTextField(placeholder: "Label", value: .constant(""), iconData: nil)
                SirioGenericTextField(placeholder: "Label", value: .constant(""), iconData: nil)
                
                Spacer()
            }
        })
    }
}

#Preview {
    SirioStepProgressBarPreview()
}

