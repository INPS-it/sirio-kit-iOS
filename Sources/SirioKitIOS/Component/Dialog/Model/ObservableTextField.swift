//
// ObservableTextField.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
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
    
    public init(type: SemanticTextField? = .info,
                label: String? = nil,
                placeholder: String? = nil,
                text: String? = nil){
        self.type = type
        self.label = label
        self.placeholder = placeholder
        self.text = text
    }
    
    public func isEmpty() -> Bool {
        if let label = label,
           let _ = type,
           let placeholder = placeholder,
           let _ = text {
            return false
        }
        return true
    }
}
