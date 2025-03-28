//
// SirioStepControlData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

public struct SirioStepControlData: Identifiable {
    public var id = UUID()
    public var text: String
    public var isDisabled: Bool?
    public var action: () -> Void
    
    public init(text: String, isDisabled: Bool, action: @escaping () -> Void) {
        self.init(text: text, action: action)
        self.isDisabled = isDisabled
    }
    
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    static var back: SirioStepControlData = .init(text: "Indietro", isDisabled: false, action: { })
    static var next: SirioStepControlData = .init(text: "Avanti", isDisabled: false, action: { })
    static var salvaBozza: SirioStepControlData = .init(text: "Salva bozza", isDisabled: false, action: { })
    static var annulla: SirioStepControlData = .init(text: "Annulla", isDisabled: false, action: { })
}
