//
// ExampleStepProgressBar.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleStepProgressBar: View {
    @State var currentStep = 0
    @State var steps = [
        SirioModelStepData(type: .todo, stepText: "Step 1"),
        SirioModelStepData(type: .todo, stepText: "Step 2"),
        SirioModelStepData(type: .done, stepText: "Step 3")
    ]
    
    var isBackDisabled: Bool {
        return currentStep == 0
    }
    
    var body: some View {
        SirioStepProgressBar(currentStep: $currentStep,
                                   onStepSelected: { step in
            self.currentStep = step
            print("Step \(step)")
        },
                                   steps: $steps,
                                   back: SirioStepControlData(
                                    text: "Indietro",
                                    isDisabled: isBackDisabled,
                                    action: {
                                        onTapBack()
                                    }),
                                   next: SirioStepControlData(
                                    text: currentStep == steps.count - 1 ? "Fine" : "Avanti",
                                    isDisabled: false,
                                    action: {
                                        onTapNext()
                                    }
                                   ),
                             others: [.init(text: "Annulla compilazione", action: {
            print("CIAO")
        })], content: {
            
            if currentStep == 0 {
                VStack {
                    SirioGenericTextField(type: .constant(.info),
                                          textInfo: "Label",
                                          placeholder: "Text",
                                          value: .constant(""),
                                          iconData: .init(icon: .calendar),
                                          onTapInfoAction: nil)
                    Spacer()
                }
            } else if currentStep == 1 {
                VStack {
                    SirioGenericTextField(type: .constant(.info),
                                          textInfo: "Label",
                                          placeholder: "Text",
                                          value: .constant(""),
                                          iconData: .init(icon: .calendar),
                                          onTapInfoAction: nil)
                    SirioGenericTextField(type: .constant(.info),
                                          textInfo: "Label",
                                          placeholder: "Text",
                                          value: .constant(""),
                                          iconData: .init(icon: .calendar),
                                          onTapInfoAction: nil)
                    Spacer()
                }
            } else if currentStep == 2 {
                VStack {
                    SirioGenericTextField(type: .constant(.info),
                                          textInfo: "Label",
                                          placeholder: "Text",
                                          value: .constant(""),
                                          iconData: .init(icon: .calendar),
                                          onTapInfoAction: nil)
                    SirioGenericTextField(type: .constant(.info),
                                          textInfo: "Label",
                                          placeholder: "Text",
                                          value: .constant(""),
                                          iconData: .init(icon: .calendar),
                                          onTapInfoAction: nil)
                    SirioGenericTextField(type: .constant(.info),
                                          textInfo: "Label",
                                          placeholder: "Text",
                                          value: .constant(""),
                                          iconData: .init(icon: .calendar),
                                          onTapInfoAction: nil)
                    Spacer()
                }
            }
            
        })
    }
    
    func onTapNext(){
        steps[currentStep].type = .done
        currentStep = min(steps.count - 1, currentStep + 1)

    }
    
    func onTapBack(){
        currentStep = max(0, currentStep - 1)
    }
}

#Preview {
    ExampleStepProgressBar()
}
