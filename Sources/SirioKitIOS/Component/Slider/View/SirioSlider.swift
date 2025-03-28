//
// SirioSlider.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Slider component to control a numeric value with an optional title, subtitle, and customization options
/// - Parameters:
///   - title: The optional title displayed above the slider
///   - subtitle: The optional subtitle displayed below the title
///   - currentValue: The current value of the slider
///   - minValue: The minimum value allowed for the slider
///   - maxValue: The maximum value allowed for the slider
///   - step: The distance between valid values (default is 1)
///   - isDisabled: Whether the slider is disabled (default is false)
///   
public struct SirioSlider: View {
    private var title: String?
    private var subtitle: String?
    @Binding var currentValue: Int
    private var minValue: Int
    private var maxValue: Int
    private var step: Int
    @Binding var isDisabled: Bool
    @State var isPressed: Bool = false
    @FocusState private var isTextFieldFocused: Bool
    let maxCharacters: Int = 10
    
    public init(title: String? = nil,
                subtitle: String? = nil,
                currentValue: Binding<Int>,
                minValue: Int,
                maxValue: Int,
                step: Int = 1,
                isDisabled: Binding<Bool> = .constant(false)){
        self.title = title
        self.subtitle = subtitle
        self._currentValue = currentValue
        self.minValue = minValue
        self.maxValue = min(maxValue, Int.max)
        self.step = step
        self._isDisabled = isDisabled
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            if let title = title {
                SirioText(text: title, typography: Typography.Slider.title)
                    .foregroundColor(Color.Slider.Text.title)
            }
            if let subtitle = subtitle {
                SirioText(text: subtitle, typography: Typography.Slider.subtitle)
                    .foregroundColor(Color.Slider.Text.subtitle)
            }
            
            HStack(spacing: Size.Slider.horizontalSpacing) {
                VStack(spacing: Size.Slider.spacingVertical) {
                    
                    Slider(value: $currentValue.double(),
                           in: Double(minValue)...Double(maxValue),
                           step: Double(step),
                           onEditingChanged: { _ in
                        isTextFieldFocused = false
                        self.isPressed.toggle()
                    })
                    .disabled(isDisabled)
                    .accentColor(isPressed ? Color.Slider.Line.pressed : Color.Slider.Line.default)
                    
                    HStack {
                        SirioText(text: "\(minValue)", typography: Typography.Slider.number)
                            .foregroundColor(Color.Slider.Text.number)
                        
                        Spacer()
                        
                        SirioText(text: "\(maxValue)", typography: Typography.Slider.number)
                            .foregroundColor(Color.Slider.Text.number)
                    }
                }
                TextField("", text: $currentValue.string().max(maxCharacters))
                    .keyboardType(.numberPad)
                    .sirioFont(typography: Typography.Slider.number)
                    .disabled(isDisabled)
                    .frame(width: Size.Slider.TextField.width, height: Size.Slider.TextField.height)
                    .focused($isTextFieldFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Fine") {
                                if $currentValue.wrappedValue > maxValue {
                                    self.currentValue = maxValue
                                } else if $currentValue.wrappedValue < minValue {
                                    self.currentValue = minValue
                                }
                                isTextFieldFocused = false
                            }
                        }
                    }
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: Size.Slider.TextField.cornerRadius)
                            .stroke(overlayColor, lineWidth: Size.Slider.TextField.border)
                    )
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .cornerRadius(Size.Slider.TextField.cornerRadius)
                    .padding(.leading)
                        
            }
        }.onAppear{
            if $currentValue.wrappedValue > maxValue {
                DispatchQueue.main.async {
                    self.currentValue = maxValue
                    self.isTextFieldFocused = true
                }
            } else if $currentValue.wrappedValue < minValue {
                DispatchQueue.main.async {
                    self.currentValue = minValue
                    self.isTextFieldFocused = true
                }
            }
            DispatchQueue.main.async {
                self.isTextFieldFocused = false
            }
        }
    }
    
    private var backgroundColor: Color {
        isDisabled ? Color.Slider.TextField.Background.disabled : Color.Slider.TextField.Background.default
    }
    
    private var foregroundColor: Color {
        isDisabled ? Color.Slider.TextField.Text.disabled : Color.Slider.TextField.Text.default
    }
    
    private var overlayColor: Color {
        if isDisabled {
            return Color.clear
        } else if isPressed {
            return Color.Slider.Line.pressed
        }
        return Color.Slider.Line.default
    }
}

struct TestSirioSlider: View {
    @State var currentValue: Int = 100
    
    var body: some View {
        SirioSlider(title: "Slider label", subtitle: "*Info upload file", currentValue: $currentValue, minValue: 0, maxValue: 100, step: 1)
    }
}

#Preview {
    TestSirioSlider()
        .padding()
}
