//
// SirioModelStepData.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

public struct SirioModelStepData: Identifiable {
    public var id = UUID()
    public var type: SirioStepPointType
    public var stepText: String
    
    public init(type: SirioStepPointType, stepText: String) {
        self.type = type
        self.stepText = stepText
    }
}
