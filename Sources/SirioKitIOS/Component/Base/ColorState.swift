//
// ColorState.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// This model is used to manage the various component colors states
public struct ColorState {
    var `default`: Color
    var disabled: Color
    var hover: Color
    var pressed: Color
}
