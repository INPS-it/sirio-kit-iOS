//
// SirioToggle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Sirio toggle component
/// - Parameters:
///   - text: The optional text displayed next to the toggle.
///   - isOn: A binding that indicates whether the toggle is on or off.
///   - isDisabled: A binding that determines whether the toggle is disabled.
///   - onToggleChanged: A closure called when the toggle state changes.
///   - accessibilityLabel: A string used as an accessibility label for screen readers.

public struct SirioToggle: View {
    var text: String?
    @Binding var isOn: Bool
    @Binding var isDisabled: Bool
    var onToggleChanged: ((Bool) -> Void)?
    var accessibilityLabel: String?

    public init(text: String? = nil,
                isOn: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false),
                onToggleChanged: ((Bool) -> Void)? = nil,
                accessibilityLabel: String? = nil){
        self.text = text
        self._isOn = isOn
        self._isDisabled = isDisabled
        self.onToggleChanged = onToggleChanged
        self.accessibilityLabel = accessibilityLabel
    }
    
    public var body: some View {
        
        Button(action: {
            withAnimation {
                if !isDisabled {
                    isOn.toggle()
                }
                onToggleChanged?(isOn)
            }
        }, label: {
            // Inside style
        })
        .buttonStyle(SirioToggleStyle(text: text,
                                      isOn: isOn,
                                      isDisabled: $isDisabled))
        .setAccessibilityLabel(accessibilityLabel)
    }
}

struct TestSirioToggle: View {
    @State var isOn: Bool = true
    @State var isOff: Bool = false
    
    @State var enabled: Bool = false
    @State var disabled: Bool = true
    
    var body: some View {
        VStack {
            SirioToggle(text: "Title", isOn: $isOn, isDisabled: $enabled)
            SirioToggle(text: "Title", isOn: $isOff, isDisabled: $disabled)
        }
    }
}

#Preview {
    TestSirioToggle()

}
