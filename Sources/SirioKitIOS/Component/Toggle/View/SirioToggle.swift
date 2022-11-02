//
// SirioToggle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Sirio toggle component
/// - Parameters:
///   - text: The optional toggle string
///   - isOn: Whether the toggle is active
///   - isDisabled: Whether the toggle is disabled
public struct SirioToggle: View {
    var text: String?
    @Binding var isOn: Bool
    @Binding var isDisabled: Bool
    
    public init(text: String? = nil,
                isOn: Binding<Bool>,
                isDisabled: Binding<Bool> = .constant(false)){
        self.text = text
        self._isOn = isOn
        self._isDisabled = isDisabled
    }
    
    public var body: some View {
        
        Button(action: {
            withAnimation {
                if !isDisabled {
                    isOn.toggle()
                }
            }
        }, label: {
            // Inside style
        })
        .buttonStyle(SirioToggleStyle(text: text,
                                      isOn: isOn,
                                      isDisabled: $isDisabled))
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

struct SirioToggle_Previews: PreviewProvider {
    static var previews: some View {
        TestSirioToggle()
    }
}
