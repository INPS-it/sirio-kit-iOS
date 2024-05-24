//
// ProgressBar.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A progressbar component
/// - Parameters:
///   - text: The label above the progress
///   - maxValue: The max value of the progress
///   - currentValue: The current progress value between 0 and [maxValue]
///   - showPercentage: A boolean flag for show percentage
public struct ProgressBar: View {
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
        ProgressBar(text: "Label", currentValue: .constant(0))
        ProgressBar(text: "Label", currentValue: .constant(30))
        ProgressBar(text: "Label", currentValue: .constant(50))
        ProgressBar(text: "Label", currentValue: .constant(70))
        ProgressBar(text: "Label", currentValue: .constant(100))
    }
    .padding()
}
