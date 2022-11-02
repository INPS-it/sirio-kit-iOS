//
// ChipsOnlyLabel.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio chip with label
/// - Parameters:
///   - text: The string on the chip
///   - isDisabled: Whether the chip is isDisabled
///   - selectedType: Manages the activation of the chips
public struct ChipsOnlyLabel: View {
    private var text: String
    @Binding private var selectedType: String?
    @Binding private var isDisabled: Bool
    
    public init(text: String,
                selectedType: Binding<String?>,
                isDisabled: Binding<Bool> = .constant(false)){
        self.text = text
        self._selectedType = selectedType
        self._isDisabled = isDisabled
    }
    
    public var body: some View {
        Button(action: {
            if selectedType == text {
                selectedType = nil
            } else {
                self.selectedType = text
            }
        }, label: {
            // Inside Style
        })
        .buttonStyle(ChipsOnlyLabelStyle(text: self.text,
                                isActive: self.text == self.selectedType,
                                isDisabled: self.$isDisabled))
    }
}

struct ChipsOnlyLabel_Preview: PreviewProvider {
    static var previews: some View {
        ChipsOnlyLabel_2()
    }
}


struct ChipsOnlyLabel_2 : View {
    @State private var selectedType: String? = "Type"

     var body: some View {
         ChipsOnlyLabel(text: "Chips", selectedType: $selectedType)
     }
}
