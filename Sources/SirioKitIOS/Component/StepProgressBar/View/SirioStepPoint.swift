//
// SirioStepPoint.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum SirioStepPointType {
    case todo, done, error, warning, inactive
    
    func getCircleColor() -> Color {
        switch self {
        case .todo:
            return Color.StepProgressBar.StepPoint.Circle.todo
        case .done:
            return Color.StepProgressBar.StepPoint.Circle.done
        case .error:
            return Color.StepProgressBar.StepPoint.Circle.error
        case .warning:
            return Color.StepProgressBar.StepPoint.Circle.warning
        case .inactive:
            return Color.StepProgressBar.StepPoint.Circle.inactive
        }
    }
    
    func getColor() -> Color {
        switch self {
        case .todo:
            return Color.StepProgressBar.StepPoint.TextIcon.todo
        case .done:
            return Color.StepProgressBar.StepPoint.TextIcon.done
        case .error:
            return Color.StepProgressBar.StepPoint.TextIcon.error
        case .warning:
            return Color.StepProgressBar.StepPoint.TextIcon.warning
        case .inactive:
            return Color.StepProgressBar.StepPoint.TextIcon.inactive
        }
    }
    
    func getIcon() -> AwesomeIcon? {
        switch self {
        case .todo, .inactive:
            return nil
        case .done:
            return AwesomeIcon.check
        case .error:
            return AwesomeIcon.exclamationTriangle
        case .warning:
            return AwesomeIcon.exclamationCircle
        }
    }
}

public struct SirioStepPoint: View {
    let type: SirioStepPointType
    let text: String?
    
    
    public init(type: SirioStepPointType, text: String? = nil) {
        self.type = type
        self.text = text
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(type.getCircleColor())
                .frame(width: Size.SirioStepProgressBar.StepPoint.frame,
                       height: Size.SirioStepProgressBar.StepPoint.frame)
            
            if let icon = type.getIcon() {
                SirioIcon(data: .init(icon: icon))
                    .frame(width: Size.SirioStepProgressBar.StepPoint.icon,
                           height: Size.SirioStepProgressBar.StepPoint.icon)
                    .foregroundColor(type.getColor())
            } else if let text = text {
                SirioText(text: text, typography: .labelNumberMdHeavy)
                    .foregroundColor(type.getColor())
            }
        }
    }
}

#Preview {
    VStack {
        SirioStepPoint(type: .todo, text: "00")
        SirioStepPoint(type: .done)
        SirioStepPoint(type: .error)
        SirioStepPoint(type: .warning)
        SirioStepPoint(type: .inactive, text: "00")
    }
}
