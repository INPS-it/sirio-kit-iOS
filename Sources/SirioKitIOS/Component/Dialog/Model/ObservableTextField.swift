//
// ObservableTextField.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
    @Published public var type: SemanticTextField?
    @Published public var label: String?
    @Published public var placeholder: String?
    @Published public var text: String?
    
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
