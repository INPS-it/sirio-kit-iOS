//
// SirioChipsButtonClose.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The close button used by chips
/// - Parameters:
///   - isDisabled: Whether the button is disabled
///   - action: Callback that is executed when the button is tapped

struct SirioChipsButtonClose: View {
    @Binding var isDisabled: Bool
    var action: (() -> Void)?
    
    init(isDisabled: Binding<Bool> = .constant(false),
         action: (() -> Void)? = nil) {
        self._isDisabled = isDisabled
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            // Inside Style
        })
        .buttonStyle(SirioChipsButtonCloseStyle(icon: .times, isDisabled: $isDisabled))
    }
}

#Preview {
    SirioChipsButtonClose()
}
