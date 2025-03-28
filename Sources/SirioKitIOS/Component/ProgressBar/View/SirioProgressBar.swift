//
// SirioProgressBar.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A progress bar component that visually displays the progress of a task.
/// - Parameters:
///   - text: The label displayed above the progress bar.
///   - maxValue: The maximum value of the progress bar (default is 100).
///   - currentValue: The current progress value, which must be between 0 and [maxValue].
///   - showPercentage: A boolean flag to determine if the percentage of progress should be shown.

public struct SirioProgressBar: View {
    private let text: String
    private let maxValue: CGFloat
    @Binding private var currentValue: CGFloat
    private let showPercentage: Bool

    public init(text: String, maxValue: CGFloat = 100, currentValue: Binding<CGFloat>, showPercentage: Bool = true){
        self.text = text
        self.maxValue = maxValue
        self._currentValue = currentValue
        self.showPercentage = showPercentage
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            SirioText(text: text, typography: Typography.ProgressBar.label)
                .foregroundColor(Color.ProgressBar.Label.default)
                .padding(.horizontal, Size.ProgressBar.padding)
                
            ZStack(alignment: .center) {
                GeometryReader { geometryReader in
                    if currentValue <= maxValue {
                        Capsule()
                            .frame(width: geometryReader.size.width, height: Size.ProgressBar.height)
                            .foregroundColor(Color.ProgressBar.Background.default)
                    }
                    
                    Capsule()
                        .fill(LinearGradient(colors: Color.ProgressBar.Background.gradient,
                                             startPoint: .leading,
                                             endPoint: .trailing))
                        .padding(.horizontal, Size.ProgressBar.paddingHorizontal)
                        .frame(width: currentValue == 0 ? 10 : self.getProgressFrame(width: geometryReader.size.width),
                               height: Size.ProgressBar.gradientHeight)
                        .animation(.easeIn, value: true)
                        .offset(y: Size.ProgressBar.offset)
                    
                }
            }
            .frame(height: Size.ProgressBar.height)
            .padding(.trailing, Size.ProgressBar.padding)
            
            if showPercentage {
                HStack{
                    Spacer()
                    SirioText(text: percentage,
                              typography: Typography.ProgressBar.number)

                    .foregroundColor(Color.ProgressBar.Number.default)
                }
            }
        }
    }
    
    private var percentage: String {
        if currentValue > maxValue {
            return "\(String(format: "%.0f", maxValue))%"
        } else if currentValue < 0 {
            return "0%"
        }
        return "\(String(format: "%.0f", currentValue))%"
    }
    
    private func getProgressFrame(width: CGFloat) -> CGFloat {
        // If currentValue is greater than maxValue it is set to maxValue
        if currentValue >= maxValue {
            DispatchQueue.main.async {
                currentValue = maxValue
            }
            return width
        } else if currentValue <= 0 { // If currentValue is less than 0 it is set to 0
            DispatchQueue.main.async {
                currentValue = 0
            }
            return 0
        }
        let percentage = currentValue / maxValue
        return CGFloat(width * percentage)
    }
}

#Preview {
    VStack(spacing: 10){
        SirioProgressBar(text: "Label", currentValue: .constant(0))
        SirioProgressBar(text: "Label", currentValue: .constant(30))
        SirioProgressBar(text: "Label", currentValue: .constant(50))
        SirioProgressBar(text: "Label", currentValue: .constant(70))
        SirioProgressBar(text: "Label", currentValue: .constant(100))
    }
    .padding()
}
