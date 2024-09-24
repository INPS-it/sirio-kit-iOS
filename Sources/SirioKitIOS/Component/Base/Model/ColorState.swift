//
// ColorState.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// This model is used to manage the various component colors states
public struct ColorState {
    public var `default`: Color
    public var disabled: Color
    public var hover: Color
    public var pressed: Color
}
