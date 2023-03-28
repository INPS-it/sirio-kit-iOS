//
// RadioButton.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Radio button component
/// - Parameters:
///   - text: The optional radio button string
///   - isChecked: Whether the radio button is checked
///   - isDisabled: Whether the radio button is disabled
///   - callback: Callback that is executed when the component is tapped
///   - accessibilityLabel: A string that identifies the accessibility element

public struct RadioButton: View {
    var text: String?
    @Binding var isChecked: Bool
    @Binding var isDisabled: Bool
    var callback: ((String?) -> ())?
    var accessibilityLabel: String?
    
    public init(text: String?,
                isChecked: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                callback: ((String?) -> ())?,
                accessibilityLabel: String? = nil) {
        self.text = text
        self._isChecked = isChecked
        self._isDisabled = isDisabled
        self.callback = callback
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        Button(action: {
            if !isDisabled {
                if !self.isChecked {
                    self.isChecked = true
                }
                self.callback?(text)
            }
        }, label: {
            // Inside Style
        })
        .buttonStyle(RadioButtonStyle(text: text,
                                      isChecked: isChecked,
                                      isDisabled: $isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
    
    
}
struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RadioButton(text: "Title",
                        isChecked: .constant(false),
                        isDisabled: .constant(false),
                        callback: { _ in
                
            })
            
            RadioButton(text: "Title",
                        isChecked: .constant(true),
                        isDisabled: .constant(false),
                        callback: { _ in
                
            })
            
            RadioButton(text: "Title",
                        isChecked: .constant(true),
                        isDisabled: .constant(true),
                        callback: { _ in
                
            })
            
            RadioButton(text: "Title",
                        isChecked: .constant(false),
                        isDisabled: .constant(true),
                        callback: { _ in
                
            })
        }.padding()
    }
}
