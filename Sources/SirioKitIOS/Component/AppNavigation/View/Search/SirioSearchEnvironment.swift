//
// SirioSearchEnvironment.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// An observable object used by search bar
public class SirioSearchEnvironment: ObservableObject {
    @Published public var text: String // Search text

    public init(){
        self.text = ""
    }
}
