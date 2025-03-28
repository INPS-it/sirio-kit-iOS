//
// SirioStep.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

enum SirioStepPosition {
    case start
    case middle
    case end
}

struct SirioStep: View {
    var type: SirioStepPointType
    var pointText: String
    var stepText: String
    var interactive: Bool
    var position: SirioStepPosition
    var onTapStep: () -> Void
    
    var body: some View {
        let typography = interactive ? Typography.linkMdHeavy : Typography.labelMdRegular
        let color =
        type == .done ?
        Color.StepProgressBar.Step.done :
        interactive ?
        Color.StepProgressBar.Step.interactive : Color.StepProgressBar.Step.default
        
        Button(action: {
            onTapStep()
        }, label: {
            HStack(spacing: Size.SirioStepProgressBar.spacingHorizontal) {
                GeometryReader { geometry in
                    ZStack {
                        VStack(spacing: Size.zero) {
                            StepBar(position: position, geometry: geometry)
                        }

                        SirioStepPoint(type: type, text: pointText)
                    }
                }
                .frame(width: Size.SirioStepProgressBar.StepPoint.frame)

                SirioText(text: stepText, typography: typography)
                    .foregroundStyle(color)
                
                Spacer() // Allinea tutto a sinistra
            }
            .padding(.horizontal, Size.SirioStepProgressBar.paddingHorizontal)
            .frame(height: Size.SirioStepProgressBar.Step.height)
            .frame(maxWidth: .infinity)
            .background(Color.StepProgressBar.Step.background)
            .contentShape(Rectangle())
        })
        .disabled(!interactive)
    }
}

struct StepBar: View {
    var position: SirioStepPosition
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: Size.zero) {
            // Se la posizione è "end", disegna la barra sopra
            if position == .end || position == .middle {
                bar
            } else {
                Spacer()
            }
            
            Spacer(minLength: Size.zero)

            // Se la posizione è "start", disegna la barra sotto
            if position == .start || position == .middle {
                bar
            } else {
                Spacer()
            }
        }
    }
    
    var bar: some View {
        Rectangle()
            .fill(Color.StepProgressBar.Step.bar)
            .frame(width: Size.SirioStepProgressBar.StepBar.width)
            .frame(height: Size.SirioStepProgressBar.StepBar.height)
    }
}



#Preview {
    VStack(spacing: 0) {
        SirioStep(
            type: .done,
            pointText: "00",
            stepText: "Label",
            interactive: true,
            position: .start,
            onTapStep: {}
        )
        SirioStep(
            type: .todo,
            pointText: "00",
            stepText: "Label",
            interactive: false,
            position: .middle,
            onTapStep: {}
        )
        SirioStep(
            type: .todo,
            pointText: "00",
            stepText: "Label",
            interactive: true,
            position: .end,
            onTapStep: {}
        )
    }
}
