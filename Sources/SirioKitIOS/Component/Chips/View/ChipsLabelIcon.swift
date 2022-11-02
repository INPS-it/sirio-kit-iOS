//
// ChipsLabelIcon.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio chip with icon and label
/// - Parameters:
///   - text: The string on the chip
///   - icon: The icon at the start of the chip
///   - isDisabled: Whether the chip is isDisabled
///   - selectedType: Manages the activation of the chips
public struct ChipsLabelIcon: View {
    private var text: String
    private var icon: AwesomeIcon
    @Binding private var selectedType: String?
    @Binding private var isDisabled: Bool
    
    public init(text: String,
                icon: AwesomeIcon,
                selectedType: Binding<String?>,
                isDisabled: Binding<Bool> = .constant(false)){
        self.text = text
        self.icon = icon
        self._selectedType = selectedType
        self._isDisabled = isDisabled
    }
    
    public var body: some View {
        Button(action: {
            if selectedType == text {
                selectedType = nil
            } else {
                self.selectedType = text
            }        }, label: {
            // Inside Style
        })
        .buttonStyle(ChipsLabelIconStyle(text: self.text,
                                         icon: self.icon,
                                         isActive: self.text == self.selectedType,
                                         isDisabled: self.$isDisabled))
    }
}

struct ChipsLabelIcon_Preview: PreviewProvider {
    static var previews: some View {
        ChipsLabelIcon_2()
    }
}


struct ChipsLabelIcon_2 : View {
    @State private var selectedType: String? = "Type"
    
    var body: some View {
        ChipsLabelIcon(text: "Chips", icon: .check, selectedType: $selectedType)
    }
}
