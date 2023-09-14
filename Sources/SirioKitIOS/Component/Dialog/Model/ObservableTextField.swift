//
// ObservableTextField.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// An observable object used by Dialog. Default is nil.
/// - Parameters:
///   - type: The type of the textfield
///   - label: The label above textfield
///   - placeholder: The placeholder of textfield
///   - text: The text of textfield
public class ObservableTextField: ObservableObject {
    @Published var type: SemanticTextField?
    @Published var label: String?
    @Published var placeholder: String?
    @Published var text: String?
    
    public init(type: SemanticTextField? = nil,
                label: String? = nil,
                placeholder: String? = nil,
                text: String? = nil){
        self.type = type
        self.label = label
        self.placeholder = placeholder
        self.text = text
    }
}
