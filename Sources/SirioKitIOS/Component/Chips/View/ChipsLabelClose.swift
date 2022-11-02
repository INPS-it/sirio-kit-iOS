//
// ChipsLabelClose.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio chip with label and close button
/// - Parameters:
///   - text: The string on the chip
///   - isDisabled: Whether the chip is isDisabled
///   - onTapChips: Callback that is executed when the chips is tapped
///   - onTapClose: Callback that is executed when the close button is tapped
public struct ChipsLabelClose: View {
    private var text: String
    @Binding private var isDisabled: Bool
    private var onTapChips: (() -> Void)?
    private var onTapClose: (() -> Void)?
    
    public init(text: String,
                isDisabled: Binding<Bool> = .constant(false),
                onTapChips: (() -> Void)? = nil,
                onTapClose: (() -> Void)? = nil){
        self.text = text
        self._isDisabled = isDisabled
        self.onTapChips = onTapChips
        self.onTapClose = onTapClose
        
    }
    
    public var body: some View {
        Button(action: {
            self.onTapChips?()
        }, label: {
            // Inside Style
        })
        .buttonStyle(ChipsLabelCloseStyle(text: self.text,
                                          isDisabled: self.$isDisabled,
                                          onTapClose: self.onTapClose))
    }
}

struct ChipsLabelClose_Preview: PreviewProvider {
    static var previews: some View {
        ChipsLabelClose(text: "Chips")
    }
}
