//
// Checkbox.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio checkbox
/// - Parameters:
///   - text: The string checkbox right
///   - isChecked: Whether the checkbox is checked
///   - isDisabled: Whether the checkbox is disabled
///   - callback: The callback when the checkbox state change
public struct Checkbox: View {
    var text: String?
    @Binding var isChecked: Bool
    @Binding var isDisabled: Bool
    var callback: ((String?) -> ())?
    
    public init(text: String?,
                isChecked: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                callback: ((String?) -> ())?) {
        self.text = text
        self._isChecked = isChecked
        self._isDisabled = isDisabled
        self.callback = callback
    }
    
    public var body: some View {
        Button(action: {
            if !isDisabled {
                self.isChecked.toggle()
                self.callback?(text)
            }
        }, label: {
            // Inside Style
        })
        .buttonStyle(CheckboxStyle(text: text, isChecked: isChecked, isDisabled: $isDisabled))
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 4) {
            
            Checkbox(text: "Title",
                     isChecked: .constant(false),
                     isDisabled: .constant(false),
                     callback: { _ in
                
            })
            
            Checkbox(text: "Title",
                     isChecked: .constant(true),
                     isDisabled: .constant(false),
                     callback: { _ in
                
            })
            
            Checkbox(text: "Title",
                     isChecked: .constant(true),
                     isDisabled: .constant(true),
                     callback: { _ in
                
            })
            
            Checkbox(text: "Title",
                     isChecked: .constant(false),
                     isDisabled: .constant(true),
                     callback: { _ in
                
            })
        }.padding()
    }
}
